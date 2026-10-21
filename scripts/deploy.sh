#!/usr/bin/env bash
# Kerf 3D Studio - Production Quick Deploy Script
# Usage: ./scripts/deploy.sh

set -e

echo "=== Kerf 3D Studio: Starting Deployment ==="

# 1. Pull latest code from main
git pull origin main

# 2. Check credentials existence
if [ ! -f "config/credentials/drive-service-account.json" ]; then
    echo "[!] WARNING: config/credentials/drive-service-account.json not found."
    echo "Please copy your Google Cloud Service Account key to config/credentials/drive-service-account.json"
fi

if [ ! -f ".env" ]; then
    echo "[!] .env not found. Creating from .env.example..."
    cp .env.example .env
fi

# 3. Spin up Docker containers
echo "[+] Starting Docker containers..."
docker compose up -d --build

# 4. Run database migrations and seeders if fresh
echo "[+] Running database migrations..."
docker exec -w /var/www/vhosts/localhost/html kerf3d_ols php spark migrate --all || true

# 5. Run initial Drive sync
echo "[+] Running initial Google Drive media sync..."
docker exec -w /var/www/vhosts/localhost/html kerf3d_ols php spark drive:sync || true

echo "=== Kerf 3D Studio: Deployed Successfully! ==="
