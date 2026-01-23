# /compound:compile

Compile Arc statements from multiple rounds into presentations, scripts, or case studies.

**This is how rounds become stories worth sharing.**

## Trigger

User invokes `/compound:compile` with optional range or format parameters.

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `--range` | Round range (e.g., "1-10", "50-60", "all") | Last 10 rounds |
| `--format` | Output format: presentation, script, case-study | presentation |
| `--theme` | Story theme to emphasize | Auto-detected |

## Process

### 1. Gather Arc Statements

Read from rounds.jsonl:
```json
{"event":"arc_captured","machineId":"cb-f3a8","displayId":"53","startedBelieving":"...","endedBelieving":"...","transformation":"..."}
```

Or from learnings.md if rounds.jsonl is incomplete.

### 2. Identify Story Threads

Look for patterns across Arcs:
- **Theme clusters**: Which Arcs share similar transformations?
- **Turning points**: Which rounds fundamentally changed direction?
- **Evolution**: How did understanding compound over time?

### 3. Generate Output

#### Format: Presentation

```markdown
# [Project Name]: The Journey
## Slides from Rounds [N] to [M]

---

### Slide 1: The Starting Point
**Where we began:**
[Combined starting beliefs from early rounds]

---

### Slide 2: [First Major Arc]
**Round [N]: [Goal]**

We started believing: [...]
We ended believing: [...]

*The turning point: [transformation]*

---

### Slide 3: [Second Major Arc]
...

---

### Slide N: What We Know Now
**Key transformations:**
1. [From Arc 1]
2. [From Arc 2]
3. [From Arc 3]

---

### Slide N+1: What's Next
[Based on most recent round's learnings]
```

#### Format: Script

```markdown
# [Project Name]: A Developer's Journey
## Script Draft from Rounds [N] to [M]

---

## Act 1: The Beginning

[Narrator]: "When we started building [Project], we believed [initial assumptions from early rounds]..."

[Scene]: Show early commits, initial architecture

[Narrator]: "But we were about to learn something important."

---

## Act 2: The Pivots

### Chapter 1: [First Major Arc]

[Narrator]: "In Round [N], we thought [starting belief]. We built [what we built]."

[Beat]: "But then we discovered [transformation]."

[Narrator]: "This changed how we thought about [domain]."

### Chapter 2: [Second Major Arc]
...

---

## Act 3: The Resolution

[Narrator]: "After [X] rounds, we now understand:"

1. [Key learning 1]
2. [Key learning 2]
3. [Key learning 3]

[Narrator]: "The journey isn't over. Next, we're exploring [current round goal]."
```

#### Format: Case Study

```markdown
# Case Study: [Project Name]
## Lessons from [X] Rounds of Development

---

## Executive Summary

Over [X] rounds spanning [timeframe], the [Project] team transformed their understanding of [domain] through systematic iteration.

**Key Metrics:**
- Rounds completed: [N]
- Major pivots: [M]
- Core learnings: [L]

---

## Challenge

[Initial problem statement from Round 1]

**Initial Assumptions:**
- [Starting beliefs from early rounds]

---

## Journey

### Phase 1: [Rounds N-M]
**Focus:** [Theme of these rounds]

| Round | Arc Summary |
|-------|-------------|
| [N] | From [start] → To [end] |
| [N+1] | From [start] → To [end] |

**Key Transformation:** [What changed understanding]

### Phase 2: [Rounds M-P]
...

---

## Results

**What We Learned:**

1. **[Learning Category]**: [Specific insight]
   - Evidence: [From which round]
   - Application: [How we applied it]

2. **[Learning Category]**: [Specific insight]
   ...

---

## Recommendations

Based on our journey:

1. [Actionable recommendation from learnings]
2. [Another recommendation]
3. [Third recommendation]

---

## Appendix: Round-by-Round Arcs

| Round | Type | Goal | Arc (abbreviated) |
|-------|------|------|-------------------|
| [N] | [type] | [goal] | [one-line arc] |
```

## Theme Detection

Auto-detect story themes based on Arc patterns:

| Pattern | Suggested Theme |
|---------|-----------------|
| Multiple user-related pivots | "Understanding Our Users" |
| Technical architecture changes | "Building the Right Foundation" |
| Scope changes (expand/contract) | "Finding the Right Size" |
| Performance/reliability focus | "Making It Work at Scale" |
| Business model pivots | "Finding Product-Market Fit" |

## Example Output

```
Compiling rounds 50-60 in presentation format...

Found 11 rounds with Arc statements.

Detected themes:
- User behavior insights (Rounds 51, 54, 57)
- Technical scaling (Rounds 52, 56, 59)
- UX simplification (Rounds 53, 55, 58, 60)

Generated: .compound-beads/compilations/rounds-50-60-presentation.md

Preview:

  # CloneICP: The Journey
  ## Slides from Rounds 50 to 60

  Slide 1: The Starting Point
  - "Users need maximum control"
  - "Performance requires custom solutions"
  - "More features = better product"

  Slide 5: The Big Pivot (Round 54)
  Started: Complex filters serve power users
  Ended: Smart defaults serve everyone
  Transformation: 73% never touched advanced options

  [... 8 more slides ...]

  Slide 14: What We Know Now
  - Users want smart defaults, not control panels
  - Framework defaults outperform custom code
  - Remove features to improve the product
```

## Tips

- **Run after milestones**: Compile after every 10 rounds for digestible stories
- **Choose format based on audience**: Presentation for stakeholders, script for demos, case study for documentation
- **Edit the output**: Generated content is a draft - refine for your audience
- **Save compilations**: Store in `.compound-beads/compilations/` for reference
