# /compound:handoff

Prepare for context transition (session end, context window filling, or explicit request).

## Trigger

- User invokes `/compound:handoff`
- Context window > 80% full (auto-trigger)
- Session ending

## Process

### 1. Read Current State
Use `read-state` primitive to get:
- Current round and goal
- Modified files this round
- Ready/blocked task status
- Any partial completion state

### 2. Sync Documentation
Use `sync-docs` primitive to update CLAUDE.md:

```markdown
## Current Work (Round 53)

**Goal:** [Goal from context.md]

### Round 53 Accomplishments
- [x] Completed item 1
- [x] Completed item 2
- [ ] Pending item (in progress)

### Modified Files
- `/src/lib/auth.ts` - Added authentication logic
- `/src/components/login.tsx` - Login UI component
```

### 3. Check Memory Decay
If context.md > 5000 characters:
- Use `archive-round` primitive to move old rounds to archive/
- Keep last 3 rounds in detail
- Compress older rounds to single-line summaries

### 4. Record Partial Completion
If round is incomplete, update context.md with:
```markdown
## Partial Completion Tracking
Status: 3/5 complete (60%)
- [x] Task 1
- [x] Task 2
- [ ] Task 3 (IN PROGRESS - stopped at: validation logic)
- [ ] Task 4
- [ ] Task 5
```

### 5. Update Ready Status
Use `mark-ready` or `mark-blocked` primitives:
```markdown
## Ready to Resume
- [READY] Continue validation logic implementation
- [BLOCKED] Deploy to production (needs: security review)
```

### 6. Generate Handoff Summary
Create brief summary for next session:
```
---
Handoff Summary (cb-f3a8, Round 53)
Goal: Implement user authentication
Progress: 60% (3/5 tasks)
Next: Continue validation logic in /src/lib/auth.ts
Blocked: Deployment (needs security review)
---
```

## Example Output

```
Handoff prepared for Round 53 (cb-f3a8)

Synced to CLAUDE.md:
- 3 accomplishments logged
- 4 modified files documented

Memory status: context.md at 3,200 chars (OK)

Ready tasks:
- Continue validation logic

Blocked tasks:
- Deploy to production (needs: security review)

Next session can resume from .compound-beads/context.md
```

## Primitives Composed

| Primitive | Usage |
|-----------|-------|
| `read-state` | Get current round state |
| `sync-docs` | Update CLAUDE.md with accomplishments |
| `archive-round` | Compress old rounds if needed |
| `mark-ready` | Track resumable tasks |
| `mark-blocked` | Track blocked tasks with reasons |
| `log-file` | Record all modified files |
