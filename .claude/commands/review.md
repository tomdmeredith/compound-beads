# Review Mode: /review

You are in review mode before completing a round or major feature. Follow this protocol:

## 1. Evaluation Check

Before code review, verify evaluation was done:

- [ ] Success criteria were defined for this round?
- [ ] Evaluation was performed (`/eval` run)?
- [ ] Error analysis completed for any failures?
- [ ] Root causes identified (not just symptoms)?

If `/eval` wasn't run, run it first or include evaluation in this review.

## 2. Code Quality Gates

### Functionality
- [ ] All acceptance criteria met?
- [ ] Edge cases handled?
- [ ] Error handling in place?

### Code Quality
- [ ] Code follows existing patterns?
- [ ] No obvious performance issues?
- [ ] No security vulnerabilities introduced?

### Testing
- [ ] Tests pass?
- [ ] New code tested?
- [ ] Manual testing done?

## 3. Documentation Gates

### CLAUDE.md
- [ ] Current round updated with all accomplishments?
- [ ] Success criteria evaluation documented?
- [ ] Error analysis included (if applicable)?
- [ ] Key insight captured?
- [ ] Files modified listed?

### Code Comments
- [ ] Complex logic commented?
- [ ] Round-specific changes noted? (e.g., `// Round N: Added retry logic`)

### Other Docs
- [ ] README updated if needed?
- [ ] API docs updated if applicable?

## 4. Technical Debt

Identify and document:
- [ ] Any shortcuts taken?
- [ ] Any "TODO" comments added?
- [ ] Any known issues deferred?
- [ ] Any error root causes not yet addressed?

Add to deferred work section if needed.

## 5. Final Check

Before marking complete:
- [ ] Build passes?
- [ ] Tests pass?
- [ ] No console errors/warnings?
- [ ] Eval criteria all pass or issues documented?

## 6. Report

Summarize to user:
- "Review complete. [X/Y] quality gates passed."
- "Eval results: [X/Y] criteria passed"
- Note any concerns or risks
- Recommend: proceed, fix issues, or defer

---

## Skip Review

Only skip review for:
- Trivial changes (typo fixes, comment updates)
- Emergency hotfixes (but add `/review` as follow-up)
