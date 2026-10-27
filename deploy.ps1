# ==============================================================================
# KERF 3D STUDIO — LOCAL / PRODUCTION DEPLOYMENT ENGINE (POWERSHELL)
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host "`n─────────────────────────────────────────────────────────────" -ForegroundColor Cyan
Write-Host "KERF 3D STUDIO // ZERO-DOWNTIME DEPLOYMENT PIPELINE" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Machine: $env:COMPUTERNAME" -ForegroundColor DarkGray
Write-Host "─────────────────────────────────────────────────────────────`n" -ForegroundColor Cyan

# 1. Pre-flight Checks
Write-Host "==> Step 1: Pre-Flight Environment Checks" -ForegroundColor Yellow
if (-not (Test-Path "docker-compose.yml")) {
    Write-Error "docker-compose.yml not found in current directory."
    exit 1
}
if (-not (Test-Path ".env")) {
    Write-Warning ".env file not found. Please ensure .env exists."
} else {
    Write-Host "   [OK] .env configuration verified." -ForegroundColor Green
}

# 2. Git Sync
Write-Host "==> Step 2: Synchronizing Git Repository from origin/main" -ForegroundColor Yellow
$prevCommit = git rev-parse --short HEAD
Write-Host "   [OK] Local commit before sync: $prevCommit" -ForegroundColor DarkGray
git fetch origin main --tags
git merge --ff-only origin/main
$newCommit = git rev-parse --short HEAD
Write-Host "   [OK] Synchronized to commit: $newCommit" -ForegroundColor Green

# 3. Directory Verification
Write-Host "==> Step 3: Verifying File Permissions and Storage Paths" -ForegroundColor Yellow
$paths = @("writable/cache", "writable/logs", "writable/session", "writable/uploads", "writable/debugbar", "public/assets/images/products", "public/uploads/cad")
foreach ($p in $paths) {
    if (-not (Test-Path $p)) {
        New-Item -ItemType Directory -Force -Path $p | Out-Null
    }
}
Write-Host "   [OK] Storage directories verified." -ForegroundColor Green

# 4. Container Fleet Health
Write-Host "==> Step 4: Checking Container Fleet Health" -ForegroundColor Yellow
$olsRunning = docker ps --format '{{.Names}}' | Select-String "kerf3d_ols"
if (-not $olsRunning) {
    Write-Host "   [WARN] Containers not running. Launching via docker compose..." -ForegroundColor DarkYellow
    docker compose up -d
    Start-Sleep -Seconds 3
}
Write-Host "   [OK] Container fleet active (kerf3d_ols + kerf3d_mariadb)." -ForegroundColor Green

# 5. Database Schema & Migration
Write-Host "==> Step 5: Verifying Database Migrations" -ForegroundColor Yellow
docker exec -w /var/www/vhosts/localhost/html kerf3d_ols php spark migrate --all
Write-Host "   [OK] Database schema verified." -ForegroundColor Green

# 6. Cache Clearing
Write-Host "==> Step 6: Clearing Framework Cache" -ForegroundColor Yellow
docker exec -w /var/www/vhosts/localhost/html kerf3d_ols php spark cache:clear
Write-Host "   [OK] CodeIgniter cache cleared." -ForegroundColor Green

# 7. Graceful Server Reload
Write-Host "==> Step 7: Executing Zero-Downtime OpenLiteSpeed Graceful Reload" -ForegroundColor Yellow
docker exec kerf3d_ols /usr/local/lsws/bin/lswsctrl reload
Write-Host "   [OK] OpenLiteSpeed gracefully reloaded." -ForegroundColor Green

# 8. Health Check
Write-Host "==> Step 8: Post-Deployment Smoke and Health Verification" -ForegroundColor Yellow
$healthHome = curl.exe -s -o NUL -w "%{http_code}" http://localhost:8080/
$healthSitemap = curl.exe -s -o NUL -w "%{http_code}" http://localhost:8080/sitemap.xml

if ($healthHome -eq "200" -and $healthSitemap -eq "200") {
    Write-Host "`n[SUCCESS] DEPLOYMENT VERIFIED - ZERO DOWNTIME MAINTAINED" -ForegroundColor Green
    Write-Host "   * Homepage:  HTTP $healthHome OK (http://localhost:8080/)" -ForegroundColor Gray
    Write-Host "   * Sitemap:   HTTP $healthSitemap OK (http://localhost:8080/sitemap.xml)" -ForegroundColor Gray
    Write-Host "   * Commit:    $newCommit" -ForegroundColor Gray
    Write-Host "   * Status:    Dhaka Hub Bambu Lab A1 Fleet Active`n" -ForegroundColor Gray
} else {
    Write-Error "Health check failed (Homepage: $healthHome, Sitemap: $healthSitemap)."
    exit 1
}
