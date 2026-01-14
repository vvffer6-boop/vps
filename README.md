# Self-Hosted Web Application

A static web application configured for self-hosted VPS deployment.

## Project Structure

```
.
├── css/
│   └── style.css
├── js/
│   └── main.js
├── scripts/
│   ├── deploy.sh
│   └── setup-vps.sh
├── .github/
│   └── workflows/
│       └── deploy.yml
├── index.html
└── README.md
```

## VPS Setup

### Prerequisites

- Ubuntu 20.04+ VPS
- SSH access with sudo privileges
- Domain name (optional)

### Initial Server Setup

1. SSH into your VPS
2. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git /home/deploy/app
   ```
3. Run the setup script:
   ```bash
   cd /home/deploy/app
   chmod +x scripts/setup-vps.sh
   ./scripts/setup-vps.sh
   ```

### SSL Configuration (Optional)

Install Certbot and configure SSL:

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
```

## GitHub Actions Deployment

### Required Secrets

Add these secrets to your GitHub repository (Settings > Secrets and variables > Actions):

| Secret | Description |
|--------|-------------|
| `VPS_HOST` | Server IP address or domain |
| `VPS_USERNAME` | SSH username |
| `VPS_SSH_KEY` | Private SSH key for authentication |
| `VPS_PORT` | SSH port (usually 22) |
| `VPS_DEPLOY_PATH` | Path where repo is cloned (e.g., /home/deploy/app) |

### Deployment Process

1. Push changes to the `main` branch
2. GitHub Actions connects to VPS via SSH
3. Pulls latest changes and runs deploy script
4. Files are synced to `/var/www/html/`
5. Nginx is reloaded

## Manual Deployment

SSH into your server and run:

```bash
cd /home/deploy/app
git pull origin main
./scripts/deploy.sh
```

## License

MIT
