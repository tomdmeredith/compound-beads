# Compound Beads Methodology v2.0

> **Evidence-Based Evolution**
> Built from 127 rounds of real usage feedback.

---

## Philosophy

### The Problem

AI agent sessions suffer from **context amnesia**:
- Each session starts fresh
- Knowledge gained is lost
- Work fragments across conversations
- No compound learning

### The Solution

Compound Beads structures work into **numbered rounds** that:
- Document progress in a living handoff file (CLAUDE.md)
- Auto-compress older rounds to preserve context
- Use AI-initiated prompts instead of ceremony
- Capture narrative for compilation into presentations

**Key Insight from real usage:** *"Compound Beads works well as a documentation/handoff system. Compound Beads works poorly as a workflow enforcement system."*

We lean into documentation. We automate enforcement.

---

## What Changed in v2.0

| Removed | Reason |
|---------|--------|
| `/ready`, `/land`, `/work`, `/eval`, `/review` | Never remembered. Replaced by auto-triggers. |
| Decimal sub-rounds (24.1) | Not used since Round 49. Just use next integer. |
| Session-based model | Work is continuous. Remove artificial boundaries. |
| Expert panels as requirement | Only 5.5% usage. Now optional tool. |

| Added | Reason |
|-------|--------|
| **Round Types** | Feature, Bug Fix, Triage, Polish, Infrastructure |
| **Bead Sizing** | 30 min minimum, 4 hours maximum |
| **Narrative System** | Arc statements for presentations |
| **Session Close Protocol** | Automatic enforcement at conversation end |
| **QUICKSTART.md** | Instant continuity for new Claude instances |
| **AI-Initiated Prompts** | Claude prompts, not user remembers |

---

## Core Components

### 1. Rounds (Beads)

A **round** is a focused unit of work with:
- A clear goal
- A declared type
- Documented accomplishments (checkboxes)
- A round number

**Round Types:**

| Type | Purpose | Typical Tasks | Example |
|------|---------|---------------|---------|
| **Feature** | Ship new functionality | 3-7 | Add user authentication |
| **Bug Fix** | Address issues | 2-5 | Fix payment processing |
| **Triage** | Convert feedback to tasks | Creates many, closes few | Process user feedback |
| **Polish** | Refine existing features | 5-10 small | Improve onboarding UX |
| **Infrastructure** | DevOps, config, DNS | 1-3 | Set up email service |

Declare round type at start. Helps scope expectations.

**Bead Sizing:**

| Duration | Action |
|----------|--------|
| <30 min | Bundle into parent round as sub-task |
| 30 min - 4 hours | Individual bead |
| >4 hours | Break into multiple beads |

**Exception:** P0 bugs ALWAYS get their own bead (visibility > efficiency)

**Round Header Template:**
```markdown
## Round N: [One-Line Goal]

> **Type**: [feature | bug_fix | triage | polish | infrastructure]
> **Goal**: [Desired outcome]

- [x] Completed task
- [x] Another completed task
- [ ] Pending task
```

### 2. CLAUDE.md (Agent Handoff Document)

The living heart of compound engineering. Updated every round.

**Required Sections:**

| Section | Purpose |
|---------|---------|
| Header | Project name, current round, date |
| Quick Context | 2-3 sentences describing the project |
| Documentation | Links to docs (tables by category) |
| Key Files | Important code paths |
| Current Work (Round N) | Active round with checkboxes |
| Previous Round | Condensed summary of last round |
| Earlier Rounds | Table summary of history |
| Tech Stack | Technologies used |
| How to Continue | 4-step quickstart |

**Compression Pattern:**
- Current round: Full detail, all checkboxes
- Previous round: Condensed, key accomplishments
- Earlier rounds: One-line table entries

### 3. QUICKSTART.md (Instant Continuity)

A tiny (<500 chars) file that ensures any new Claude instance picks up immediately.

Located at: `.compound-beads/QUICKSTART.md`

**Auto-updated at session close.** Contains:
- Current round number and goal
- Round type and status
- What to do next
- Recent history (last 3 rounds)

**Why it works:**
- Fits in any context window
- Always current (auto-updated)
- Points to full context in CLAUDE.md
- No ceremony required

### 4. Plan Files (When Helpful)

Persistent planning documents in `/.claude/plans/`.

**When to Use:**
- Complex multi-step work where you need to think through approach
- Work spanning multiple sessions
- Decisions requiring research

**When to Skip:**
- Simple feature work
- Bug fixes
- Single-session tasks

Plan files are a tool, not a requirement.

### 5. Expert Panels (Optional Tool)

**Downgraded from "signature feature" to "optional tool" based on real usage (5.5% of rounds).**

Use when:
- Genuinely stuck with no clear path forward
- Facing a novel problem domain with no prior art
- Want fresh perspective on a difficult decision

Skip when:
- Regular feature/bug work
- Path is clear
- Domain is familiar

See [EXPERT_PANEL_GUIDE.md](./EXPERT_PANEL_GUIDE.md) for how to run a panel when needed.

---

## The Narrative System

### Why Capture Narrative

Each round has a story. Capturing it enables:
- Compiling presentations about the build
- Creating case studies
- Sharing learnings with teams
- Remembering why decisions were made

### The Arc (Required for All Rounds)

Every round captures a 3-sentence transformation:

```markdown
## The Arc
**We started believing**: [Initial hypothesis]
**We ended believing**: [Final understanding]
**The transformation**: [One sentence describing the shift]
```

### Additional Narrative Sections (Major Rounds)

| Section | Purpose |
|---------|---------|
| **The Hypothesis** | What we believed going in |
| **The Pivot Point** | Single most important turning moment |
| **Stakes** | Why this mattered, what was at risk |
| **Paths Not Taken** | Options considered but rejected |

### Quick Capture During Work

At natural breaks, note:
- Just tried: [approach]
- Result: [worked/didn't work]
- Surprise level: [expected/unexpected]
- Next: [what this makes us want to try]

### Compilation

Use `/compound:compile` to extract Arc statements from multiple rounds into:
- Presentation outline
- Script draft
- Case study format

---

## AI-Initiated Prompts

Instead of slash commands you forget to run, Claude prompts when contextually relevant.

| Trigger | AI Prompt |
|---------|-----------|
| Significant work completed | "Should I update CLAUDE.md with this round's progress?" |
| Complex multi-step work detected | "This looks complex - want me to create a plan file?" |
| End of conversation detected | "Before we wrap, let me run the session close protocol..." |
| Pattern discovered | "I noticed a useful pattern - add to learnings.md?" |
| Blocked for >7 days | "This bead has been open 7+ days - close, defer, or update?" |

---

## Session Close Protocol

**Replaces `/land`.** Runs automatically when session ends.

Before saying "done" or "complete":

```
[ ] 1. git status              (check what changed)
[ ] 2. git add <files>         (stage code changes)
[ ] 3. git commit -m "..."     (commit code)
[ ] 4. Update rounds.jsonl     (add round entry if closing)
[ ] 5. Update context.md       (current state)
[ ] 6. Update QUICKSTART.md    (regenerate for next session)
[ ] 7. git push                (push to remote)
```

**Critical Rule:** *"Work is not done until pushed AND tracking files updated."*

---

## Git Hooks (WARNING Level)

Optional hooks that remind without blocking.

**Pre-Commit Hook:**
- Checks staged files are logged in round
- Warns if CLAUDE.md not updated
- Suggests round ID for commit message

**Commit Message Hook:**
- Recommends format: `[Round N] description`
- Auto-suggests current round ID
- Bypass with `--no-verify`

---

## Context Management

### The Compression Pattern

As rounds accumulate, compress older ones:

**Before Compression:**
```markdown
## Round 5
- [x] Task A
- [x] Task B (with long details...)
- [x] Task C

**Key Insight:** Learning from this round...
```

**After Compression:**
```markdown
| 5 | Feature | Authentication | OAuth flow, session management |
```

### Recommended Structure

```
Current Work (Round N)     → Full detail (50-100 lines)
Previous Round (Round N-1) → Condensed (20-30 lines)
Earlier Rounds             → Table summary (1 line per round)
```

### Memory Management

- If context.md > 5000 chars → Archive old rounds
- Keep last 3 rounds in detail
- Compress older rounds to single-line summaries in archive/

---

## File Structure

```
project/
├── CLAUDE.md                    # Human-readable handoff document
└── .compound-beads/
    ├── QUICKSTART.md            # Instant continuity (<500 chars)
    ├── context.md               # Portable memory for Claude
    ├── rounds.jsonl             # Machine-readable round history
    ├── learnings.md             # Compounded insights
    └── archive/                 # Compressed old rounds
```

### rounds.jsonl Format (Event-Based)

```jsonl
{"event":"round_started","machineId":"cb-f3a8","displayId":"53","type":"feature","goal":"...","started":"...","actor":"claude"}
{"event":"task_added","machineId":"cb-f3a8","taskId":"t1","description":"..."}
{"event":"arc_captured","machineId":"cb-f3a8","startedBelieving":"...","endedBelieving":"...","transformation":"..."}
{"event":"round_completed","machineId":"cb-f3a8","completed":"...","closedBySession":"session-xyz","keyInsight":"..."}
```

---

## Best Practices

### Do

- Update CLAUDE.md after every round
- Declare round type at start
- Capture Arc statement at round end
- Let AI-initiated prompts guide documentation
- Run session close protocol before ending

### Don't

- Let CLAUDE.md grow unbounded
- Skip documentation "to save time"
- Use vague round goals
- Create ceremony for its own sake
- Forget to push

---

## Anti-Patterns

### "Just One More Thing" Round

Starting rounds without clear goals leads to scope creep.
**Fix:** Declare goal and type in round header before starting.

### "Empty Compression"

Compressing rounds without capturing key learnings.
**Fix:** Always include Arc statement for all rounds.

### "Documentation Debt"

Postponing CLAUDE.md updates until later.
**Fix:** Let AI-initiated prompts remind you.

### "Ceremony Theater"

Running slash commands without understanding why.
**Fix:** Removed. AI prompts when contextually relevant.

---

## Step 0: Load Context

Before starting any work, Claude auto-loads:
1. `QUICKSTART.md` - Immediate context
2. `context.md` - Current state and tasks
3. Recent learnings - Relevant patterns from past rounds

This happens automatically. No ceremony required.

---

## See Also

- [ROUND_TYPES.md](./ROUND_TYPES.md) - Guide to round types
- [EXPERT_PANEL_GUIDE.md](./EXPERT_PANEL_GUIDE.md) - Optional expert panel process
- [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) - One-page cheat sheet
