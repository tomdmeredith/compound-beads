# Compound Beads Methodology

> **Complete Reference Guide**

This document describes the Compound Beads methodology for iterative development with AI agents.

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
- Compress older rounds to preserve context
- Use persistent plan files for complex work
- Consult "irrelevant experts" for fresh perspectives

Like beads on a string, each round is distinct but connected to all that came before.

---

## Core Components

### 1. Beads (Rounds)

A **round** is a focused unit of work with:
- A clear goal
- Documented accomplishments (checkboxes)
- A round number

**Naming Convention:**
- Major rounds: 1, 2, 3, 4...
- Sub-rounds: 4.1, 4.2, 4.3... (iterations on a major round)
- Hot-fix rounds: 4.1.1 (rare, for urgent fixes)

**Round Header Template:**
```markdown
## Round N: [One-Line Goal]

> **Methodology**: [Approach/technique used]
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

### 3. Plan Files

Persistent planning documents in `/.claude/plans/`.

**When to Use:**
- Complex multi-step work
- Major features or refactors
- Work spanning multiple sessions
- Decisions requiring research

**Naming Convention:**
`[adjective]-[verb]-[noun].md`

Examples:
- `dynamic-seeking-backus.md`
- `curious-dancing-hopper.md`
- `swift-building-lovelace.md`

**Structure:**
```markdown
# [Feature/Task Name] - Plan

> **Status:** Planning | In Progress | Complete
> **Created:** [Date]
> **Last Updated:** [Date]

## Goal
[Clear, measurable goal]

## Approach
[How we'll achieve the goal]

## Phases
1. [Phase 1]
2. [Phase 2]
...

## Decisions
[Key decisions and rationale]

## Open Questions
- [ ] [Question 1]
- [ ] [Question 2]
```

### 4. Irrelevant Expert Panels

The secret weapon. See [EXPERT_PANEL_GUIDE.md](./EXPERT_PANEL_GUIDE.md) for full details.

**Core Idea:** Domain experts have domain blindness. Experts from **unrelated fields** who deal with similar patterns surface insights you'd never find otherwise.

**Example:**
Building a monitoring dashboard? Ask:
- Air Traffic Controller (monitors many moving objects)
- ER Nurse (triages severity-based queues)
- Security Guard (pattern recognition in normal activity)

---

## The 4-Phase Cycle

Every round follows this pattern:

### Phase 1: Expert Panel (Optional)

When facing a new problem domain, convene an "irrelevant" expert panel:

1. Identify the **pattern** you're dealing with (monitoring, prioritization, trust-building, etc.)
2. Find **3-5 experts** from unrelated fields who handle that pattern
3. Ask each: "How do you handle [pattern] in your work?"
4. Document insights in a table

### Phase 2: Analysis

Deep dive into the problem:

- Read existing code/documentation
- Identify constraints and requirements
- List edge cases
- Define success criteria

### Phase 3: Implementation

Build the solution:

- Create/modify files
- Write tests
- Handle edge cases
- Integrate with existing code

### Phase 4: Documentation

Capture the work:

- Update CLAUDE.md with round accomplishments
- Add inline code comments for round-specific changes
- Update relevant docs
- Compress previous round if needed

---

## Round Management

### Starting a Round

1. **Read CLAUDE.md** - Understand current state
2. **Define the goal** - One clear objective
3. **Create checkboxes** - Break work into tasks
4. **Consider expert panel** - New problem domain?

### During a Round

- Check off tasks as completed
- Add sub-tasks as discovered
- Note key decisions inline
- Use plan files for complex detours

### Ending a Round

1. Mark all tasks complete or explicitly defer
2. Write round summary with key accomplishments
3. Update "Key Insight" if there's a major learning
4. Compress to Previous Round section
5. Update Earlier Rounds table

### When to Start a New Round

- Goal achieved
- Major pivot in direction
- Session ending (natural breakpoint)
- Context getting too long (compress and continue)

---

## Code Comments

Mark round-specific changes in code:

```typescript
// Round 5: Added retry logic for network failures
async function fetchWithRetry() {
  // ...
}

// Round 7: Fixed edge case where null user caused crash
if (!user) return defaultValue;
```

This creates an archaeology of changes.

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
| 5 | Authentication | OAuth flow, session management |
```

### Recommended Structure

```
Current Work (Round N)     → Full detail (50-100 lines)
Previous Round (Round N-1) → Condensed (20-30 lines)
Earlier Rounds             → Table summary (1 line per round)
```

### When Context Gets Long

If CLAUDE.md exceeds 500 lines:
1. Move detailed docs to separate files
2. Link from Documentation section
3. Keep CLAUDE.md as index + current work

---

## Slash Commands

Standardized workflow commands in `.claude/commands/`:

| Command | When | Purpose |
|---------|------|---------|
| `/ready` | Session start | Load context, orient |
| `/plan` | Before complex work | Enter planning mode |
| `/work` | During implementation | Execution checkpoints |
| `/review` | Before finishing | Quality gates |
| `/land` | Session end | Compress, document, handoff |
| `/panel` | New problem domain | Facilitate expert panel |

---

## Best Practices

### Do

- Update CLAUDE.md after every round
- Use clear, numbered round headers
- Document key insights and learnings
- Compress older rounds regularly
- Use expert panels for new domains
- Keep plan files for complex work

### Don't

- Let CLAUDE.md grow unbounded
- Skip documentation "to save time"
- Use vague round goals
- Ignore domain experts just because they're "irrelevant"
- Start new rounds without reading previous context

---

## Anti-Patterns

### "Just One More Thing" Round

Starting rounds without clear goals leads to scope creep.
Fix: Define goal in round header before starting.

### "Empty Compression"

Compressing rounds without capturing key learnings.
Fix: Always include 1-2 sentence "Key Insight" for major rounds.

### "Documentation Debt"

Postponing CLAUDE.md updates until later.
Fix: Update immediately after completing tasks.

### "Expert Tunnel Vision"

Only consulting domain experts, missing patterns.
Fix: Always include 2-3 "irrelevant" experts in panels.

---

## Integration with Tools

### Claude Code

Compound Beads was designed for Claude Code:
- Slash commands live in `.claude/commands/`
- Plan files in `.claude/plans/`
- Context files in `.claude/context/`

### Other AI Agents

The methodology works with any AI tool that:
- Can read markdown files
- Has session continuity (or uses CLAUDE.md for handoff)
- Supports iterative conversation

---

## Example Round

```markdown
## Round 12: Add Rate Limiting

> **Methodology**: Compound Beads - Security enhancement
> **Goal**: Prevent API abuse with IP-based rate limiting

**Expert Panel Insights:**
| Expert | Field | Insight |
|--------|-------|---------|
| Bouncer | Nightclub | VIP vs general admission queues |
| Casino Pit Boss | Gaming | Pattern-based detection over hard limits |

- [x] Created rate limiter middleware
- [x] Added per-IP tracking with 15-minute window
- [x] Implemented graceful degradation (429 response)
- [x] Added VIP bypass for authenticated users
- [x] Unit tests for edge cases

**Key Insight:** The casino pit boss approach (pattern detection)
is better than hard limits. Legitimate users burst; abusers sustain.

**Files Changed:**
- `/src/middleware/rate-limiter.ts` (new)
- `/src/routes/api.ts` (added middleware)
- `/src/lib/redis.ts` (added rate limit store)
```

---

## See Also

- [EXPERT_PANEL_GUIDE.md](./EXPERT_PANEL_GUIDE.md) - Deep dive on expert panels
- [ROUND_MANAGEMENT.md](./ROUND_MANAGEMENT.md) - Round lifecycle details
- [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) - One-page cheat sheet
