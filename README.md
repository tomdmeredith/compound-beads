# Compound Beads Methodology

> **A framework for iterative development with AI agents that compounds knowledge across sessions.**

Compound Beads transforms chaotic, context-losing AI sessions into structured, compounding development rounds. Each "bead" is a unit of focused work that builds on everything before it.

## Quick Start

```bash
# Clone to your existing project
git clone https://github.com/tomdmeredith/compound-beads.git /tmp/cb

# Copy the essentials
cp /tmp/cb/templates/CLAUDE.md ./CLAUDE.md
cp -r /tmp/cb/.claude ./.claude

# Or use the init script
curl -sSL https://raw.githubusercontent.com/tomdmeredith/compound-beads/main/scripts/init.sh | bash
```

Then start Claude Code and run `/ready` to begin your first round.

## What's Inside

```
compound-beads/
├── docs/
│   ├── METHODOLOGY.md          # Full methodology reference
│   ├── EVALS_GUIDE.md          # Evals and error analysis (Andrew Ng framework)
│   ├── EXPERT_PANEL_GUIDE.md   # The "irrelevant expert" technique
│   ├── ROUND_MANAGEMENT.md     # Working with rounds
│   └── QUICK_REFERENCE.md      # One-page cheat sheet
│
├── templates/
│   ├── CLAUDE.md               # Agent handoff document template
│   ├── PLAN_FILE.md            # Plan file template
│   ├── EVALUATION_RECORD.md    # Detailed eval documentation
│   ├── EXPERT_PANEL_RECORD.md  # Panel documentation
│   └── ROUND_ACCOMPLISHMENTS.md
│
├── .claude/
│   ├── commands/               # Slash commands
│   │   ├── ready.md            # Session start
│   │   ├── plan.md             # Planning workflow
│   │   ├── work.md             # Execution guidelines
│   │   ├── eval.md             # Evaluate against criteria
│   │   ├── review.md           # Quality gates
│   │   ├── land.md             # Session end
│   │   └── panel.md            # Expert panel facilitation
│   ├── context/
│   │   ├── learnings.md        # Accumulated wisdom
│   │   └── decisions.md        # ADR template
│   └── plans/
│
├── scripts/
│   ├── init.sh                 # Initialize in any repo
│   ├── new-round.sh            # Start new round
│   └── compress.sh             # Archive old rounds
│
└── examples/
    ├── CLAUDE.md.example       # Real 32-round example
    └── expert-panel-example.md # Real panel session
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

This methodology was developed and refined across **32 rounds** of building CloneICP, a semantic people search tool. The `examples/` folder contains real artifacts from that project.

## Getting Started

1. **Copy templates** - Start with `templates/CLAUDE.md`
2. **Set up commands** - Copy `.claude/` to your project
3. **Run `/ready`** - Begin your first session
4. **Start Round 1** - Define your goal and get to work

## License

MIT - Use freely, attribution appreciated.

---

*Built with the methodology it describes.*
