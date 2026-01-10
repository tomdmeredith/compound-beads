# /compound:status

Show current Compound Beads state and ready/blocked tasks.

## Trigger

- User invokes `/compound:status`
- Session start (automatically show brief status)
- User asks "what's the current state?"

## Process

### 1. Read Current State
Use `read-state` primitive to get:
- Current round (display ID, machine ID, goal, status)
- Modified files this round
- Expert panel status
- Ready/blocked tasks
- Recent activity

### 2. Format Status Report

```markdown
## Compound Beads Status

### Current Round
**Round 53** (cb-f3a8)
Goal: Implement user authentication
Status: in_progress (started 2026-01-09)
Expert Panel: completed

### Progress
Tasks: 3/5 complete (60%)
- [x] Set up Supabase Auth
- [x] Create login component
- [x] Create signup component
- [ ] Add email verification (IN PROGRESS)
- [ ] Add password reset

### Modified Files (8)
- `/src/lib/auth.ts`
- `/src/components/login.tsx`
- `/src/components/signup.tsx`
- `/src/app/auth/page.tsx`
... and 4 more

### Ready Tasks
- [READY] Continue email verification logic
- [READY] Style the signup form

### Blocked Tasks
- [BLOCKED] Password reset flow (needs: email provider setup)
- [BLOCKED] Deploy to staging (needs: env vars configured)

### Recent Rounds
| Round | Goal | Status |
|-------|------|--------|
| 53 | User authentication | in_progress |
| 52 | First-principles audit | complete |
| 51 | Error handling + Pattern Card | complete |
```

### 3. Highlight Alerts
Show any conditions that need attention:
- Context window usage if > 70%
- Stale context.md (>24h since update)
- Expert panel required but not completed
- Blocked tasks > 3

## Compact Status (for session start)

When auto-triggered at session start, show compact version:

```
Round 53 (cb-f3a8): User authentication [60% complete]
Ready: 2 tasks | Blocked: 2 tasks | Expert panel: done
Last update: 2 hours ago
```

## Example Output

```
=== Compound Beads Status ===

Round 53 (cb-f3a8): Implement user authentication
Status: in_progress | 60% complete (3/5 tasks)
Expert Panel: completed

Ready to Work On:
  [READY] Continue email verification logic
  [READY] Style the signup form

Blocked:
  [BLOCKED] Password reset flow
    └─ Needs: Email provider setup (Resend/SendGrid)
  [BLOCKED] Deploy to staging
    └─ Needs: Environment variables configured

Modified: 8 files this round
Context.md: 2,400 chars (healthy)

Recent:
  Round 52: First-principles audit [complete]
  Round 51: Error handling [complete]

Alerts: None
```

## Primitives Composed

| Primitive | Usage |
|-----------|-------|
| `read-state` | Get all current state from context.md |

## Notes

This command is read-only. It doesn't modify any files.
Use it to orient yourself at session start or when resuming work.
