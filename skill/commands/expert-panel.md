# /compound:panel

Convene an expert panel from unrelated domains for fresh perspectives.

**This is the signature feature of Compound Beads.**

## Trigger

- User invokes `/compound:panel`
- Context.md indicates expert panel required and not yet completed
- Claude detects complex decision matching panel criteria

## The Core Principle

Find experts who deal with **SIMILAR PATTERNS** in **DIFFERENT CONTEXTS**. The goal is fresh perspective, not domain expertise.

**Anti-Pattern: Domain Proximity**
If building search software, don't just consult other search engineers. That's groupthink. Go further afield.

## Process

### 1. Define the Problem Space
Analyze the current decision/feature and identify:
- What patterns are at play? (time pressure, resource allocation, trust verification, etc.)
- What makes this decision complex?
- What assumptions might be blinding us?

### 2. Select Experts (3-5)
Choose experts from domains that handle similar patterns differently.

**Pattern to Domain Mapping (Inspiration, Not Limits):**

| Pattern | Example Domains |
|---------|-----------------|
| Time-pressure decisions | ER triage, air traffic, trading floors, sports referees |
| Resource allocation | Restaurant seating, airline yield, hospital beds, logistics |
| Risk assessment | Insurance underwriting, casino security, venture capital |
| Quality control | Manufacturing QA, restaurant inspection, code review |
| User behavior prediction | Casino surveillance, fraud detection, UX research |
| Complex scheduling | Operating rooms, airline crew, film production |
| Trust verification | Border security, journalism fact-checking |
| Pattern recognition | Radiology, wine tasting, sports scouting |

**The "Unexpected" Is Often Best**
A sommelier's categorization approach might inform your scoring algorithm.
A jazz musician's improvisation structure might inform error recovery.
Never limit yourself to obvious choices.

### 3. Consult Each Expert
For each expert, ask:
- "How would you approach this problem?"
- "What would be your first concern?"
- "What common mistakes do you see in your field?"
- "What signals do you look for?"

Document their perspective:
```markdown
### Expert: [Role] ([Field])
**Key Insight:** [Their unique perspective]
**Applied to Our Problem:** [How it translates]
**Recommendation:** [Specific action or consideration]
```

### 4. Synthesize Insights
Look for:
- Common themes across experts
- Contradictions that reveal trade-offs
- Non-obvious connections
- Assumptions that were challenged

### 5. Document Reasoning
Use `add-expert` primitive to record in context.md:
```markdown
## Expert Panel (Round 53)
**Decision:** [What we're deciding]

| Expert | Field | Key Insight | Applied |
|--------|-------|-------------|---------|
| ER Nurse | Healthcare | Severity-based triage | Priority queue |
| Casino Pit Boss | Gaming | Pattern detection | Abuse flags |

### Synthesis
[Combined insights and how they inform our decision]

### Decision Made
[What we decided and why, citing expert insights]
```

## Example: Search Result Ranking

**Problem:** How to rank people search results?

**Experts Consulted:**
1. **Wine Sommelier** - Categorizes subtle differences → Use tiered quality bands (Platinum/Gold/Silver)
2. **Sports Scout** - Weighs potential vs current performance → Add trajectory scoring
3. **Casino Pit Boss** - Spots anomalies in patterns → Flag unusual activity patterns
4. **ER Triage Nurse** - Quick severity assessment → Fast pre-filter before deep analysis

**Synthesis:** Don't just score linearly. Create quality bands like wine ratings, spot trajectory like scouts, flag anomalies like casinos, and pre-filter quickly like ER triage.

## Example Output

```
Expert Panel convened for Round 53: User Authentication

Problem Space: Trust verification + time-pressure (users hate friction)

Panel:
1. Border Security Agent - Document verification patterns
2. Nightclub Bouncer - Quick visual assessment + trust signals
3. Loan Officer - Risk tolerance thresholds
4. Airline Gate Agent - Time pressure + identity verification

Synthesis:
- Bouncer: "Regulars get fast-tracked" → Returning user quick path
- Border Agent: "Multiple documents strengthen trust" → Social login + email
- Loan Officer: "Risk varies by transaction size" → Step-up auth for sensitive actions
- Gate Agent: "Delay costs reputation" → Async verification, don't block

Decision: Implement progressive trust with step-up authentication.
Cited insights documented in context.md.
```

## Primitives Composed

| Primitive | Usage |
|-----------|-------|
| `read-state` | Get current decision context |
| `add-expert` | Record each expert perspective |
| `log-file` | Track panel documentation |
