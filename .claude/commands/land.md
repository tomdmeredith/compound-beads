# Session End: /land

You are ending a session. Follow this protocol:

## 1. Complete or Checkpoint Current Task

### If Task Complete
- Mark checkbox done in CLAUDE.md
- Add any key insights
- List files modified

### If Task In Progress
- Note progress made
- Document current state
- List immediate next steps

## 2. Round Status Check

### If Round Complete
1. Write "Key Insight" for the round
2. Compress Previous Round to Earlier Rounds table
3. Move Current Round to Previous Round section
4. Update round history table

### If Round In Progress
- Leave Current Work section as-is
- Add "Handoff Notes" subsection if needed:

```markdown
**Handoff Notes (Session End):**
- Current state: [Where we left off]
- Blocked by: [If applicable]
- Next steps:
  1. [First thing to do]
  2. [Second thing to do]
```

## 3. Context Capture

### Learnings
If significant learnings occurred, add to `/.claude/context/learnings.md`

### Decisions
If major decisions made, add to `/.claude/context/decisions.md`

## 4. CLAUDE.md Update

Ensure CLAUDE.md is current:
- [ ] Last Updated date
- [ ] Current Round number correct
- [ ] All accomplishments documented
- [ ] No stale information

## 5. Final Summary

Provide handoff summary:
- "Session ended at Round [N]: [Goal]"
- "[X] tasks completed this session"
- "Next session should: [recommended first action]"

---

## Compression Reminder

If CLAUDE.md is getting long (>400 lines):
- Compress oldest Previous Round to table entry
- Move detailed docs to separate files
- Keep CLAUDE.md as index + current work
