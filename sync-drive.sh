#!/usr/bin/env bash
# ==============================================================================
# KERF 3D STUDIO — AUTOMATED GOOGLE DRIVE ASSET SYNCHRONIZATION ENGINE
# ==============================================================================
# Usage:
#   ./sync-drive.sh                   # Standard catalog image synchronization
#   ./sync-drive.sh --init-folders    # Auto-initialize category-nested Drive folders
#   ./sync-drive.sh --product=<slug>  # Synchronize a specific product
#
# Recommended Crontab (Nightly at 03:00 AM UTC+6):
#   0 3 * * * /var/www/vhosts/localhost/html/sync-drive.sh >> /var/log/kerf3d_drive_sync.log 2>&1
# ==============================================================================

set -euo pipefail

# ANSI Styling
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_GREEN="\033[38;5;82m"
COLOR_CYAN="\033[38;5;75m"
COLOR_YELLOW="\033[38;5;220m"
COLOR_MUTED="\033[38;5;244m"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

APP_CONTAINER="kerf3d_ols"
START_TIME=$(date +%s)
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

echo -e "\n${COLOR_BOLD}${COLOR_CYAN}==>${COLOR_RESET} ${COLOR_BOLD}Starting Google Drive Asset Sync [${TIMESTAMP}]...${COLOR_RESET}"

# Verify app container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${APP_CONTAINER}$"; then
    echo -e "   [ERROR] Application container '${APP_CONTAINER}' is not running." >&2
    exit 1
fi

# Execute CodeIgniter Spark Drive Sync inside container
echo -e "   ${COLOR_MUTED}Executing:${COLOR_RESET} php spark drive:sync $@"
docker exec -w /var/www/vhosts/localhost/html "$APP_CONTAINER" php spark drive:sync "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo -e "   ${COLOR_GREEN}✓${COLOR_RESET} Google Drive synchronization completed in ${DURATION}s."
echo -e "${COLOR_MUTED}==============================================================================${COLOR_RESET}\n"
