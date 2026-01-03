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

## 2. Evaluation Status Check

### If Evaluation Was Done
- [ ] Results documented in CLAUDE.md?
- [ ] Error analysis completed?
- [ ] Root causes identified for failures?

### If Evaluation Wasn't Done
Either:
- Run quick `/eval` now, or
- Add "Pending eval" note in handoff

```markdown
**Pending Eval:**
- [ ] Need to measure [Criterion 1]
- [ ] Need to measure [Criterion 2]
```

## 3. Round Status Check

### If Round Complete
1. Write "Key Insight" for the round
2. Include evaluation summary
3. Include error analysis findings
4. Compress Previous Round to Earlier Rounds table
5. Move Current Round to Previous Round section
6. Update round history table

### If Round In Progress
- Leave Current Work section as-is
- Add "Handoff Notes" subsection if needed:

```markdown
**Handoff Notes (Session End):**
- Current state: [Where we left off]
- Eval status: [Done/Pending/Partial]
- Blocked by: [If applicable]
- Known issues: [Errors identified but not fixed]
- Next steps:
  1. [First thing to do]
  2. [Second thing to do]
```

## 4. Context Capture

### Learnings
If significant learnings occurred, add to `/.claude/context/learnings.md`

### Decisions
If major decisions made, add to `/.claude/context/decisions.md`

### Error Patterns
If error patterns discovered, note for future rounds

## 5. CLAUDE.md Update

Ensure CLAUDE.md is current:
- [ ] Last Updated date
- [ ] Current Round number correct
- [ ] All accomplishments documented
- [ ] Evaluation results included
- [ ] Error analysis included (if applicable)
- [ ] No stale information

## 6. Final Summary

Provide handoff summary:
- "Session ended at Round [N]: [Goal]"
- "[X] tasks completed this session"
- "Eval status: [X/Y] criteria passed"
- "Known issues: [List unresolved errors]"
- "Next session should: [recommended first action]"

---

## Compression Reminder

If CLAUDE.md is getting long (>400 lines):
- Compress oldest Previous Round to table entry
- Move detailed docs to separate files
- Keep CLAUDE.md as index + current work
- Keep error analysis findings (they're valuable)
