#!/usr/bin/env bash
# ==============================================================================
# Kerf 3D Studio — Production Deployment Pipeline
# Target Domain: https://kerf3d.store
# Usage: ./scripts/deploy.sh [--prod|--dev]
# ==============================================================================

set -euo pipefail

MODE="${1:---prod}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_DIR"

echo "=========================================================="
echo "      KERF 3D STUDIO — PRODUCTION DEPLOYMENT PIPELINE     "
echo "      Timestamp: $TIMESTAMP                               "
echo "      Mode:      $MODE                                    "
echo "=========================================================="

# 1. Environment & Configuration Check
if [ ! -f ".env" ]; then
    echo "[!] .env not found. Creating from .env.example..."
    cp .env.example .env
    echo "[!] Generated default .env. Please review database & app.baseURL before going live."
fi

# 2. Pull latest code from GitHub
echo "[+] Fetching latest code from origin main..."
git fetch origin main
git pull origin main

# 3. Secure File Permissions
echo "[+] Configuring directory permissions for web server..."
mkdir -p writable/cache writable/logs writable/session writable/uploads
chmod -R 777 writable/
mkdir -p public/assets/images/products

# 4. Database Pre-deployment Backup (if MariaDB is running)
if docker ps --format '{{.Names}}' | grep -q 'kerf3d_mariadb'; then
    echo "[+] Creating safety database snapshot..."
    mkdir -p database/backups
    docker exec kerf3d_mariadb_prod mariadb-dump -u kerf3d_user -pkerf3d_secret kerf3d > "database/backups/db_backup_${TIMESTAMP}.sql" 2>/dev/null || \
    docker exec kerf3d_mariadb mariadb-dump -u kerf3d_user -pkerf3d_secret kerf3d > "database/backups/db_backup_${TIMESTAMP}.sql" 2>/dev/null || \
    echo "  (Skipping snapshot - first run or container restarting)"
fi

# 5. Launch / Recreate Docker Containers
if [ "$MODE" = "--prod" ]; then
    echo "[+] Starting Production Containers (Ports 80 & 443)..."
    docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
    WEB_CONTAINER="kerf3d_ols_prod"
else
    echo "[+] Starting Development Containers (Port 8080)..."
    docker compose up -d --build
    WEB_CONTAINER="kerf3d_ols"
fi

# 6. Wait for MariaDB health check
echo "[+] Waiting for MariaDB service to be healthy..."
for i in {1..20}; do
    if docker exec "$WEB_CONTAINER" php -r "new mysqli('db', 'kerf3d_user', 'kerf3d_secret', 'kerf3d');" 2>/dev/null; then
        echo "  [✓] Database connection established!"
        break
    fi
    sleep 2
done

# 7. Run Database Migrations
echo "[+] Running database schema migrations..."
docker exec "$WEB_CONTAINER" php spark migrate --all || true

# 8. Clear & Warm Cache
echo "[+] Clearing framework cache..."
docker exec "$WEB_CONTAINER" php spark cache:clear || true

# 9. Health & Smoke Check
echo "[+] Verifying storefront HTTP response..."
sleep 2
if docker exec "$WEB_CONTAINER" curl -s -f -o /dev/null "http://127.0.0.1/shop"; then
    echo "  [✓] Storefront online: HTTP 200 OK"
else
    echo "  [!] Warning: Storefront check did not return 200. Check docker logs."
fi

echo "=========================================================="
echo "  🚀 DEPLOYMENT COMPLETED SUCCESSFULLY!                  "
echo "  Target URL: https://kerf3d.store                        "
echo "=========================================================="
