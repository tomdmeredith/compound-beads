# /compound:compound

Extract learnings AND capture The Arc from the current round before marking it complete.

**This is how knowledge compounds across rounds AND stories get captured.**

## Trigger

- User invokes `/compound:compound`
- Round marked as complete (auto-trigger prompts)
- Completion signals detected ("that worked", "it's fixed", "working now")
- Before archiving a round

## Process

### 1. Review Round Accomplishments
Gather from context:
- What was the goal?
- What type of round was this?
- What files were modified?
- What decisions were made?
- What worked? What didn't?

### 2. Capture The Arc (REQUIRED)

Every round captures a 3-sentence transformation. Ask:

**We started believing:**
"What assumption or hypothesis did we have at the start?"

**We ended believing:**
"What do we now understand to be true?"

**The transformation:**
"In one sentence, what changed our understanding?"

**Example Arc:**
```markdown
## The Arc
**We started believing**: Users want maximum control over search filters
**We ended believing**: Users want smart defaults with easy overrides
**The transformation**: A/B test showed 73% of users never touched advanced filters
```

### 3. Capture Additional Narrative (Major Rounds)

For significant rounds, also capture:

**The Pivot Point:**
"What single moment or discovery changed everything in this round?"

**Stakes:**
"Why did this round matter? What was at risk?"

### 4. Extract Learnings
Ask these questions systematically:

**Beyond This Round**
- What did we learn that applies to OTHER features/rounds?
- What patterns emerged that we'll see again?

**Process Insights**
- What should become a guideline for future work?
- What assumptions were wrong?

**Technical Insights**
- What code patterns worked well?
- What would we do differently?

**Surprises**
- What was unexpected?
- What didn't we anticipate?

### 5. Document Learnings
Append to `.compound-beads/learnings.md`:

```markdown
## Round 53 Learnings (cb-f3a8)
**Goal:** Implement user authentication
**Type:** feature
**Date:** 2026-01-09

### The Arc
**We started believing**: Users need email/password auth
**We ended believing**: Social login is essential, email is fallback
**The transformation**: Observing signup friction showed 60% drop-off at password creation

### Process Insights
- **Learning:** Social login reduces friction more than expected (+40% completion)
- **Future Application:** Default to social login for all new features

### Technical Insights
- **Learning:** Supabase Auth handles edge cases we didn't anticipate
- **Future Application:** Trust framework defaults before building custom

### Surprises
- **Learning:** Email verification emails have 15% bounce rate
- **Future Application:** Add email validation before sending

---
```

### 6. Append Arc to rounds.jsonl
```json
{"event":"arc_captured","machineId":"cb-f3a8","startedBelieving":"Users need email/password auth","endedBelieving":"Social login is essential","transformation":"Observing signup friction..."}
```

### 7. Update Round Status
Mark round as complete in context.md:
```markdown
## Current Round
- **Status**: complete
- **Completed**: 2026-01-09
- **Arc Captured**: YES
- **Learnings Extracted**: YES
```

### 8. Archive if Needed
If this round is old enough, compress:
```markdown
# Round 53 (cb-f3a8) - ARCHIVED
Type: feature
Goal: User authentication
Arc: From email-first to social-first auth based on friction data
Key Learning: Trust framework defaults before custom
```

## Learnings Categories

| Category | What to Capture |
|----------|-----------------|
| Process | How we worked (methodology insights) |
| Technical | Code, architecture, tool discoveries |
| Domain | Product/business understanding |
| Surprises | Unexpected discoveries |
| Anti-Patterns | What to avoid in future |

## Arc Patterns to Watch For

Common Arc types that make good stories:

| Pattern | Example |
|---------|---------|
| **Assumption Flip** | "We assumed X, data showed Y" |
| **Scope Shift** | "Started small, realized it needed to be bigger (or vice versa)" |
| **Hidden Complexity** | "Looked simple, turned out complex" |
| **Unexpected Win** | "Solved this, accidentally fixed other things" |
| **User Insight** | "Users don't think about it the way we do" |

## Example Output

```
Compound phase for Round 53 (cb-f3a8)

The Arc:
  Started: Users need email/password auth
  Ended: Social login is essential, email is fallback
  Transformation: Observing signup friction showed 60% drop-off at password creation

Extracted 3 learnings:
1. [Process] Social login reduces friction +40%
2. [Technical] Supabase Auth handles edge cases well
3. [Surprise] 15% email bounce rate

Appended to: .compound-beads/learnings.md
Arc recorded in: .compound-beads/rounds.jsonl
Round 53 marked complete.
```

## Compilation Preview

Run `/compound:compile` to turn Arc statements into:
- Presentation outline
- Script draft
- Case study format
