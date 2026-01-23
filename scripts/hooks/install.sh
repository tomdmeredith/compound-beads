#!/bin/bash
#
# Compound Beads Git Hooks Installer
#
# Usage: ./scripts/hooks/install.sh
#
# This installs WARNING-level hooks that remind you about
# Compound Beads best practices without blocking commits.

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing Compound Beads git hooks...${NC}"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}WARNING:${NC} Not a git repository. Skipping hook installation."
    echo "Run this from your project root after git init."
    exit 1
fi

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Install pre-commit hook
if [ -f ".git/hooks/pre-commit" ]; then
    echo -e "${YELLOW}Existing pre-commit hook found.${NC}"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping pre-commit hook."
    else
        cp "$SCRIPT_DIR/pre-commit" .git/hooks/pre-commit
        chmod +x .git/hooks/pre-commit
        echo -e "${GREEN}✓${NC} pre-commit hook installed"
    fi
else
    cp "$SCRIPT_DIR/pre-commit" .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
    echo -e "${GREEN}✓${NC} pre-commit hook installed"
fi

# Install commit-msg hook
if [ -f ".git/hooks/commit-msg" ]; then
    echo -e "${YELLOW}Existing commit-msg hook found.${NC}"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping commit-msg hook."
    else
        cp "$SCRIPT_DIR/commit-msg" .git/hooks/commit-msg
        chmod +x .git/hooks/commit-msg
        echo -e "${GREEN}✓${NC} commit-msg hook installed"
    fi
else
    cp "$SCRIPT_DIR/commit-msg" .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg
    echo -e "${GREEN}✓${NC} commit-msg hook installed"
fi

echo ""
echo -e "${GREEN}Compound Beads hooks installed!${NC}"
echo ""
echo "These hooks are WARNING level - they remind but don't block."
echo "Use --no-verify to skip checks when needed."
echo ""
echo "What the hooks do:"
echo "  pre-commit:"
echo "    - Warns if staged files aren't logged in context.md"
echo "    - Warns if code changes without CLAUDE.md update"
echo "    - Suggests current round for commit message"
echo ""
echo "  commit-msg:"
echo "    - Suggests [Round N] format for commit messages"
echo ""
