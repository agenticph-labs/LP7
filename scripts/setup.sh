#!/usr/bin/env bash
set -euo pipefail

# Paperclip Setup Script
# Usage: bash scripts/setup.sh

echo "=========================================="
echo "  Paperclip — Autonomous AI Company Setup"
echo "=========================================="
echo ""

# Check prerequisites
echo "[1/6] Checking prerequisites..."

check_cmd() {
    if ! command -v "$1" &>/dev/null; then
        echo "  ❌ $1 not found. Please install it first."
        exit 1
    fi
    echo "  ✅ $1 found: $($1 --version 2>&1 | head -1)"
}

check_cmd node
check_cmd npm
check_cmd psql

echo ""

# Install Paperclip
echo "[2/6] Installing Paperclip..."
if command -v paperclipai &>/dev/null; then
    echo "  ✅ Paperclip CLI already installed"
else
    echo "  Installing Paperclip CLI..."
    curl -fsSL https://paperclip.ing/install.sh | bash -s -- --no-prompt --no-onboard
    echo "  ✅ Paperclip CLI installed"
fi

echo ""

# Onboard
echo "[3/6] Running Paperclip onboarding..."
echo "  This will ask you to:"
echo "   - Configure database connection"
echo "   - Create admin user"
echo "   - Set up your first company"
echo ""
read -p "  Press Enter to continue with interactive onboarding..."
paperclipai onboard

echo ""

# Import sample company
echo "[4/6] Importing sample company..."
if [ -f "sample-company/agenticph-agency.json" ]; then
    paperclipai company import sample-company/agenticph-agency.json 2>/dev/null && \
        echo "  ✅ Sample company imported" || \
        echo "  ⚠️ Could not import sample company (you can do this from the UI)"
else
    echo "  ⚠️ Sample company file not found (run from repo root)"
fi

echo ""

# Create admin user
echo "[5/6] Setup complete!"
echo ""
echo "  Next steps:"
echo "  1. Open Paperclip UI at http://localhost:3000"
echo "  2. Log in with the admin credentials you created"
echo "  3. Review the org chart, goals, and agents"
echo "  4. Add your agent API keys"
echo "  5. Set budget limits"
echo "  6. Start assigning tasks"
echo ""
echo "  📖 Full documentation: docs/deployment-guide.md"
echo "  📋 Service blueprint:   docs/service-blueprint.md"
echo ""

# Deploy as service
echo "[6/6] Install as background service?"
read -p "  Install Paperclip as a background service? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    paperclipai service install
    paperclipai service start
    echo "  ✅ Paperclip service installed and started"
    echo "  📍 Dashboard: http://localhost:3000"
    echo "  📋 Status:    paperclipai service status"
    echo "  📝 Logs:      journalctl -u paperclip -f"
fi

echo ""
echo "=========================================="
echo "  Setup complete! Happy agent managing."
echo "=========================================="
