# Paperclip — Autonomous AI Company Orchestrator

[![Status: Demo-ready](https://img.shields.io/badge/status-demo--ready-22c55e.svg)](https://github.com/agenticph-labs/p7-paperclip)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Portfolio Project 7:** Paperclip deployment, configuration, and management for autonomous AI organizations.

| Status | Repo | Type |
|:------:|:----:|:----:|
| ✅ Complete | `agenticph-labs/p7-paperclip` | Portfolio + Service |

## Overview

**Paperclip** is the open-source orchestration platform for teams of AI agents (79K+ GitHub stars). It provides org charts, goal alignment, cost controls, governance, and ticketing — everything needed to run an autonomous AI company.

This project demonstrates:

- **Deployment** — Full Paperclip server setup with PostgreSQL, auth, and mobile UI
- **Configuration** — Sample autonomous company with org chart, agent definitions, goals, and budgets
- **Service Blueprint** — "I set up Paperclip systems for PH businesses" — recurring service offering

## Architecture

```
┌──────────────────────────────────────────────────────────────┐
│                       PAPERCLIP SERVER                       │
│                                                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  │
│  │Identity & │  │  Work &   │  │ Heartbeat │  │Governance │  │
│  │  Access   │  │   Tasks   │  │ Execution │  │& Approvals│  │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘  │
│                                                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  │
│  │ Org Chart │  │Workspaces │  │  Plugins  │  │  Budget   │  │
│  │ & Agents  │  │ & Runtime │  │           │  │ & Costs   │  │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘  │
│                                                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  │
│  │ Routines  │  │ Secrets & │  │ Activity  │  │  Company  │  │
│  │& Schedules│  │  Storage  │  │ & Events  │  │Portability│  │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘  │
└──────────────────────────────────────────────────────────────┘
         ▲              ▲              ▲              ▲
         │              │              │              │
         ▼              ▼              ▼              ▼
┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐
│ Claude   │  │ Codex    │  │ OpenClaw │  │ Bash     │
│ Codex    │  │ API      │  │ HTTP     │  │ Custom   │
│ Cursor   │  │          │  │          │  │ Agent    │
└──────────┘  └──────────┘  └──────────┘  └──────────┘
```

## Sample Company: AgenticPH Marketing Agency

The included sample company configuration demonstrates a fully operational AI agency:

| Role | Agent Type | Budget | Responsibilities |
|:----:|:----------:|:-----:|------------------|
| **CEO** | OpenClaw | $60/mo | Strategy, delegation, board reporting |
| **CMO** | Claude Code | $40/mo | Campaign strategy, content calendar |
| **CTO** | Codex | $50/mo | Tech stack, automation pipeline |
| **COO** | Claude Code | $30/mo | Operations, vendor management |
| **Content Writer** | OpenClaw | $20/mo | Blog posts, social media |
| **Data Analyst** | Claude Code | $25/mo | Reports, dashboards, insights |

### Company Goals

1. **Mission:** "Make $1M ARR with the #1 AI note-taking app"
2. **Project Goals:** Ship collaboration features, reach 10K users
3. **Agent Goals:** Real-time sync, WebSocket handler, document updates

## Deployment

### Prerequisites

- Node.js 24.11+ (v26.5.1 tested)
- npm 11+
- PostgreSQL 16+
- A VPS or cloud VM (2GB RAM minimum)
- A domain (optional, for production)

### Quick Install

```bash
# One-command install
curl -fsSL https://paperclip.ing/install.sh | bash -s -- --no-prompt --no-onboard

# Then onboard interactively
paperclipai onboard

# Or non-interactive
paperclipai onboard --yes
```

### Manual Setup

```bash
# Clone repo
git clone https://github.com/paperclipai/paperclip.git
cd paperclip

# Install pnpm
npm install -g pnpm

# Install dependencies
pnpm install

# Set up database
pnpm run db:migrate

# Start
pnpm run dev:server
pnpm run dev:ui
```

### Docker Deployment

```bash
# Pull and run with PostgreSQL
docker run -d \
  --name paperclip-db \
  -e POSTGRES_DB=paperclip \
  -e POSTGRES_USER=paperclip \
  -e POSTGRES_PASSWORD=paperclip \
  -p 5432:5432 \
  postgres:16

# Run Paperclip
npx paperclipai onboard --yes
```

## Service Offering

### "I set up Paperclip systems for PH businesses"

**Problem:** PH businesses want to leverage AI agents but lack the technical expertise to set up multi-agent orchestration infrastructure.

**My service:** Full Paperclip deployment and configuration — org chart design, agent onboarding, goal alignment, budget controls, and operational monitoring.

| Tier | Price | Includes |
|:----:|:-----:|:---------|
| **Starter** | ₱15,000 | Paperclip deploy + 3-agent setup + basic org chart |
| **Standard** | ₱30,000 | Full deploy + 8-agent org + custom workflows + 1 month support |
| **Enterprise** | ₱60,000 | Multi-company deployment + custom agents + training + 3 months support |

**Monthly retainer:** ₱5,000/mo (system monitoring, agent performance reviews, goal adjustments)

## Portfolio Value

This project demonstrates:

- **DevOps:** Full-stack deployment (Node.js, PostgreSQL, Docker)
- **AI Systems:** Multi-agent orchestration architecture
- **Business Strategy:** Autonomous organization design
- **Service Design:** Turnkey offering with pricing tiers
- **Technical Writing:** Clear documentation and setup guides

## Repos

| Repo | Visibility | Contents |
|:----:|:----------:|:---------|
| `agenticph-labs/p7-paperclip` | Public | Portfolio documentation, sample configs, service blueprint |\n| `agenticph-labs/portfolio` | Public | [Portfolio site](https://agenticph-labs.github.io/portfolio) ||
| [`agenticph-labs/portfolio`](https://agenticph-labs.github.io/portfolio) | Public | Portfolio site |
