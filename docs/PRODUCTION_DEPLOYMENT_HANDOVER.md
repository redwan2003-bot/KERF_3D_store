# Kerf 3D Studio — Production Server Handover & Deployment Guide

This document is specifically prepared for the **Server Administrator / Senior Colleague** hosting the site on a shared VPS. 

Because this VPS hosts other services, **Kerf 3D is designed to be 100% self-contained and isolated** inside lightweight Docker containers or a dedicated virtual host, ensuring zero port conflicts, zero dependency interference, and zero file pollution.

---

## Architecture at a Glance

* **Application**: CodeIgniter 4.7.5 (PHP 8.2) + MariaDB 10.11
* **Web Server**: High-performance OpenLiteSpeed
* **Media / Images**: Stored strictly in Google Drive (`/KERF_3D_MEDIA/Products/`), served via zero-bandwidth Google CDN URLs. Zero image storage overhead on the server disk!
* **Default Container Ports**:
  * HTTP Web: `8080` (or any custom port assigned by the server administrator)
  * MariaDB: `3306` (isolated within Docker bridge network `kerf3d_net`)
  * LiteSpeed Admin: `7080`

---

## Option 1: Docker Deployment (Recommended — 100% Isolated)

If the server has Docker & Docker Compose installed, Kerf 3D can run independently without touching the host's PHP or database configurations.

### 1. Clone the Repository
```bash
git clone https://github.com/redwan2003-bot/KERF_3D_store.git /var/www/kerf3d
cd /var/www/kerf3d
```

### 2. Configure Environment (`.env`)
Copy the production environment template:
```bash
cp .env.example .env
```
Key settings to verify in `.env`:
```ini
CI_ENVIRONMENT = production
app.baseURL = 'https://YOUR_DOMAIN/'

# MariaDB credentials (internal to Docker network)
database.default.hostname = db
database.default.database = kerf3d
database.default.username = kerf3d_user
database.default.password = kerf3d_secret_CHANGE_THIS

# MFS Payment intake numbers
BKASH_ACCOUNT_NUMBER = '01XXXXXXXXX'
NAGAD_ACCOUNT_NUMBER = '01XXXXXXXXX'
```

### 3. Place Google Drive Service Account Key
Ensure `drive-service-account.json` is placed in:
```
/var/www/kerf3d/config/credentials/drive-service-account.json
```

### 4. Custom Host Port (If Port 8080 is already used on the VPS)
In `docker-compose.yml`, change the host port mapping if needed:
```yaml
ports:
  - "8088:80"    # Change 8088 to any available port on the host
```

### 5. Launch Containers
```bash
docker compose up -d
```

---

## Option 2: Nginx / Reverse Proxy Configuration

If the host server runs Nginx (or Caddy / Apache / Cloudflare) to route traffic to multiple domains, add this simple reverse proxy block for the domain:

### Nginx Virtual Host Snippet:
```nginx
server {
    server_name kerf3d.store www.kerf3d.store; # Replace with target domain

    location / {
        proxy_pass http://127.0.0.1:8080;      # Port mapped in docker-compose.yml
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 90;
        client_max_body_size 128M;              # Allows customer CAD STL uploads
    }
}
```

### Enable SSL with Certbot (Let's Encrypt):
```bash
certbot --nginx -d kerf3d.store -d www.kerf3d.store
```

---

## Option 3: Automated Hourly Google Drive Sync (Crontab)

To ensure that any product photos added to Google Drive are automatically synced to the website catalog every hour:

Add this single line to the server's crontab (`crontab -e`):
```bash
0 * * * * docker exec -w /var/www/vhosts/localhost/html kerf3d_ols php spark drive:sync > /dev/null 2>&1
```

---

## Checklist to Hand Over to the Server Administrator

When asking your brother/colleague to connect the site, you only need to provide:

1. **Repository Link**: `https://github.com/redwan2003-bot/KERF_3D_store.git`
2. **Your Domain Name**: (e.g. `kerf3d.store` or whatever domain you own)
3. **The `drive-service-account.json` file**: (Send securely via private message)
4. **Your bKash & Nagad Numbers**: To record in `.env`
5. **This Document Link**: [PRODUCTION_DEPLOYMENT_HANDOVER.md](docs/PRODUCTION_DEPLOYMENT_HANDOVER.md)
