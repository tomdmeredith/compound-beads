# Evals and Error Analysis Guide

> **The single biggest predictor of success**
>
> Based on Andrew Ng's framework from DeepLearning.AI

---

## Why This Matters

> **"The single biggest predictor of how rapidly a team makes progress building an AI agent lay in their ability to drive a disciplined process for evals (measuring the system's performance) and error analysis (identifying the causes of errors)."**
> — Andrew Ng

Teams that don't do this spend months tweaking with little progress. Teams that do this efficiently home in on which components to improve and compound their gains.

---

## The Musicians vs. Fumblers Pattern

| Domain | Winners | Losers |
|--------|---------|--------|
| **Music** | Identify stumbling points, practice those | Play start-to-end repeatedly |
| **Health** | Get bloodwork, see what's amiss | Chase nutrition fads |
| **Sports** | Review game films, spot gaps | Practice trick shots |
| **AI/Software** | Use error analysis to find gaps | Stack buzzy techniques from social media |

**The lesson:** Don't guess what to improve. Measure, analyze, then fix.

---

## The Evals Process

### 1. Define Success Criteria (Before Starting)

Before implementation, define what success looks like:

```markdown
## Success Criteria

| Criterion | Metric | Target | Weight |
|-----------|--------|--------|--------|
| Speed | p95 response time | <500ms | High |
| Accuracy | Match quality score | >85% | Critical |
| Coverage | Results returned | 50+ | Medium |
| Cost | API calls per search | <10 | Low |
```

**Types of Criteria:**

| Type | Examples | How to Measure |
|------|----------|----------------|
| **Quantitative** | Speed, accuracy, cost | Direct measurement |
| **Qualitative** | "Feels right", usefulness | User testing, LLM-as-judge |
| **Behavioral** | Error handling, edge cases | Test cases |
| **Business** | Conversion, retention | Analytics |

### 2. Build a Prototype First

> "Rather than defining an error metric ahead of time, it is typically more effective to first quickly build a prototype, then manually examine a handful of outputs to see where it performs well and where it stumbles."

Don't over-engineer success criteria. Build something, see what breaks, then refine your metrics.

### 3. Measure Against Criteria

After implementation, evaluate:

```markdown
## Evaluation Results

| Criterion | Target | Actual | Status |
|-----------|--------|--------|--------|
| Speed | <500ms | 320ms | Pass |
| Accuracy | >85% | 72% | FAIL |
| Coverage | 50+ | 45 | Marginal |
| Cost | <10 | 8 | Pass |
```

### 4. Error Analysis

For failures and marginal results, dig deeper:

```markdown
## Error Analysis

| Error | Category | Root Cause | Action |
|-------|----------|------------|--------|
| Low accuracy (72%) | Algorithm | FAANG bias in ICP extraction | Remove bias, add Company DNA |
| Missing results | Coverage | Single-hop search limitation | Add multi-hop expansion |
| Slow on large profiles | Performance | N+1 query pattern | Batch API calls |
```

### 5. Iterate

Prioritize fixes based on:
1. **Impact** - How much will this improve the success criteria?
2. **Confidence** - How sure are we this is the root cause?
3. **Effort** - How hard is the fix?

---

## Error Analysis Techniques

### The 5 Whys

Keep asking "why" until you reach the root cause:

```
Problem: Search accuracy is 72% instead of 85%

Why? → Many irrelevant results returned
Why? → ICP extraction focuses on company names
Why? → Prompt emphasizes "notable companies" like FAANG
Why? → Original assumption: prestige = fit
Why? → No validation of this assumption

Root Cause: Untested assumption that company prestige predicts fit
Fix: Replace prestige with structural "Company DNA" matching
```

### Categorization

Group errors into categories to spot patterns:

| Category | Count | % of Errors |
|----------|-------|-------------|
| Algorithm/Logic | 12 | 40% |
| Data Quality | 8 | 27% |
| Edge Cases | 6 | 20% |
| Performance | 4 | 13% |

Focus on the largest category first.

### Trace Analysis

Document the step-by-step execution:

```markdown
## Trace: Failed Search for "VP Marketing at Series B SaaS"

| Step | Action | Result | Issue? |
|------|--------|--------|--------|
| 1 | Parse LinkedIn URL | Success | - |
| 2 | Extract ICP | Extracted: "Google, Meta, Stripe" | Found FAANG bias |
| 3 | Build search query | "VP Marketing Google OR Meta" | Query too narrow |
| 4 | Execute search | 12 results | Low count |
| 5 | Score results | 3 high quality | Low yield |

Root Cause: Step 2 (ICP extraction) introduces FAANG bias
```

---

## Types of Evals

### Objective Metrics

Measurable, unambiguous:
- Response time (ms)
- Error rate (%)
- Result count
- API cost ($)
- Test pass rate (%)

### Subjective Metrics (LLM-as-Judge)

For qualitative assessment:

```markdown
## LLM Evaluation Prompt

Rate the following search result on a 1-5 scale for:
1. Relevance to the ICP
2. Quality of profile match
3. Actionability for sales outreach

Profile: [candidate profile]
ICP: [ideal customer profile]

Provide scores and brief justification.
```

### A/B Testing

Compare approaches:

```markdown
## A/B Test: Query Strategy

| Metric | Approach A (Keywords) | Approach B (Semantic) |
|--------|----------------------|----------------------|
| Accuracy | 72% | 84% |
| Speed | 450ms | 620ms |
| Cost | $0.02 | $0.05 |

Winner: Approach B (accuracy improvement outweighs speed/cost)
```

---

## Templates

### Round with Evals

```markdown
## Round N: [Goal]

> **Success Criteria:**
> - [Criterion 1]: [Target]
> - [Criterion 2]: [Target]

### Tasks
- [ ] Task 1
- [ ] Task 2

### Evaluation

| Criterion | Target | Actual | Status |
|-----------|--------|--------|--------|

### Error Analysis

| Error | Root Cause | Action |
|-------|------------|--------|

### Key Insight

[Major learning from this round]
```

### Standalone Evaluation Record

Use `templates/EVALUATION_RECORD.md` for detailed evaluations.

---

## Common Mistakes

### 1. No Success Criteria

Starting work without defining what "done" means.
**Fix:** Always write criteria before implementing.

### 2. Vanity Metrics

Measuring things that don't matter.
**Fix:** Focus on metrics that drive user value.

### 3. Skipping Root Cause

Fixing symptoms instead of causes.
**Fix:** Use 5 Whys to dig deeper.

### 4. Over-Engineering Evals

Building complex evaluation systems before you need them.
**Fix:** Start simple. Manually review 10 cases first.

### 5. Ignoring Qualitative Feedback

Only trusting numbers, missing user experience issues.
**Fix:** Combine quantitative metrics with qualitative review.

---

## Integration with Compound Beads

### In the 5-Phase Cycle

```
1. EXPERT PANEL     → Define what "good" looks like from multiple angles
2. ANALYSIS         → Define success criteria
3. IMPLEMENTATION   → Build the solution
4. EVALUATION       → Measure against criteria, error analysis
5. DOCUMENTATION    → Capture learnings, update criteria for next round
```

### Slash Commands

| Command | Evals Integration |
|---------|-------------------|
| `/plan` | Define success criteria |
| `/work` | Track against criteria |
| `/eval` | Run full evaluation |
| `/review` | Include eval results |
| `/land` | Document learnings |

---

## Andrew Ng's Key Principles

1. **Prototype first, metrics second**
   > "Rather than defining an error metric ahead of time, it is typically more effective to first quickly build a prototype, then manually examine a handful of outputs."

2. **Error analysis over technique stacking**
   > "To improve your agentic AI system, don't just stack up the latest buzzy techniques that just went viral on social media. Instead, use error analysis to figure out where it's falling short, and focus on that."

3. **Disciplined iteration**
   > "Teams that don't know how to do this can spend months tweaking agents with little progress to show for it."

---

## Quick Reference

### Before Starting a Round
- [ ] Define 3-5 success criteria with targets
- [ ] Identify how you'll measure each

### After Implementation
- [ ] Measure actual results vs. targets
- [ ] List what worked
- [ ] List what didn't work

### For Failures
- [ ] Categorize the error
- [ ] Apply 5 Whys to find root cause
- [ ] Document the fix
- [ ] Verify the fix worked

---

## See Also

- [METHODOLOGY.md](./METHODOLOGY.md) - Full methodology including the 5-phase cycle
- [templates/EVALUATION_RECORD.md](../templates/EVALUATION_RECORD.md) - Detailed evaluation template
- [.claude/commands/eval.md](../.claude/commands/eval.md) - Evaluation slash command
