# /compound:close-session

Run the session close protocol before ending work.

**Critical Rule:** *"Work is not done until pushed AND tracking files updated."*

## Trigger

- User invokes `/compound:close-session`
- User says "done", "that's it", "let's wrap up", "I'm done for today"
- Context window approaching limit
- Before `/compound:handoff`

## The Protocol

Run these steps in order. Do not skip steps.

### Step 1: Check Git Status

```bash
git status
```

**What to look for:**
- Uncommitted changes
- Untracked files that should be tracked
- Files that shouldn't be committed (.env, credentials, etc.)

### Step 2: Stage Code Changes

```bash
git add [specific files]
```

**Guidelines:**
- Stage specific files, not `git add -A`
- Review what you're staging
- Don't stage sensitive files

### Step 3: Commit Code

```bash
git commit -m "[Round N] [description]"
```

**Commit message format:**
```
[Round N] Short description

- Detail 1
- Detail 2

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Step 4: Update rounds.jsonl

If closing a round, append completion event:
```json
{"event":"round_completed","machineId":"cb-xxxx","displayId":"N","completed":"2026-01-22T...","closedBySession":"session-xyz","keyInsight":"..."}
```

If mid-round, append progress event:
```json
{"event":"session_ended","machineId":"cb-xxxx","displayId":"N","progress":"3/5 tasks complete","lastActivity":"2026-01-22T..."}
```

### Step 5: Update context.md

Update the Current Round section:
```markdown
## Current Round
- **Status**: [in_progress | complete]
- **Last Activity**: [ISO timestamp]
- **Progress**: [X/Y tasks complete]

## Modified Files This Round
- `/path/to/file1.ts` - [description]
- `/path/to/file2.ts` - [description]

## Ready Tasks
- [READY] [Next task to do]

## Blocked Tasks
- [BLOCKED] [Task] - Needs: [what's blocking]
```

### Step 6: Regenerate QUICKSTART.md

Regenerate `.compound-beads/QUICKSTART.md` from current state:

```markdown
# Quick Start - [PROJECT_NAME]

> **Last Updated:** [NOW]
> **Current Round:** [N] - [GOAL]
> **Round Type:** [type]
> **Status:** [status]

## Immediate Context

[Current round goal and progress - under 200 chars]

## Pick Up Here

1. Read `CLAUDE.md` for full context
2. Current tasks: [ready tasks]
3. Blockers: [blocked tasks or "None"]

## Recent History

| Round | Type | Goal | Status |
|-------|------|------|--------|
| [N] | [type] | [goal] | [status] |
| [N-1] | [type] | [goal] | complete |
| [N-2] | [type] | [goal] | complete |
```

### Step 7: Git Push

```bash
git push
```

**THE SESSION IS NOT COMPLETE UNTIL THIS SUCCEEDS.**

If push fails:
- Resolve conflicts
- Fix any issues
- Push again

Do NOT tell the user "ready to push when you are" - YOU must push.

## Verification Checklist

Before declaring session complete:

```
[x] git status shows clean working tree
[x] All changes committed with [Round N] prefix
[x] rounds.jsonl updated with latest events
[x] context.md reflects current state
[x] QUICKSTART.md regenerated
[x] git push succeeded
```

## Example Output

```
Running session close protocol...

[1/7] Git status
  Modified: src/auth/login.ts
  Modified: src/auth/session.ts
  New: src/auth/social.ts

[2/7] Staging changes
  Added: src/auth/login.ts
  Added: src/auth/session.ts
  Added: src/auth/social.ts

[3/7] Committing
  [Round 53] Add social login authentication

[4/7] Updating rounds.jsonl
  Appended: session_ended event

[5/7] Updating context.md
  Progress: 4/5 tasks complete
  Ready: [1 task]
  Blocked: [0 tasks]

[6/7] Regenerating QUICKSTART.md
  Updated for Round 53, in_progress

[7/7] Pushing to remote
  ✓ Pushed to origin/main

Session close complete. Safe to end conversation.
```

## When to Skip Steps

| Situation | What to Skip |
|-----------|--------------|
| No code changes | Steps 1-3 (git) |
| Research only | Steps 1-3 (git) |
| Round complete | Use `/compound:compound` first, then close |

But NEVER skip:
- Updating context.md
- Regenerating QUICKSTART.md
- Git push (if there were changes)

## Integration with Handoff

`/compound:handoff` calls this protocol internally, then adds:
- CLAUDE.md compression
- Detailed handoff notes
- Next session recommendations
