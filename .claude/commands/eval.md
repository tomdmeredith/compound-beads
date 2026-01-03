# Evaluation Mode: /eval

You are in evaluation mode after implementation. Follow this protocol:

## 1. Review Success Criteria

Check the success criteria defined at round start:

- [ ] Success criteria were defined?
- [ ] Criteria are measurable?
- [ ] Targets are specific?

If no criteria were defined, help define them now based on the round goal.

## 2. Measure Against Criteria

For each criterion, evaluate:

```markdown
| Criterion | Target | Actual | Status |
|-----------|--------|--------|--------|
| [Criterion] | [Target] | [Measured] | Pass/Marginal/Fail |
```

**Status Key:**
- **Pass:** Met or exceeded target
- **Marginal:** Close but not quite (within 10%)
- **Fail:** Significantly below target

## 3. Document What Worked

List successes:
- What met or exceeded expectations?
- What was easier than expected?
- What patterns should be reused?

## 4. Document What Didn't Work

List failures and issues:
- What missed the target?
- What was harder than expected?
- What unexpected problems arose?

## 5. Error Analysis (5 Whys)

For each failure, apply the 5 Whys technique:

```markdown
### Error: [Description]

1. Why? → [First answer]
2. Why? → [Second answer]
3. Why? → [Third answer]
4. Why? → [Fourth answer]
5. Why? → [Root cause]

**Root Cause:** [The fundamental issue]
**Action:** [What to do about it]
```

## 6. Categorize Errors

Group errors to spot patterns:

| Category | Count | Priority |
|----------|-------|----------|
| Algorithm/Logic | | |
| Data Quality | | |
| Edge Cases | | |
| Performance | | |
| Integration | | |

## 7. Generate Recommendations

Based on analysis:
- **High Priority:** Must fix before shipping
- **Medium Priority:** Should address in next round
- **Low Priority:** Nice to have, can defer

## 8. Update CLAUDE.md

Add evaluation results to current round section:

```markdown
### Evaluation

| Criterion | Target | Actual | Status |
|-----------|--------|--------|--------|

### Error Analysis

| Error | Root Cause | Action |
|-------|------------|--------|
```

---

## Report

Summarize to user:
- "Evaluation complete: [X/Y] criteria passed"
- "Top issues found: [list]"
- "Recommended focus: [highest priority action]"

---

## Skip Eval

Only skip evaluation for:
- Trivial changes with no defined criteria
- Emergency hotfixes (but add `/eval` as follow-up)

---

## Related

- `/review` - Quality gates (different from eval)
- `/land` - Session end (includes eval summary)
- See `docs/EVALS_GUIDE.md` for full methodology
