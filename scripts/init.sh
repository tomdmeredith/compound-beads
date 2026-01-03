#!/bin/bash
#
# Compound Beads Initialization Script
#
# Usage: ./init.sh [project-name]
# Or:    curl -sSL https://raw.githubusercontent.com/tomdmeredith/compound-beads/main/scripts/init.sh | bash
#
# This script initializes the Compound Beads methodology in the current directory.
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Compound Beads Methodology Setup      ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Get project name
PROJECT_NAME="${1:-$(basename "$(pwd)")}"
TODAY=$(date +%Y-%m-%d)

echo -e "${YELLOW}Project: ${PROJECT_NAME}${NC}"
echo ""

# Check if CLAUDE.md already exists
if [ -f "CLAUDE.md" ]; then
    echo -e "${YELLOW}Warning: CLAUDE.md already exists.${NC}"
    read -p "Overwrite? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Aborted.${NC}"
        exit 1
    fi
fi

# Create directory structure
echo -e "${GREEN}Creating directory structure...${NC}"
mkdir -p .claude/commands
mkdir -p .claude/context
mkdir -p .claude/plans

# Create CLAUDE.md from template
echo -e "${GREEN}Creating CLAUDE.md...${NC}"
cat > CLAUDE.md << 'TEMPLATE'
# PROJECT_NAME - Agent Handoff Document

> Last Updated: TODAY_DATE
> Current Round: 1 (Initial Setup)

## Quick Context

[2-3 sentences describing what this project is and its current state. What would someone need to know to start working immediately?]

---

## Documentation

| Document | Purpose |
|----------|---------|
| `/docs/README.md` | [Purpose] |

---

## Key Files

| File | Purpose |
|------|---------|
| `/src/` | [Purpose] |

---

## Current Work (Round 1)

### Round 1: Initial Setup

> **Goal**: Set up project foundation

- [ ] Define project scope
- [ ] Set up development environment
- [ ] Create initial structure

---

## Tech Stack

- **Frontend**: [Framework]
- **Backend**: [Framework]
- **Database**: [Database]

---

## How to Continue

1. Read this CLAUDE.md for context
2. Check Current Work section for active tasks
3. Check `/.claude/plans/` for any active plan files
4. Run your dev command

---

## Compound Beads Methodology

This project uses iterative "rounds" - each building on the previous like beads on a string.

### Core Pattern
1. **Expert Panel** - Consult "irrelevant" experts for fresh perspectives
2. **Analysis** - Deep dive into problem space
3. **Implementation** - Build the solution
4. **Documentation** - Capture learnings

### How to Start a New Round
1. Read CLAUDE.md for context
2. Define round goal clearly
3. Optionally convene expert panel
4. Implement and document
5. Update CLAUDE.md with accomplishments
TEMPLATE

# Replace placeholders
sed -i.bak "s/PROJECT_NAME/${PROJECT_NAME}/g" CLAUDE.md
sed -i.bak "s/TODAY_DATE/${TODAY}/g" CLAUDE.md
rm -f CLAUDE.md.bak

# Create slash commands
echo -e "${GREEN}Creating slash commands...${NC}"

cat > .claude/commands/ready.md << 'EOF'
# Session Start: /ready

Read CLAUDE.md and report:
- Current round and goal
- Pending tasks
- Recommended next action
EOF

cat > .claude/commands/plan.md << 'EOF'
# Planning Mode: /plan

Enter planning mode:
1. Define the problem clearly
2. Consider expert panel if new domain
3. Create plan file in /.claude/plans/
4. Document approach and phases
EOF

cat > .claude/commands/work.md << 'EOF'
# Execution Mode: /work

Execution guidelines:
1. Check current task from CLAUDE.md
2. Make incremental changes
3. Test as you go
4. Update checkboxes when done
EOF

cat > .claude/commands/review.md << 'EOF'
# Review Mode: /review

Before finishing:
1. All acceptance criteria met?
2. CLAUDE.md updated?
3. Key insight captured?
4. Tests pass?
EOF

cat > .claude/commands/land.md << 'EOF'
# Session End: /land

End session protocol:
1. Complete or checkpoint current task
2. Update CLAUDE.md with accomplishments
3. Compress previous round if needed
4. Add handoff notes for next session
EOF

cat > .claude/commands/panel.md << 'EOF'
# Expert Panel: /panel

Consult "irrelevant" experts:
1. Identify the abstract pattern
2. Select 3-5 experts from unrelated fields
3. Ask how they handle the pattern
4. Synthesize insights into table
EOF

# Create context files
echo -e "${GREEN}Creating context files...${NC}"

cat > .claude/context/learnings.md << 'EOF'
# Project Learnings

> Add significant learnings here as you work.

## Technical Learnings

| Round | Learning | Impact |
|-------|----------|--------|

## Process Learnings

### What Works Well
-

### What Doesn't Work
-
EOF

cat > .claude/context/decisions.md << 'EOF'
# Architecture Decision Records

## ADR Template

```markdown
## ADR-N: [Title]

**Status:** Proposed | Accepted
**Date:** [Date]
**Round:** [N]

### Context
[Why?]

### Decision
[What?]

### Consequences
[Impact?]
```

## Decisions

(None yet)
EOF

# Create .gitkeep for plans
touch .claude/plans/.gitkeep

# Success message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  Compound Beads initialized!           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "Created:"
echo -e "  ${BLUE}CLAUDE.md${NC} - Agent handoff document"
echo -e "  ${BLUE}.claude/commands/${NC} - Slash commands"
echo -e "  ${BLUE}.claude/context/${NC} - Learnings & decisions"
echo -e "  ${BLUE}.claude/plans/${NC} - Plan files"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Edit CLAUDE.md with your project details"
echo -e "  2. Start Claude Code and run /ready"
echo -e "  3. Begin Round 1!"
echo ""
