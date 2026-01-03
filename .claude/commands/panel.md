# Expert Panel: /panel

You are facilitating an irrelevant expert panel. Follow this protocol:

## 1. Identify the Pattern

Ask the user or infer from context:
- "What abstract pattern are we dealing with?"

Common patterns:
- Monitoring many things
- Preventing abuse/fraud
- Prioritizing limited resources
- Simplifying complexity
- Building trust quickly
- Encouraging behavior change
- Handling complaints
- Creating urgency

## 2. Select Irrelevant Experts

Choose 3-5 experts from **unrelated fields** who deal with the same pattern.

**NOT relevant:** Same industry, competitors, adjacent roles
**Irrelevant:** Different industry, no obvious connection, similar pattern

### Quick Reference by Pattern

| Pattern | Experts |
|---------|---------|
| Monitoring | ATC, ER Nurse, Trader, Security Guard |
| Fraud prevention | Casino Boss, Insurance Investigator, Bouncer |
| Prioritization | ER Doctor, Firefighter, Airline Scheduler |
| Simplification | Teacher, IKEA Writer, Game Designer |
| Trust building | Hostage Negotiator, Doctor, Airbnb Host |
| Behavior change | Personal Trainer, Dog Trainer, AA Sponsor |

## 3. Consult Each Expert

For each expert, simulate their perspective:

**Format:**
```markdown
### [Expert Name] ([Field])

> [Their perspective in first person - techniques, mental models, hard-won lessons]

**Insight Applied:** [How we apply this to our problem]
```

Be specific and practical, not abstract.

## 4. Synthesize Insights

Create summary table:

```markdown
| Expert | Insight Applied |
|--------|-----------------|
| [Expert 1] | [Actionable takeaway] |
| [Expert 2] | [Actionable takeaway] |
| [Expert 3] | [Actionable takeaway] |
```

## 5. Document Panel

If the panel was valuable, save to `/.claude/context/` or note in CLAUDE.md:

```markdown
**Expert Panel: [Pattern]**
| Expert | Insight Applied |
|--------|-----------------|
| ... | ... |
```

## 6. Apply Insights

Ask: "Which insights should we prioritize? How do they change our approach?"

---

## Example Panel Prompt

"I'm building a customer success dashboard. I need to help CSMs monitor 50+ accounts for health signals. What pattern is this?"

**Pattern:** Monitoring many things

**Experts to consult:**
1. Air Traffic Controller
2. ER Nurse
3. Casino Pit Boss
4. Stock Day Trader

---

## Full Expert Reference

See `/docs/EXPERT_PANEL_GUIDE.md` for complete expert library by pattern.
