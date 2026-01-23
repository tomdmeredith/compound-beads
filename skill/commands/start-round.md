# /compound:start-round

Start a new development round with a defined type and goal.

## Trigger

User invokes `/compound:start-round` or Claude detects significant new work beginning.

## Process

### 1. Read Current State
Check `.compound-beads/context.md`:
- Is there an in-progress round? If yes, prompt user about completing it first.
- What's the last round number?

### 2. Determine Round Type

Ask or infer round type:

| Type | Purpose | Typical Size |
|------|---------|--------------|
| **feature** | Ship new functionality | 3-7 tasks |
| **bug_fix** | Address issues | 2-5 tasks |
| **triage** | Convert feedback to tasks | Creates many, closes few |
| **polish** | Refine existing features | 5-10 small tasks |
| **infrastructure** | DevOps, config, DNS | 1-3 tasks |

### 3. Generate Round Identifiers
- **Display ID**: Increment sequential integer (e.g., Round 53, 54, 55 - no decimals)
- **Machine ID**: Generate hash `cb-{4-char-hash}` from goal + timestamp

### 4. Set Goal
Update context.md:
```markdown
## Current Round
- **Display ID**: Round 53
- **Machine ID**: cb-f3a8
- **Type**: feature
- **Goal**: [User-provided or Claude-inferred goal]
- **Status**: in_progress
- **Expert Panel Status**: not_required
- **Started**: [ISO timestamp]

## Modified Files This Round
(none yet)
```

### 5. Append to Rounds Log
Append event to `.compound-beads/rounds.jsonl`:
```json
{"event":"round_started","machineId":"cb-f3a8","displayId":"53","type":"feature","goal":"...","started":"2026-01-09T...","actor":"claude"}
```

### 6. Sizing Check
Based on type, remind of expected scope:

| Type | If scope seems wrong... |
|------|------------------------|
| feature >7 tasks | "Consider breaking into multiple rounds" |
| bug_fix >5 tasks | "That's a lot of bugs - maybe a triage round first?" |
| polish >10 tasks | "Consider prioritizing - which polish items have most impact?" |
| any <30 min | "This might fit as a sub-task in the current round" |

### 7. Sync Documentation
Add to CLAUDE.md:
```markdown
## Current Work (Round 53)

> **Type**: feature
> **Goal**: [Goal]

- [ ] [First task]
```

## Example Output

```
Round 53 started (cb-f3a8)
Type: feature
Goal: Implement user authentication

Expected scope: 3-7 tasks (typical for feature rounds)

Modified: .compound-beads/context.md
Appended: .compound-beads/rounds.jsonl
Updated: CLAUDE.md
```

## Expert Panels

Expert panels are **optional**. Don't prompt for them by default.

If user seems stuck or asks for help with a difficult decision, suggest:
"Want to run an expert panel for fresh perspectives? Use `/compound:panel`."

## Bead Sizing Guidelines

| Duration | Action |
|----------|--------|
| <30 min | Bundle into current round as sub-task |
| 30 min - 4 hours | Individual round |
| >4 hours | Break into multiple rounds |

**Exception:** P0 bugs ALWAYS get their own round (visibility > efficiency)
