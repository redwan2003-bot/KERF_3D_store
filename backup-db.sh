#!/usr/bin/env bash
# ==============================================================================
# KERF 3D STUDIO — AUTOMATED NIGHTLY DATABASE BACKUP ENGINE
# ==============================================================================

set -euo pipefail

# ANSI Styling
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_GREEN="\033[38;5;82m"
COLOR_CYAN="\033[38;5;75m"
COLOR_MUTED="\033[38;5;244m"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

BACKUP_DIR="backups/db"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date -u +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/kerf3d_${TIMESTAMP}.sql.gz"

# Defaults
DB_CONTAINER="kerf3d_mariadb"
DB_NAME="kerf3d"
DB_USER="root"
DB_PASS="kerf3d_root_password"

# Extract credentials from .env if available
if [ -f ".env" ]; then
    ENV_DB_NAME=$(grep -E "^database\.default\.database\s*=" .env | cut -d'=' -f2 | tr -d ' "' | tr -d "'" || true)
    ENV_ROOT_PASS=$(grep -E "^MYSQL_ROOT_PASSWORD\s*=" .env | cut -d'=' -f2 | tr -d ' "' | tr -d "'" || true)

    [ -n "$ENV_DB_NAME" ] && DB_NAME="$ENV_DB_NAME"
    [ -n "$ENV_ROOT_PASS" ] && DB_PASS="$ENV_ROOT_PASS"
fi

echo -e "\n${COLOR_BOLD}${COLOR_CYAN}==>${COLOR_RESET} ${COLOR_BOLD}Starting Nightly MariaDB Backup for [${DB_NAME}]...${COLOR_RESET}"

# Verify container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${DB_CONTAINER}$"; then
    echo -e "   [ERROR] Database container '${DB_CONTAINER}' is not running." >&2
    exit 1
fi

# Execute dump and gzip stream
docker exec "$DB_CONTAINER" mysqldump -u "$DB_USER" -p"$DB_PASS" \
    --single-transaction \
    --quick \
    --routines \
    --triggers \
    "$DB_NAME" | gzip -9 > "$BACKUP_FILE"

FILE_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)

echo -e "   ${COLOR_GREEN}✓${COLOR_RESET} Backup archived: ${BACKUP_FILE} (${FILE_SIZE})"

# Retention Policy: Prune backups older than 14 days
DELETED_COUNT=$(find "$BACKUP_DIR" -name "kerf3d_*.sql.gz" -type f -mtime +14 -delete -print | wc -l)
if [ "$DELETED_COUNT" -gt 0 ]; then
    echo -e "   ${COLOR_MUTED}• Pruned ${DELETED_COUNT} archive(s) older than 14 days.${COLOR_RESET}"
fi

TOTAL_BACKUPS=$(find "$BACKUP_DIR" -name "kerf3d_*.sql.gz" -type f | wc -l)
echo -e "   ${COLOR_GREEN}✓${COLOR_RESET} Total active backups in archive: ${TOTAL_BACKUPS}"
echo -e "${COLOR_BOLD}${COLOR_GREEN}✔ DATABASE BACKUP COMPLETE${COLOR_RESET}\n"
