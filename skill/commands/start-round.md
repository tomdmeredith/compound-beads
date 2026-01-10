# /compound:start-round

Start a new development round with a defined goal.

## Trigger

User invokes `/compound:start-round` or Claude detects significant new work beginning.

## Process

### 1. Read Current State
Use `read-state` primitive to check `.compound-beads/context.md`:
- Is there an in-progress round? If yes, prompt user about completing it first.
- What's the last round number?

### 2. Generate Round Identifiers
- **Display ID**: Increment sequential number (e.g., Round 53, or 53.1 for sub-rounds)
- **Machine ID**: Generate hash `cb-{4-char-hash}` from goal + timestamp

### 3. Set Goal
Use `set-goal` primitive to update context.md:
```markdown
## Current Round
- **Display ID**: Round 53
- **Machine ID**: cb-f3a8
- **Goal**: [User-provided or Claude-inferred goal]
- **Status**: in_progress
- **Expert Panel Required**: [YES/NO based on decision tree]
- **Started**: [ISO timestamp]

## Modified Files This Round
(none yet)
```

### 4. Append to Rounds Log
Append to `.compound-beads/rounds.jsonl`:
```json
{"displayId": "53", "machineId": "cb-f3a8", "goal": "...", "status": "in_progress", "started": "2026-01-09T..."}
```

### 5. Check Expert Panel Requirement
Evaluate against decision tree:
- New user-facing feature? → Expert panel required
- Pricing/business model changes? → Expert panel required
- Security-related changes? → Expert panel required
- Architectural refactoring? → Expert panel required
- Bug fix, docs, refactor without behavior change? → Not required

If required, note in context.md and suggest `/compound:panel`.

### 6. Sync Documentation
Use `sync-docs` primitive to add one line to CLAUDE.md if not present:
```markdown
## Current Work (Round 53)
**Goal:** [Goal]
```

## Example Output

```
Round 53 started (cb-f3a8)
Goal: Implement user authentication

Expert panel: RECOMMENDED (new user-facing feature)
Run /compound:panel when ready to explore perspectives.

Modified: .compound-beads/context.md
Appended: .compound-beads/rounds.jsonl
```

## Primitives Composed

| Primitive | Usage |
|-----------|-------|
| `read-state` | Check existing round status |
| `set-goal` | Record new goal and round identifiers |
| `log-file` | Track context.md as modified |
| `sync-docs` | Update CLAUDE.md header |
