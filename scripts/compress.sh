#!/bin/bash
#
# Compress old rounds in CLAUDE.md
#
# This script helps identify rounds that should be compressed
# and provides the compressed format.
#
# Usage: ./compress.sh [round-number]
#

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Compound Beads Round Compressor       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check for CLAUDE.md
if [ ! -f "CLAUDE.md" ]; then
    echo -e "${RED}Error: CLAUDE.md not found.${NC}"
    exit 1
fi

# Get line count
LINES=$(wc -l < CLAUDE.md)
echo -e "CLAUDE.md has ${YELLOW}${LINES}${NC} lines."
echo ""

if [ "$LINES" -lt 300 ]; then
    echo -e "${GREEN}No compression needed yet. Recommended threshold: 400 lines.${NC}"
    echo ""
fi

# Show current round structure
echo -e "${BLUE}Current rounds found:${NC}"
grep -n "^## Round" CLAUDE.md || echo "(No rounds found)"
echo ""

# Compression guide
echo -e "${YELLOW}Compression Guide:${NC}"
echo ""
echo "1. KEEP AS-IS (full detail):"
echo "   - Current Work section"
echo ""
echo "2. COMPRESS TO SUMMARY (20-30 lines):"
echo "   - Previous Round section"
echo ""
echo "3. COMPRESS TO TABLE ROW (1 line):"
echo "   - All earlier rounds"
echo ""
echo -e "${BLUE}Table row format:${NC}"
echo "| [Round] | [Title] | [Key outcome - 5-10 words] |"
echo ""
echo -e "${BLUE}Example:${NC}"
echo "| 5 | Authentication | OAuth2 flow, session management, CSRF |"
echo ""

# If round number provided, show compression template
if [ -n "$1" ]; then
    ROUND_NUM="$1"
    echo -e "${GREEN}Compression template for Round ${ROUND_NUM}:${NC}"
    echo ""
    echo "| ${ROUND_NUM} | [TITLE] | [KEY_OUTCOME] |"
    echo ""
    echo "Replace [TITLE] and [KEY_OUTCOME] with the round's focus and main accomplishment."
fi

echo ""
echo -e "${YELLOW}Tips:${NC}"
echo "- Compress when CLAUDE.md exceeds 400 lines"
echo "- Always preserve 'Key Insight' from each round"
echo "- Move detailed docs to separate files if needed"
echo "- Keep CLAUDE.md as index + current work"
echo ""
