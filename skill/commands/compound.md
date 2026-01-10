# /compound:compound

Extract learnings from the current round before marking it complete.

**This is how knowledge compounds across rounds.**

## Trigger

- User invokes `/compound:compound`
- Round marked as complete (auto-trigger prompts)
- Before archiving a round

## The Purpose

Compound Beads methodology compounds knowledge. Each round's learnings inform future decisions. Without explicit extraction, insights get lost.

## Process

### 1. Review Round Accomplishments
Use `read-state` primitive to gather:
- What was the goal?
- What files were modified?
- What decisions were made?
- What expert panel insights emerged?
- What worked? What didn't?

### 2. Extract Learnings
Ask these questions systematically:

**Beyond This Round**
- What did we learn that applies to OTHER features/rounds?
- What patterns emerged that we'll see again?

**Process Insights**
- What should become a guideline for future work?
- What assumptions were wrong?
- What took longer/shorter than expected?

**Technical Insights**
- What code patterns worked well?
- What architecture decisions proved valuable?
- What would we do differently?

**Surprises**
- What was unexpected?
- What didn't we anticipate?
- What edge cases surprised us?

### 3. Document Learnings
Use `add-learning` primitive to append to `.compound-beads/learnings.md`:

```markdown
## Round 53 Learnings (cb-f3a8)
**Goal:** Implement user authentication
**Date:** 2026-01-09

### Process Insights
- **Learning:** Social login reduces friction more than expected (+40% completion)
- **Future Application:** Default to social login for all new features

### Technical Insights
- **Learning:** Supabase Auth handles edge cases we didn't anticipate
- **Future Application:** Trust framework defaults before building custom

### Expert Panel Value
- **Learning:** Bouncer's "regulars get fast-tracked" insight was highest impact
- **Future Application:** Always include a "quick judgment" expert on trust panels

### Surprises
- **Learning:** Email verification emails have 15% bounce rate
- **Future Application:** Add email validation before sending

---
```

### 4. Update Round Status
Mark round as complete in context.md:
```markdown
## Current Round
- **Status**: complete
- **Completed**: 2026-01-09
- **Learnings Extracted**: YES
```

### 5. Archive if Needed
If this round is old enough, use `archive-round` to compress:
```markdown
# Round 53 (cb-f3a8) - ARCHIVED
Goal: User authentication
Key Learning: Social login + progressive trust
Files: 12 modified
```

## Learnings Categories

| Category | What to Capture |
|----------|-----------------|
| Process | How we worked (methodology insights) |
| Technical | Code, architecture, tool discoveries |
| Domain | Product/business understanding |
| Expert Panel | Which expert perspectives added most value |
| Anti-Patterns | What to avoid in future |
| Surprises | Unexpected discoveries |

## Example Output

```
Compound phase for Round 53 (cb-f3a8)

Extracted 4 learnings:

1. [Process] Social login reduces friction +40%
   → Default to social login for new features

2. [Technical] Supabase Auth handles edge cases well
   → Trust framework defaults before custom

3. [Expert Panel] "Regulars get fast-tracked" was highest impact
   → Include "quick judgment" expert on trust panels

4. [Surprise] 15% email bounce rate
   → Add email validation before sending

Appended to: .compound-beads/learnings.md
Round 53 marked complete.
```

## Primitives Composed

| Primitive | Usage |
|-----------|-------|
| `read-state` | Get round accomplishments and context |
| `add-learning` | Append each learning to learnings.md |
| `archive-round` | Compress if round is old enough |
| `sync-docs` | Update CLAUDE.md status |
