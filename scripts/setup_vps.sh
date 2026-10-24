#!/usr/bin/env bash
# ==============================================================================
# Kerf 3D Studio — Fresh Ubuntu VPS Initializer
# Run this once on a clean Ubuntu 22.04 / 24.04 LTS server.
# Usage: sudo bash scripts/setup_vps.sh
# ==============================================================================

set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: Please run this script as root (sudo bash scripts/setup_vps.sh)"
    exit 1
fi

echo "=========================================================="
echo "    KERF 3D STUDIO — UBUNTU VPS PROVISIONING SCRIPT       "
echo "=========================================================="

# 1. System Package Updates
echo "[+] Updating apt repositories..."
apt-get update && apt-get upgrade -y

# 2. Install Essential Tools
echo "[+] Installing core utilities (curl, git, ufw, certbot)..."
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    ufw \
    certbot \
    python3-certbot

# 3. Install Docker & Docker Compose Plugin
if ! command -v docker &> /dev/null; then
    echo "[+] Installing official Docker Engine..."
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl enable docker
    systemctl start docker
    echo "  [✓] Docker installed successfully."
else
    echo "  [✓] Docker is already installed."
fi

# 4. Firewall Configuration (UFW)
echo "[+] Configuring UFW firewall rules..."
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp comment 'SSH'
ufw allow 80/tcp comment 'HTTP Web'
ufw allow 443/tcp comment 'HTTPS Secure Web'
echo "y" | ufw enable || true
ufw status verbose

# 5. Automated Daily Database Backup Cron
echo "[+] Setting up automated daily database backup cron job..."
cat << 'EOF' > /etc/cron.daily/kerf3d_backup
#!/usr/bin/env bash
BACKUP_DIR="/var/backups/kerf3d"
mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
docker exec kerf3d_mariadb_prod mariadb-dump -u kerf3d_user -pkerf3d_secret kerf3d 2>/dev/null | gzip > "$BACKUP_DIR/db_$TIMESTAMP.sql.gz" || true
# Keep only last 14 days of backups
find "$BACKUP_DIR" -type f -name "*.sql.gz" -mtime +14 -delete
EOF
chmod +x /etc/cron.daily/kerf3d_backup

echo "=========================================================="
echo "  [✓] VPS INITIALIZATION COMPLETE!                        "
echo "  Next steps:                                             "
echo "  1. Clone repo: git clone <REPO_URL> /var/www/kerf3d     "
echo "  2. cd /var/www/kerf3d && cp .env.example .env           "
echo "  3. Issue SSL: certbot certonly --standalone -d kerf3d.store -d www.kerf3d.store"
echo "  4. Run: ./scripts/deploy.sh                             "
echo "=========================================================="
