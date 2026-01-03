#!/bin/bash
#
# Start a new round in Compound Beads
#
# Usage: ./new-round.sh [round-number] [title]
# Example: ./new-round.sh 5 "Add Authentication"
#

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check for CLAUDE.md
if [ ! -f "CLAUDE.md" ]; then
    echo "Error: CLAUDE.md not found. Run init.sh first."
    exit 1
fi

# Get current round from CLAUDE.md
CURRENT_ROUND=$(grep -oP 'Current Round: \K\d+' CLAUDE.md 2>/dev/null || echo "0")

# Determine new round number
if [ -n "$1" ]; then
    NEW_ROUND="$1"
else
    NEW_ROUND=$((CURRENT_ROUND + 1))
fi

# Get title
if [ -n "$2" ]; then
    TITLE="$2"
else
    read -p "Round $NEW_ROUND title: " TITLE
fi

TODAY=$(date +%Y-%m-%d)

echo ""
echo -e "${BLUE}Starting Round ${NEW_ROUND}: ${TITLE}${NC}"
echo ""

# Create round template
ROUND_TEMPLATE="## Round ${NEW_ROUND}: ${TITLE}

> **Methodology**: [Approach/technique]
> **Goal**: [Measurable outcome]

- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

**Key Insight:** [To be filled after completion]

**Files Modified:**
- [List as you work]"

# Create a temporary file with the new round
# (User should manually integrate into CLAUDE.md)

echo -e "${GREEN}Round template created:${NC}"
echo ""
echo "---"
echo ""
echo "$ROUND_TEMPLATE"
echo ""
echo "---"
echo ""
echo -e "${YELLOW}Instructions:${NC}"
echo "1. Copy the template above"
echo "2. Paste into CLAUDE.md under 'Current Work'"
echo "3. Move previous Current Work to 'Previous Round'"
echo "4. Update the header to show Round $NEW_ROUND"
echo ""
echo -e "${BLUE}Or paste directly:${NC}"
echo ""
echo "# Update CLAUDE.md header to:"
echo "> Current Round: $NEW_ROUND ($TITLE)"
echo ""
