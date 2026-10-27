# ==============================================================================
# KERF 3D STUDIO — AUTOMATED DATABASE BACKUP (POWERSHELL)
# ==============================================================================

$ErrorActionPreference = "Stop"

$backupDir = "backups\db"
if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$rawFile = "$backupDir\kerf3d_$timestamp.sql"

$dbContainer = "kerf3d_mariadb"
$dbName = "kerf3d"
$dbUser = "root"
$dbPass = "kerf3d_root_password"

Write-Host "==> Starting MariaDB Database Backup for [$dbName]..." -ForegroundColor Cyan

# Execute dump inside MariaDB container
docker exec $dbContainer mysqldump -u $dbUser "-p$dbPass" --single-transaction --quick $dbName > $rawFile

$fileItem = Get-Item $rawFile
$fileSizeKb = [math]::Round($fileItem.Length / 1KB, 2)

Write-Host "   [OK] Backup generated: $rawFile ($fileSizeKb KB)" -ForegroundColor Green

# Retention: Remove backups older than 14 days
$limit = (Get-Date).AddDays(-14)
Get-ChildItem -Path $backupDir -Filter "kerf3d_*.sql*" | Where-Object { $_.LastWriteTime -lt $limit } | Remove-Item -Force

$totalCount = (Get-ChildItem -Path $backupDir -Filter "kerf3d_*.sql*").Count
Write-Host "   [OK] Total active backups in archive: $totalCount" -ForegroundColor Green
Write-Host "`n[SUCCESS] DATABASE BACKUP COMPLETE" -ForegroundColor Green
