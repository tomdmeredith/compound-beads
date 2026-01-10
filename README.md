# Compound Beads Methodology

> **A framework for iterative development with AI agents that compounds knowledge across sessions.**

Compound Beads transforms chaotic, context-losing AI sessions into structured, compounding development rounds. Each "bead" is a unit of focused work that builds on everything before it.

## Installation

Choose your approach:

### Path A: Copy to Project (Starter Kit)

Best for: Single project, want full control over commands

```bash
# Option 1: Use the init script
curl -sSL https://raw.githubusercontent.com/tomdmeredith/compound-beads/main/scripts/init.sh | bash

# Option 2: Manual copy
git clone https://github.com/tomdmeredith/compound-beads.git /tmp/cb
cp /tmp/cb/templates/CLAUDE.md ./CLAUDE.md
cp -r /tmp/cb/.claude ./.claude
```

This creates `.claude/` in your project with `/ready`, `/plan`, `/work`, `/eval`, `/review`, `/land`, `/panel`.

### Path B: Install as Skill (Recommended)

Best for: Multiple projects, consistent methodology, auto-triggers

```bash
# Clone and install skill globally
git clone https://github.com/tomdmeredith/compound-beads.git /tmp/cb
mkdir -p ~/.claude/skills
cp -r /tmp/cb/skill ~/.claude/skills/compound-beads
```

Then in any project:
```bash
cd /path/to/my-project
claude
> "Set up compound beads for this project"
```

Claude creates `.compound-beads/` with project-specific state. Commands: `/compound:start-round`, `/compound:handoff`, `/compound:panel`, `/compound:compound`, `/compound:status`.

**What's different about Path B:**
- Auto-triggers (context window detection, documentation sync)
- Per-project state (`.compound-beads/` created on demand)
- Machine-readable history (`rounds.jsonl`)
- Memory decay (old rounds auto-archived)

## What's Inside

```
compound-beads/
├── skill/                       # Path B: Claude Code Skill
│   ├── SKILL.md                 # Main skill (auto-triggers, outcomes)
│   ├── commands/                # /compound:* commands
│   │   ├── start-round.md       # Start new round with goal
│   │   ├── handoff.md           # Context transition
│   │   ├── expert-panel.md      # Convene expert panel
│   │   ├── compound.md          # Extract learnings
│   │   └── status.md            # Show current state
│   ├── templates/               # Per-project templates
│   │   ├── context.md           # Portable memory
│   │   ├── round.md             # Round documentation
│   │   └── expert-panel.md      # Panel notes
│   └── agents/
│       └── expert-panel-facilitator.md
│
├── .claude/                     # Path A: Copy-to-project commands
│   ├── commands/                # /ready, /plan, /work, etc.
│   │   ├── ready.md             # Session start
│   │   ├── plan.md              # Planning workflow
│   │   ├── work.md              # Execution guidelines
│   │   ├── eval.md              # Evaluate against criteria
│   │   ├── review.md            # Quality gates
│   │   ├── land.md              # Session end
│   │   └── panel.md             # Expert panel facilitation
│   ├── context/
│   │   ├── learnings.md         # Accumulated wisdom
│   │   └── decisions.md         # ADR template
│   └── plans/
│
├── docs/
│   ├── METHODOLOGY.md           # Full methodology reference
│   ├── EVALS_GUIDE.md           # Evals and error analysis (Andrew Ng)
│   ├── EXPERT_PANEL_GUIDE.md    # The "irrelevant expert" technique
│   ├── ROUND_MANAGEMENT.md      # Working with rounds
│   └── QUICK_REFERENCE.md       # One-page cheat sheet
│
├── templates/
│   ├── CLAUDE.md                # Agent handoff document template
│   ├── PLAN_FILE.md             # Plan file template
│   ├── EVALUATION_RECORD.md     # Detailed eval documentation
│   ├── EXPERT_PANEL_RECORD.md   # Panel documentation
│   └── ROUND_ACCOMPLISHMENTS.md
│
├── scripts/
│   ├── init.sh                  # Initialize in any repo
│   ├── new-round.sh             # Start new round
│   └── compress.sh              # Archive old rounds
│
└── examples/
    ├── CLAUDE.md.example        # Real 52-round example
    └── expert-panel-example.md  # Real panel session
```

## Core Concepts

### 1. Beads (Rounds)

Work is organized into numbered rounds: 1, 2, 3... Each round has a clear goal and produces documented outcomes.

```markdown
## Round 5: Implement User Authentication

- [x] Add login/logout endpoints
- [x] Create session management
- [x] Write authentication tests
```

Sub-rounds (5.1, 5.2) handle iterations within a major round.

### 2. Compound Engineering

Knowledge compounds through:

- **CLAUDE.md** - Living handoff document that updates every round
- **Plan files** - Persistent planning documents in `/.claude/plans/`
- **Round compression** - Recent rounds expand, older rounds summarize
- **Learnings** - Captured in `/.claude/context/learnings.md`

### 3. Irrelevant Expert Panels

The secret weapon. Consult experts from **unrelated fields** who deal with similar patterns:

| Problem | "Irrelevant" Experts |
|---------|---------------------|
| Monitoring many things | Air Traffic Controller, ER Nurse |
| Preventing abuse | Casino Pit Boss, Insurance Investigator |
| Simplifying complexity | Kindergarten Teacher, IKEA Manual Writer |
| Building trust quickly | Hostage Negotiator, Used Car Salesperson |

This surfaces insights domain experts miss. See [Expert Panel Guide](./docs/EXPERT_PANEL_GUIDE.md).

## The 5-Phase Pattern

Every round follows this cycle:

```
1. EXPERT PANEL     → Fresh perspectives from "irrelevant" fields
2. ANALYSIS         → Deep dive + define success criteria
3. IMPLEMENTATION   → Build the solution
4. EVALUATION       → Measure against criteria, error analysis
5. DOCUMENTATION    → Capture learnings, update CLAUDE.md
```

The **Evaluation** phase is based on Andrew Ng's insight that _"the single biggest predictor of how rapidly a team makes progress building an AI agent lay in their ability to drive a disciplined process for evals and error analysis."_ See [EVALS_GUIDE.md](./docs/EVALS_GUIDE.md).

## CLAUDE.md Structure

The heart of compound engineering. Required sections:

1. **Header** - Project name, current round, last updated
2. **Quick Context** - 2-3 sentences on what the project is
3. **Documentation** - Links to docs (categorized tables)
4. **Key Files** - Important code paths
5. **Current Work (Round N)** - Active round with checkboxes
6. **Previous Round** - Condensed previous round
7. **Earlier Rounds** - Table summary of history
8. **Tech Stack** - Technologies used
9. **How to Continue** - 4-step quickstart

See [templates/CLAUDE.md](./templates/CLAUDE.md) for the full template.

## Slash Commands

| Command | Purpose |
|---------|---------|
| `/ready` | Start a session - reads CLAUDE.md, shows context |
| `/plan` | Enter planning mode for complex work |
| `/work` | Execution guidelines and checkpoints |
| `/eval` | Evaluate against success criteria, error analysis |
| `/review` | Quality gates before finishing |
| `/land` | End session - compress rounds, update docs |
| `/panel` | Facilitate an irrelevant expert panel |

## Why It Works

1. **Context survives** - CLAUDE.md carries forward across sessions
2. **Knowledge compounds** - Each round builds on all previous work
3. **Fresh perspectives** - Expert panels break domain blindness
4. **Data-driven progress** - Evals and error analysis prevent wheel-spinning
5. **Structure without rigidity** - Flexible enough for any project type
6. **AI-native** - Designed for human+AI collaboration

## Proven at Scale

This methodology was developed and refined across **52 rounds** of building CloneICP, a semantic people search tool. The `examples/` folder contains real artifacts from that project.

## Getting Started

**Path A (Starter Kit):**
1. Copy `.claude/` to your project
2. Create `CLAUDE.md` from template
3. Run `/ready` to begin your first session
4. Start Round 1 and get to work

**Path B (Skill - Recommended):**
1. Install skill to `~/.claude/skills/compound-beads/`
2. Open any project in Claude Code
3. Say "Set up compound beads for this project"
4. Claude creates `.compound-beads/` and starts Round 1

## License

MIT - Use freely, attribution appreciated.

---

*Built with the methodology it describes.*
