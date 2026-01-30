# /compound:research

Search accumulated learnings and past rounds for relevant patterns before starting work.

**This is "Step 0" - run BEFORE starting new rounds or tackling unfamiliar problems.**

## Trigger

- User invokes `/compound:research [topic]`
- Starting a round in a domain with past learnings
- Encountering a problem that might have been solved before
- Before making architectural decisions

## Process

### Step 1: Search Learnings Repository

Search `.compound-beads/learnings.md` for relevant entries using Claude's Grep tool:

```
Grep pattern: "[topic]" path: ".compound-beads/learnings.md"
```

**Note:** Always use Claude's built-in Grep tool rather than raw bash `grep` commands. The Grep tool has been optimized for correct permissions and access.

Search these sections specifically:
- **Round Learnings** — Direct insights from past rounds
- **Prevention Rules** — Rules derived from errors with generalizable root causes
- **Dead Ends Registry** — Failed approaches so you never repeat them
- **Recognized Patterns** — Reusable patterns seen across multiple sessions
- **Established Guidelines** — Patterns validated 3+ times (highest confidence)

Look for:
- Direct matches to the problem domain
- Related patterns (e.g., searching "auth" also finds "security", "login")
- Prevention rules that apply to this work
- Dead ends to avoid
- Proven solutions and established guidelines

### Step 2: Search Past Rounds

Search `rounds.jsonl` for relevant history using Claude's Grep tool:

```
Grep pattern: "[topic]" path: ".compound-beads/rounds.jsonl"
```

Search for these event types:
- `round_started` / `round_completed` — Rounds with similar goals
- `session_processed` — Detailed session intelligence (decisions, learnings, errors)
- `decision_made` — Past decisions in this domain with rationale
- `learning_captured` — Specific learnings by category
- `error_captured` — Past mistakes and their prevention rules
- `pattern_recognized` — Reusable patterns
- `question_raised` — Unresolved questions in this area

Look for:
- Rounds with similar goals
- Arc statements showing transformations in this domain
- Decisions and their rationale
- Errors and dead ends to avoid
- Pivot points that changed approach
- Expert insights that were applied

### Step 3: Search Session Intelligence

Search for specific intelligence categories in `rounds.jsonl`:

```
Grep pattern: "decision_made.*[topic]" path: ".compound-beads/rounds.jsonl"
Grep pattern: "error_captured.*[topic]" path: ".compound-beads/rounds.jsonl"
Grep pattern: "question_raised.*[topic]" path: ".compound-beads/rounds.jsonl"
```

Also check `context.md` for:
- **Open Questions** — Unresolved questions that may relate to this topic
- **Discovered Work** — Items found in previous sessions
- **Session Decisions** — Recent choices and their rationale

### Step 4: Check CLAUDE.md History

Review `CLAUDE.md` sections:
- Key Decisions (why things are the way they are)
- Architecture Patterns (established approaches)
- Known Issues (landmines to avoid)

### Step 5: Compile Relevant Context

Create a research summary:

```markdown
## Research Summary: [Topic]

### From Learnings
| Source | Insight | Severity |
|--------|---------|----------|
| Round N | [What was learned] | [high/medium/low] |

### From Past Rounds
| Round | Goal | Relevant Arc |
|-------|------|--------------|
| N | [Goal] | [Transformation] |

### Key Decisions Already Made
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

### Prevention Rules
- [Rule 1]: [Trigger condition → Required action]
- [Rule 2]: [Trigger condition → Required action]

### Patterns to Apply
- [Pattern 1] (confidence: established/recognized/observation)
- [Pattern 2] (confidence: established/recognized/observation)

### Dead Ends to Avoid
- [Approach 1]: [Why it failed, what to do instead]
- [Approach 2]: [Why it failed, what to do instead]

### Open Questions
- [Question 1]: [urgency: blocking/important/curious]
- [Question 2]: [urgency: blocking/important/curious]

### Recommended Approach
Based on prior work, consider:
1. [Recommendation]
2. [Recommendation]
```

## Search Strategies

### Keyword Expansion

Don't just search the literal topic. Expand to related terms:

| Topic | Also Search |
|-------|-------------|
| authentication | auth, login, session, security, oauth, jwt |
| database | db, schema, migration, query, model |
| performance | speed, latency, cache, optimize |
| testing | test, spec, mock, fixture, coverage |
| deployment | deploy, ci, cd, release, production |

### Pattern Matching

Look for abstract patterns, not just literal matches:

| Problem | Pattern to Search |
|---------|------------------|
| "Slow API endpoint" | performance, caching, n+1, query optimization |
| "Users confused by UI" | ux, onboarding, simplification, progressive disclosure |
| "Flaky tests" | test isolation, race condition, timing, mock |

## Output Format

### Quick Summary (Default)

```
Research: [Topic]

Found 3 relevant learnings:
1. [Round 45] "Always validate X before Y" (high severity)
2. [Round 67] "Consider Z for performance" (medium severity)
3. [Round 89] "Avoid pattern W, use V instead" (high severity)

Found 1 prevention rule:
⚠️  [Round 45] "When touching validation, always run integration tests first"

Found 1 dead end:
🚫 [Round 89] "Browser fingerprinting for device tracking — too unreliable"

Found 2 relevant rounds:
- Round 45: [Arc summary]
- Round 67: [Arc summary]

Open questions in this area: 1
❓ "Should users link multiple social accounts?" (important)

Key recommendation: [One-liner based on learnings]
```

### Full Report (with --detailed flag)

Includes complete context from all sources with quotes and rationale.

## Integration with Round Start

When starting a new round, Step 0 should include:

```markdown
## Step 0: Load Context (MANDATORY)

1. Read QUICKSTART.md for current state
2. Run /compound:research [round topic] for relevant history
3. Apply learnings to round planning
```

## Example Session

```
User: /compound:research authentication

Claude: Searching learnings and past rounds for "authentication"...

Research: Authentication

Found 2 relevant learnings:
1. [Round 51] "Use Supabase Auth for social login - handles OAuth complexity"
   Severity: high

2. [Round 78] "Always implement email fallback - social providers have outages"
   Severity: medium

Found 1 relevant round:
- Round 51: "Implement user authentication"
  Arc: Started believing custom auth was needed → Ended believing
  Supabase handles 90% of cases → Use managed auth, extend only when needed

Key Decisions from CLAUDE.md:
- Using Supabase Auth (decided Round 51)
- Social login: Google, GitHub
- Email/password as fallback

Recommendation: Build on existing Supabase Auth setup. Check if current
implementation needs extension or if this is a new authentication concern.
```

## When Research Finds Nothing

If no relevant history exists:

```
Research: [Topic]

No prior learnings found for "[topic]" or related terms.

This appears to be a new domain for this project.
Consider:
1. Creating learnings as you discover patterns
2. Checking if an Expert Panel would help (see /compound:expert-panel)
3. Documenting decisions carefully for future reference
```

## Auto-Trigger

Claude should offer research when:
- Starting a round with `type: feature` in a domain with past rounds
- User mentions a problem that matches keywords in learnings
- Before making decisions that contradict documented patterns

Prompt: "I found relevant learnings about [topic]. Want me to summarize them before we proceed?"
