# /compound:close-session

Run the session close protocol before ending work. Includes Session Intelligence Capture.

**Critical Rule:** *"Work is not done until pushed AND tracking files updated AND session intelligence captured."*

## Trigger

- User invokes `/compound:close-session`
- User says "done", "that's it", "let's wrap up", "I'm done for today"
- Context window approaching limit
- Before `/compound:handoff`

## The Protocol

Run these steps in order. Do not skip steps.

### Step 1: Detect Session ID

Detect the current Claude Code session UUID (see `/compound:process-session` Step 1 for methods). Record it for use in all subsequent events.

### Step 2: Check Git Status

```bash
git status
git diff --name-status
```

**What to look for:**
- Uncommitted changes
- Untracked files that should be tracked
- Files that shouldn't be committed (.env, credentials, etc.)

### Step 3: Stage Code Changes

```bash
git add [specific files]
```

**Guidelines:**
- Stage specific files, not `git add -A`
- Review what you're staging
- Don't stage sensitive files

### Step 4: Commit Code

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

### Step 5: Run Session Intelligence Capture

Execute the `/compound:process-session` protocol to extract all session intelligence:

1. **Assess magnitude** (SMALL / MEDIUM / SIGNIFICANT)
2. **Extract work items** — completed, in-progress, discovered, deferred, invalidated
3. **Extract intelligence** — decisions, learnings, errors/dead ends, patterns, questions
4. **Compose continuity package** — stopping point, mental model, next steps

See `process-session.md` for the full protocol. The depth scales with session magnitude.

### Step 6: Persist to Artifacts

Write all extracted intelligence to the appropriate files:

**rounds.jsonl** — Append `session_processed` event with full intelligence payload:
```json
{"event":"session_processed","sessionId":"<uuid>","machineId":"cb-xxxx","displayId":"N","timestamp":"...","magnitude":"...","work_summary":{...},"decisions":[...],"learnings":[...],"errors":[...],"patterns":[...],"questions_raised":[...],"continuity":{...}}
```

If closing a round, also append:
```json
{"event":"round_completed","sessionId":"<uuid>","machineId":"cb-xxxx","displayId":"N","completed":"...","keyInsight":"..."}
```

If mid-round, also append:
```json
{"event":"session_ended","sessionId":"<uuid>","machineId":"cb-xxxx","displayId":"N","progress":"3/5 tasks complete","lastActivity":"..."}
```

Also append individual high-value events for searchability (`decision_made`, `learning_captured`, `error_captured`, `pattern_recognized`, `question_raised`).

**context.md** — Update all sections:
- Current Round (status, progress, session ID)
- Modified Files This Round
- Ready Tasks / Blocked Tasks
- Discovered Work (new items found)
- Open Questions (new + resolved)
- Session Decisions (choices made)
- Partial Completion Tracking (stopping point)
- Handoff Summary (continuity package)
- Recent Activity (table entry)
- Session History (append)

**learnings.md** — Append new learnings, update:
- Prevention Rules (from errors with generalizable root causes)
- Dead Ends Registry (from failed approaches)
- Recognized Patterns (with promotion check: 3+ occurrences → Established Guideline)

### Step 7: Regenerate QUICKSTART.md

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

## Intelligence Summary

- **Top open question**: [Most urgent or "None"]
- **Discovered work**: [New items or "None"]
- **Key recent decision**: [Most significant or "None"]
- **Last session**: [UUID] *(resume: `claude -r [UUID]`)*

## Recent History

| Round | Type | Goal | Status |
|-------|------|------|--------|
| [N] | [type] | [goal] | [status] |
| [N-1] | [type] | [goal] | complete |
| [N-2] | [type] | [goal] | complete |
```

### Step 8: Git Push

```bash
git push
```

**THE SESSION IS NOT COMPLETE UNTIL THIS SUCCEEDS.**

If push fails:
- Resolve conflicts
- Fix any issues
- Push again

Do NOT tell the user "ready to push when you are" — YOU must push.

## Verification Checklist

Before declaring session complete:

```
[x] Session ID detected and recorded
[x] git status shows clean working tree
[x] All changes committed with [Round N] prefix
[x] Session Intelligence Capture completed (process-session protocol)
[x] rounds.jsonl updated (session_processed + individual events)
[x] context.md reflects current state (including new sections)
[x] learnings.md updated (if learnings/errors/patterns captured)
[x] QUICKSTART.md regenerated (with intelligence summary)
[x] git push succeeded
```

## Example Output

```
Running session close protocol...

[1/8] Detecting session ID
  Session: a1b2c3d4-e5f6-7890-abcd-ef1234567890

[2/8] Git status
  Modified: src/auth/login.ts
  Modified: src/auth/session.ts
  New: src/auth/social.ts

[3/8] Staging changes
  Added: 3 files

[4/8] Committing
  [Round 53] Add social login authentication

[5/8] Session Intelligence Capture
  Magnitude: MEDIUM (45 min, 5 files)
  Work items: 3 completed, 1 in-progress, 1 discovered
  Decisions: 2 captured
  Learnings: 2 captured
  Errors: 1 near-miss recorded
  Questions: 1 raised (important)

[6/8] Persisting to artifacts
  rounds.jsonl: 4 events appended
  context.md: Updated (all sections)
  learnings.md: 2 learnings + 1 prevention rule added

[7/8] Regenerating QUICKSTART.md
  Updated with intelligence summary

[8/8] Pushing to remote
  Pushed to origin/main

Session close complete. All intelligence captured.
```

## When to Skip Steps

| Situation | What to Skip |
|-----------|--------------|
| No code changes | Steps 2-4 (git stage/commit) |
| Research only | Steps 2-4 (git stage/commit) |
| Round complete | Use `/compound:compound` first, then close |

But NEVER skip:
- Session ID detection
- Session Intelligence Capture (Step 5)
- Updating context.md and learnings.md
- Regenerating QUICKSTART.md
- Git push (if there were changes)

## Integration with Handoff

`/compound:handoff` calls this protocol internally, then adds:
- CLAUDE.md compression
- Detailed handoff notes
- Next session recommendations
