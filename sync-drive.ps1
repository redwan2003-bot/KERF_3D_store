<#
.SYNOPSIS
    Automated Google Drive Asset Synchronization Engine for Kerf 3D Studio.
.DESCRIPTION
    Runs php spark drive:sync inside the running kerf3d_ols container.
.EXAMPLE
    .\sync-drive.ps1
    .\sync-drive.ps1 -InitFolders
    .\sync-drive.ps1 -Product arc-vessel
#>

[CmdletBinding()]
param (
    [switch]$InitFolders,
    [string]$Product
)

$ErrorActionPreference = "Stop"

$AppContainer = "kerf3d_ols"
$StartTime = Get-Date

Write-Host ""
Write-Host "==> Starting Google Drive Asset Sync [$($StartTime.ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss UTC'))]..." -ForegroundColor Cyan

# Check Docker container
$running = docker ps --format "{{.Names}}" | Select-String "^$AppContainer$"
if (-not $running) {
    Write-Host "   [ERROR] Application container '$AppContainer' is not running." -ForegroundColor Red
    exit 1
}

$cliArgs = @("drive:sync")
if ($InitFolders) {
    $cliArgs += "--init-folders"
}
if ($Product) {
    $cliArgs += "--product=$Product"
}

Write-Host "   Executing: php spark $($cliArgs -join ' ')" -ForegroundColor DarkGray
docker exec -w /var/www/vhosts/localhost/html $AppContainer php spark @cliArgs

$Duration = [Math]::Round(((Get-Date) - $StartTime).TotalSeconds, 1)
Write-Host "   [OK] Google Drive synchronization completed in ${Duration}s." -ForegroundColor Green
Write-Host "==============================================================================" -ForegroundColor DarkGray
Write-Host ""
