# Paperclip Deployment Guide

## Prerequisites

| Requirement | Version | Check |
|:-----------:|:-------:|:-----:|
| Node.js | 24.11+ | `node --version` |
| npm | 10+ | `npm --version` |
| PostgreSQL | 16+ | `psql --version` |
| RAM | 2GB+ | `free -h` |

## Step 1: Install Paperclip

### Option A — One-Command Install (Recommended)

```bash
# Download and verify installer
curl -fsSLO https://paperclip.ing/install.sh
curl -fsSLO https://paperclip.ing/install.sh.sha256
sha256sum -c install.sh.sha256

# Run installer
bash install.sh
```

This installs the Paperclip CLI under `~/.paperclip/cli` and starts interactive onboarding.

### Option B — Automated Non-Interactive Install

```bash
curl -fsSL https://paperclip.ing/install.sh | bash -s -- --no-prompt --no-onboard
paperclipai onboard --yes
```

### Option C — From Source

```bash
# Clone latest release
git clone --depth 1 https://github.com/paperclipai/paperclip.git
cd paperclip

# Install pnpm
npm install -g pnpm

# Install dependencies
pnpm install

# Run database migrations
pnpm run db:migrate

# Start
pnpm run dev:both
```

## Step 2: Configure PostgreSQL

```bash
# Create database
createdb paperclip

# Or via Docker
docker run -d \
  --name paperclip-db \
  -e POSTGRES_DB=paperclip \
  -e POSTGRES_USER=paperclip \
  -e POSTGRES_PASSWORD=paperclip \
  -p 5432:5432 \
  postgres:16
```

## Step 3: Onboard Your First Company

```bash
paperclipai onboard
```

The interactive setup walks you through:
1. Database connection
2. Admin user creation
3. First company setup
4. Agent configuration

## Step 4: Import Sample Company

Import the sample "AgenticPH Marketing Agency" from this repo:

```bash
paperclipai company import sample-company/agenticph-agency.json
```

## Step 5: Deploy to Production

### VPS Setup (Ubuntu/Debian)

```bash
# Install as background service
bash install.sh --no-onboard
paperclipai service install
paperclipai service start

# Check status
paperclipai service status

# View logs
journalctl -u paperclip -f
```

### Reverse Proxy (Nginx)

```nginx
server {
    listen 80;
    server_name paperclip.yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### SSL (Certbot)

```bash
sudo certbot --nginx -d paperclip.yourdomain.com
```

## Step 6: Access Dashboard

- **UI:** `http://localhost:3000` (or your domain)
- **Mobile:** Same URL, responsive design
- **API:** `http://localhost:3000/api`

## Production Checklist

- [ ] PostgreSQL with persistent storage
- [ ] SSL/TLS certificate installed
- [ ] Environment variables configured (database URL, auth secret)
- [ ] Regular backups scheduled
- [ ] Monitoring set up (uptime, costs, agent activity)
- [ ] User access controls configured
- [ ] Budget limits configured for all agents
- [ ] Governance rules reviewed and tested

## Troubleshooting

| Problem | Likely Cause | Solution |
|:-------:|:------------|:---------|
| `npx paperclipai` hangs | npm registry network issue | Check `npm ping`, try VPN or alternative registry |
| Database connection error | PostgreSQL not running | `systemctl start postgresql` |
| Agent not responding | Budget exhausted | Top up agent budget in dashboard |
| Heartbeat timeout | Agent process crashed | Restart agent or check agent logs |
| UI not loading | Build incomplete | `pnpm run build` or check `pnpm run dev:ui` |

## Architecture Diagram

```
┌─────────────────────────────────────────────────────┐
│                    Your Server                       │
│                                                      │
│  ┌────────────────┐    ┌────────────────────────┐   │
│  │  Paperclip UI   │    │    Paperclip Server    │   │
│  │  (React, :3000) │◄──►│   (Node.js/Express)   │   │
│  └────────────────┘    └──────────┬─────────────┘   │
│                                   │                  │
│                          ┌────────▼────────┐         │
│                          │   PostgreSQL    │         │
│                          │    (Database)   │         │
│                          └─────────────────┘         │
│                                                      │
│  ┌────────────────────────────────────────────┐      │
│  │           Agent Runtimes                    │      │
│  │  ┌────────┐ ┌────────┐ ┌────────┐          │      │
│  │  │Claude  │ │ Codex  │ │OpenClaw│   ...    │      │
│  │  │ Codex  │ │  API   │ │ HTTP   │          │      │
│  │  └────────┘ └────────┘ └────────┘          │      │
│  └────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────┘
```
