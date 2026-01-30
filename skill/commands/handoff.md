# /compound:handoff

Prepare for context transition with full session close protocol.

**This is the comprehensive version of session close - use for major transitions.**

## Trigger

- User invokes `/compound:handoff`
- Context window > 80% full (auto-trigger)
- Major session ending
- Before starting a significantly different task

## Process

### Step 1: Run Session Close Protocol

Execute all steps from `/compound:close-session`:
1. Detect session ID
2. git status / add / commit
3. Run Session Intelligence Capture (process-session protocol)
4. Persist to artifacts (rounds.jsonl, context.md, learnings.md)
5. Regenerate QUICKSTART.md
6. git push

### Step 2: Sync CLAUDE.md

Update CLAUDE.md with current round status:

```markdown
## Current Work (Round 53)

> **Type:** feature
> **Goal:** Implement user authentication

### Accomplishments
- [x] Completed item 1
- [x] Completed item 2
- [ ] Pending item (in progress)

### The Arc
**We started believing:** [...]
**We ended believing:** [...]
**The transformation:** [...]

### Modified Files
| File | Change |
|------|--------|
| `/src/lib/auth.ts` | Added authentication logic |
| `/src/components/login.tsx` | Login UI component |
```

### Step 3: Compress Previous Rounds

If CLAUDE.md is getting long (>400 lines):
- Move current "Previous Round" to "Earlier Rounds" table
- Keep only essential details
- Archive full round documentation to `.compound-beads/archive/`

**Before:**
```markdown
## Previous Round (Round 52)

> **Type:** bug_fix
> **Goal:** Fix payment processing timeout

- [x] Identified race condition in payment webhook
- [x] Added retry logic with exponential backoff
- [x] Updated monitoring alerts
...
```

**After:**
```markdown
## Earlier Rounds

| Round | Type | Goal | Key Arc |
|-------|------|------|---------|
| 52 | bug_fix | Payment timeout | Race condition → retry logic |
| 51 | feature | Notification system | Push → email fallback |
| 50 | polish | Onboarding flow | 12 steps → 5 steps |
```

### Step 4: Check Memory Decay

If context.md > 5000 characters:
- Archive rounds older than last 3
- Compress to single-line summaries in archive/
- Update "Recent Activity" table

### Step 5: Record Partial Completion

If round is incomplete, update context.md:
```markdown
## Partial Completion Tracking

**Status:** 3/5 complete (60%)

- [x] Task 1
- [x] Task 2
- [ ] Task 3 (IN PROGRESS - stopped at: validation logic)
- [ ] Task 4
- [ ] Task 5

**Last stopped at:** Implementing email validation in `/src/lib/auth.ts:45`
```

### Step 6: Update Ready/Blocked Status

```markdown
## Ready Tasks
- [READY] Continue validation logic implementation
- [READY] Write tests for social login

## Blocked Tasks
- [BLOCKED] Deploy to production
  └─ Needs: security review from team lead
```

### Step 7: Generate Handoff Summary

Add to context.md:
```markdown
## Handoff Summary

**Round:** 53 (cb-f3a8)
**Goal:** Implement user authentication
**Progress:** 60% (3/5 tasks)
**Status:** in_progress
**Session ID:** [UUID] *(resume: `claude -r [UUID]`)*
**All Sessions This Round:** [list of UUIDs]

**For Next Session:**
1. Continue validation logic in `/src/lib/auth.ts`
2. Run existing tests to verify no regressions
3. Consider edge case: expired social tokens

**Blockers:**
- Deployment blocked on security review

**Context:**
- Using Supabase Auth (decision made in Round 51)
- Social login working (Google, GitHub)
- Email/password fallback in progress

**Intelligence Summary:**
- Key decisions: [list from session]
- Open questions: [unresolved questions]
- Discovered work: [new items found]
```

## Verification Checklist

Before declaring handoff complete:

```
[x] Session close protocol completed (git pushed)
[x] Session Intelligence Capture completed
[x] CLAUDE.md reflects current state
[x] Previous rounds compressed if needed
[x] context.md under 5000 chars
[x] QUICKSTART.md regenerated (with intelligence summary)
[x] Ready/blocked tasks clearly marked
[x] Handoff summary written (with session IDs)
[x] learnings.md updated (if learnings captured)
```

## Example Output

```
Running handoff protocol for Round 53 (cb-f3a8)...

[Session Close Protocol]
  ✓ Committed: [Round 53] Add social login authentication
  ✓ Pushed to origin/main
  ✓ rounds.jsonl updated
  ✓ context.md updated
  ✓ QUICKSTART.md regenerated

[CLAUDE.md Sync]
  ✓ Current Work section updated
  ✓ 4 accomplishments logged
  ✓ 5 modified files documented

[Memory Management]
  ✓ context.md at 3,200 chars (OK)
  ✓ CLAUDE.md at 320 lines (OK)
  ✓ Round 50 archived

[Handoff Summary]
  Goal: Implement user authentication
  Progress: 60% (3/5 tasks)
  Ready: Continue validation logic
  Blocked: Deployment (needs security review)

Handoff complete. Next Claude instance can resume from:
  - .compound-beads/QUICKSTART.md (quick context)
  - .compound-beads/context.md (full state)
  - CLAUDE.md (human-readable)
```

## When to Use Handoff vs Close-Session

| Situation | Use |
|-----------|-----|
| Quick session end | `/compound:close-session` |
| Context window full | `/compound:handoff` |
| Major transition | `/compound:handoff` |
| End of day | `/compound:handoff` |
| Switching to different work | `/compound:handoff` |

**Difference:** Handoff does everything close-session does, PLUS:
- Full CLAUDE.md sync
- Round compression
- Memory decay management
- Detailed handoff summary
