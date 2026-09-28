# Paperclip — Autonomous AI Company Orchestrator for PH Businesses

[![Status: Reference](https://img.shields.io/badge/status-reference-22c55e.svg)](https://github.com/agenticph-labs/p7-paperclip)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/agenticph-labs/p7-paperclip/actions/workflows/ci.yml/badge.svg)](https://github.com/agenticph-labs/p7-paperclip/actions/workflows/ci.yml)

> **Portfolio Project 7:** Paperclip deployment configuration, service blueprint, and PH-market reference for autonomous AI organizations.

| Status | Repo | Type |
|:------:|:----:|:----:|
| ✅ Complete | `agenticph-labs/p7-paperclip` | Reference + Service Blueprint |

---

## Table of Contents

- [PH Use Case](#ph-use-case)
- [Overview](#overview)
- [Architecture](#architecture)
- [Sample Company: AgenticPH Marketing Agency](#sample-company-agenticph-marketing-agency)
- [Deployment Guide](#deployment-guide)
- [Service Blueprint](#service-blueprint)
- [CI/CD](#cicd)
- [Repository Contents](#repository-contents)
- [License](#license)

---

## PH Use Case

### Why Paperclip for Philippine Businesses

Philippine businesses are early adopters of AI but face three structural barriers to leveraging autonomous agents:

| Barrier | The PH Reality | How Paperclip Solves It |
|---------|----------------|------------------------|
| **Technical talent gap** | Limited in-house DevOps/AI engineering staff | One-command deploy, no infrastructure team needed |
| **Tool fragmentation** | Teams juggle 5+ disconnected AI tools with no central governance | Single orchestration layer with org charts, budgets, audit trails |
| **Spend control** | Agent loops can burn through API credits unnoticed | Per-agent budget limits, cost dashboards, approval gates |

This reference repo provides everything needed to deploy Paperclip for a PH business — from a ₱15K starter kit (3 agents) to a ₱60K enterprise deployment (multi-department, custom agents).

### Who This Is For

| Stakeholder | Use Case |
|-------------|----------|
| **PH Marketing Agencies** | AI marketing team: content writer, strategist, analyst, social media manager |
| **E-commerce Stores** | Customer support + inventory + pricing agents working 24/7 |
| **SaaS Startups** | Development + QA + customer success autonomous departments |
| **Consulting Firms** | Research + analysis + report generation agents |
| **Real Estate** | Lead qualification + follow-up + market analysis automation |

---

## Overview

**Paperclip** is the open-source orchestration platform for teams of AI agents (79K+ GitHub stars). It provides org charts, goal alignment, cost controls, governance, and ticketing — everything needed to run an autonomous AI company.

This project demonstrates:

- **Deployment** — Full Paperclip server setup with PostgreSQL, auth, and mobile UI
- **Configuration** — Sample autonomous company with org chart, agent definitions, goals, and budgets
- **Service Blueprint** — Turnkey service offering: "I set up Paperclip systems for PH businesses"
- **CI/CD** — Automated validation of configurations and documentation

---

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

---

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

1. **Mission:** "Make $1M ARR with #1 PH AI Marketing Platform"
2. **Project Goals:** Ship v2.0 with automation features, generate 100 qualified leads/month
3. **Routines:** Daily standup (9AM PH time), weekly performance review, monthly board report

---

## Deployment Guide

Full deployment documentation is in [`docs/deployment-guide.md`](docs/deployment-guide.md). Quick reference:

### Prerequisites

| Requirement | Version | Check |
|:-----------:|:-------:|:-----:|
| Node.js | 24.11+ | `node --version` |
| npm | 10+ | `npm --version` |
| PostgreSQL | 16+ | `psql --version` |
| RAM | 2GB+ | `free -h` |

### Quick Install (PH VPS)

```bash
# One-command install (non-interactive)
curl -fsSL https://paperclip.ing/install.sh | bash -s -- --no-prompt --no-onboard

# Onboard with your company
paperclipai onboard --yes

# Import sample company from this repo
paperclipai company import sample-company/agenticph-agency.json
```

### Automated Setup

Run the setup script from this repo:

```bash
bash scripts/setup.sh
```

### Import Sample Company

```bash
paperclipai company import sample-company/agenticph-agency.json
```

### Access Dashboard

- **UI:** `http://localhost:3000`
- **Mobile:** Same URL, responsive design
- **API:** `http://localhost:3000/api`

---

## Service Blueprint

Full service blueprint is in [`docs/service-blueprint.md`](docs/service-blueprint.md).

### "I set up Paperclip systems for PH businesses"

**Problem:** PH businesses want to leverage AI agents but lack the technical expertise to set up multi-agent orchestration infrastructure.

**My service:** Full Paperclip deployment and configuration — org chart design, agent onboarding, goal alignment, budget controls, and operational monitoring.

| Tier | Price | Includes |
|:----:|:-----:|:---------|
| **Starter** | ₱15,000 | Paperclip deploy + 3-agent setup + basic org chart |
| **Standard** | ₱30,000 | Full deploy + 8-agent org + custom workflows + 1 month support |
| **Enterprise** | ₱60,000 | Multi-company deployment + custom agents + training + 3 months support |

**Monthly retainer:** ₱5,000/mo (system monitoring, agent performance reviews, goal adjustments)

### Target Clients

| Client Type | Use Case | Ideal Tier |
|:------------|:---------|:----------:|
| **Marketing Agency** | AI marketing team (content writer, analyst, strategist) | Standard |
| **E-commerce Store** | Customer support + inventory + pricing agents | Standard |
| **SaaS Startup** | Development + QA + customer success agents | Enterprise |
| **Consulting Firm** | Research + analysis + report generation agents | Standard |
| **Real Estate** | Lead qualification + follow-up + market analysis | Starter |

---

## CI/CD

This repository includes a CI pipeline that validates configurations and documentation integrity:

- **`ci.yml`** — Validates JSON config syntax, markdown links, and file structure
- Runs on push/PR to `main`

---

## Repository Contents

```
p7-paperclip/
├── .github/workflows/
│   └── ci.yml               # CI — JSON validation + markdown linting
├── docs/
│   ├── deployment-guide.md  # Step-by-step Paperclip deployment
│   └── service-blueprint.md # Turnkey service offering for PH businesses
├── sample-company/
│   └── agenticph-agency.json # AgenticPH Marketing Agency config (importable)
├── scripts/
│   └── setup.sh             # Automated deployment script
├── README.md
└── LICENSE
```

---

## License

MIT — See [LICENSE](LICENSE)

---

*Portfolio Project 7 — [AgenticPH Labs](https://agenticph-labs.github.io/portfolio)*  
*Built by [AgenticPH Labs](https://agenticph-labs.github.io/portfolio) — AI infrastructure for Philippine business growth*
