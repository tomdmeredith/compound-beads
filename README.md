# Compound Beads Methodology v2.0

> **A framework for iterative development with AI agents that compounds knowledge across sessions.**
>
> *Evidence-based evolution: Built from 127 rounds of real usage feedback.*

Compound Beads transforms chaotic, context-losing AI sessions into structured, compounding development rounds. Each round is a unit of focused work that builds on everything before it.

**v2.0 Key Changes:**
- **Round Types**: Feature, Bug Fix, Triage, Polish, Infrastructure
- **Narrative System**: Arc statements for compiling presentations
- **Instant Continuity**: New Claude instances pick up immediately via QUICKSTART.md
- **AI-Initiated Prompts**: No more forgotten slash commands
- **Expert Panels**: Now optional (5.5% real usage → tool, not requirement)

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

This creates `.claude/` in your project with `/plan` and `/panel` commands.

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

Claude creates `.compound-beads/` with project-specific state. Commands: `/compound:start-round`, `/compound:handoff`, `/compound:compound`, `/compound:research`, `/compound:status`.

**What's different about Path B:**
- Auto-triggers (context window detection, documentation sync)
- Per-project state (`.compound-beads/` created on demand)
- Machine-readable history (`rounds.jsonl`)
- Memory decay (old rounds auto-archived)

## What's Inside

```
compound-beads/
├── skill/                       # Path B: Claude Code Skill (Recommended)
│   ├── SKILL.md                 # Main skill v2.0 (AI-initiated prompts)
│   ├── commands/                # /compound:* commands
│   │   ├── start-round.md       # Start round with type and goal
│   │   ├── handoff.md           # Context transition + close protocol
│   │   ├── expert-panel.md      # Convene expert panel (optional)
│   │   ├── compound.md          # Extract learnings + capture Arc
│   │   ├── status.md            # Show current state
│   │   ├── compile.md           # Compile Arcs into presentations
│   │   ├── research.md          # Search learnings for patterns (Step 0)
│   │   └── close-session.md     # Session close protocol
│   ├── templates/               # Per-project templates
│   │   ├── QUICKSTART.md        # Instant continuity (<500 chars)
│   │   ├── context.md           # Portable memory
│   │   ├── round.md             # Round documentation with Arc
│   │   └── expert-panel.md      # Panel notes
│   └── agents/
│       └── expert-panel-facilitator.md
│
├── .claude/                     # Path A: Copy-to-project commands
│   ├── commands/                # Simplified in v2.0
│   │   ├── plan.md              # Planning workflow
│   │   └── panel.md             # Expert panel (optional)
│   ├── context/
│   │   ├── learnings.md         # Accumulated wisdom
│   │   └── decisions.md         # ADR template
│   └── plans/
│
├── docs/
│   ├── METHODOLOGY.md           # Full v2.0 methodology reference
│   ├── ROUND_TYPES.md           # Round type guide (NEW)
│   ├── EVALS_GUIDE.md           # Evals and error analysis
│   ├── EXPERT_PANEL_GUIDE.md    # Expert panels (now optional)
│   └── QUICK_REFERENCE.md       # One-page cheat sheet
│
├── templates/
│   ├── CLAUDE.md                # Agent handoff document template
│   ├── PLAN_FILE.md             # Plan file template
│   └── ROUND_ACCOMPLISHMENTS.md
│
├── scripts/
│   ├── init.sh                  # Initialize in any repo
│   └── hooks/                   # Git hooks (WARNING level)
│       ├── pre-commit           # Check files logged in round
│       ├── commit-msg           # Suggest round ID format
│       └── install.sh           # Hook installer
│
└── examples/
    ├── CLAUDE.md.example        # Real 52-round example
    └── expert-panel-example.md  # Real panel session
```

## Core Concepts

### 1. Rounds

Work is organized into numbered rounds: 1, 2, 3... Each round has a **type**, a clear **goal**, and produces documented outcomes.

**Round Types:**
| Type | Purpose |
|------|---------|
| **Feature** | Ship new functionality |
| **Bug Fix** | Address issues |
| **Triage** | Convert feedback to tasks |
| **Polish** | Refine existing features |
| **Infrastructure** | DevOps, config, DNS |

```markdown
## Round 5: Implement User Authentication

> **Type**: feature
> **Goal**: Add secure login for users

- [x] Add login/logout endpoints
- [x] Create session management
- [x] Write authentication tests

## The Arc
**We started believing**: JWT tokens are overkill for this app
**We ended believing**: JWTs simplify mobile support significantly
**The transformation**: Mobile requirements changed our auth strategy
```

### 2. Compound Engineering

Knowledge compounds through:

- **CLAUDE.md** - Living handoff document that updates every round
- **Plan files** - Persistent planning documents in `/.claude/plans/`
- **Round compression** - Recent rounds expand, older rounds summarize
- **Learnings** - Captured in `/.claude/context/learnings.md`

### 3. Expert Panels (Optional Tool)

Use when genuinely stuck. Consult experts from **unrelated fields** who deal with similar patterns:

| Problem | "Irrelevant" Experts |
|---------|---------------------|
| Monitoring many things | Air Traffic Controller, ER Nurse |
| Preventing abuse | Casino Pit Boss, Insurance Investigator |
| Simplifying complexity | Kindergarten Teacher, IKEA Manual Writer |
| Building trust quickly | Hostage Negotiator, Used Car Salesperson |

This surfaces insights domain experts miss. See [Expert Panel Guide](./docs/EXPERT_PANEL_GUIDE.md).

## The Round Flow

v2.0 uses AI-initiated prompts instead of rigid phases:

```
1. START ROUND      → Declare type and goal
2. WORK             → Build the solution
3. COMPOUND         → Capture Arc (story), extract learnings
4. CLOSE            → Session close protocol (git push, update docs)
```

**Expert panels** are optional—use when genuinely stuck. **Evaluation** is still important—see [EVALS_GUIDE.md](./docs/EVALS_GUIDE.md).

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

## Commands

**Path A (Starter Kit):**

| Command | Purpose |
|---------|---------|
| `/plan` | Enter planning mode for complex work |
| `/panel` | Facilitate an expert panel (optional, use when stuck) |

**Path B (Skill):**

| Command | Purpose |
|---------|---------|
| `/compound:start-round` | Start new round with type and goal |
| `/compound:handoff` | Context transition + session close protocol |
| `/compound:status` | Show current state and tasks |
| `/compound:compound` | Extract learnings and capture Arc |
| `/compound:compile` | Compile Arc statements into presentations |
| `/compound:research` | Search learnings for relevant patterns (Step 0) |
| `/compound:panel` | Facilitate expert panel (optional) |

**Note:** Most documentation happens automatically via AI-initiated prompts. Commands are conveniences, not requirements.

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
