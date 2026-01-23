# Compound Beads Context

> This file is the portable memory for Claude. Read it at session start.
> Update it as you work. It persists understanding across sessions.

## Who I Am

Claude assisting with iterative development using Compound Beads methodology.
I read this file to understand the current state and continue work seamlessly.

## What I Know About This Project

- **Project**: [PROJECT_NAME]
- **Tech stack**: [PRIMARY_TECHNOLOGIES]
- **Current focus**: [CURRENT_FOCUS_AREA]
- **Started using Compound Beads**: [DATE]

## What Exists

| Resource | Purpose |
|----------|---------|
| `CLAUDE.md` | Human-readable handoff document |
| `.compound-beads/rounds.jsonl` | Machine-readable round history |
| `.compound-beads/learnings.md` | Compounded insights across rounds |
| `.compound-beads/archive/` | Compressed old rounds |

### Key Project Files
- [List critical files here]
- [Updated as project evolves]

## Current Round

- **Display ID**: Round [N]
- **Machine ID**: cb-[XXXX]
- **Type**: [feature | bug_fix | triage | polish | infrastructure]
- **Goal**: [CURRENT_GOAL]
- **Status**: [pending | in_progress | complete]
- **Expert Panel Status**: [not_required | completed] *(optional - use when stuck)*
- **Started**: [ISO_TIMESTAMP]

## Modified Files This Round

(Track files as they're modified)

## Ready Tasks

Tasks that can be immediately continued:

- [READY] [Task description]

## Blocked Tasks

Tasks waiting on something:

- [BLOCKED] [Task description]
  └─ Needs: [What's blocking it]

## My Guidelines

### When to Consider Expert Panel (Optional Tool)
Expert panels are useful when genuinely stuck or facing novel problems.
- Feeling blocked with no clear path forward → Consider panel
- Novel problem domain with no prior art → Consider panel
- Regular feature/bug work → Skip panel

### Auto-Triggers I Watch For
- Context window > 80% full → Run handoff protocol
- Round has > 5 file modifications → Update this file
- CLAUDE.md "Current Round" differs from here → Offer to sync
- Round marked complete → Prompt for Compound phase
- Session ending detected → Run session close protocol
- Significant work completed → Offer to update CLAUDE.md
- Pattern discovered → Offer to add to learnings.md
- Bead open > 7 days → Prompt: close, defer, or update?

### Memory Management
- If this file > 5000 chars → Archive old rounds
- Keep last 3 rounds in detail
- Compress older rounds to single-line summaries

## Recent Activity

(Updated each session)

| Date | Round | Activity |
|------|-------|----------|
| [DATE] | [ROUND] | [BRIEF_DESCRIPTION] |

## Partial Completion Tracking

If interrupted mid-task, track progress here:

- **Status**: [N/M] complete ([X]%)
- [x] Completed step 1
- [x] Completed step 2
- [ ] In progress: [Current step]
- [ ] Pending step 4
- [ ] Pending step 5

**Last stopped at**: [Specific location/state]
