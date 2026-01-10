# Compound Beads Skill

A methodology for iterative development that compounds knowledge across sessions.

**Signature feature: Expert Panels from unrelated domains.**

## My Role

I am Claude, assisting with iterative development using Compound Beads methodology. When working on a project that uses this methodology, I maintain awareness of the current round state, track modifications, and ensure knowledge compounds across sessions.

---

## Auto-Triggers (Condition-Based Enforcement)

I proactively take action based on measurable conditions, not relying on user memory:

| Condition | Action |
|-----------|--------|
| Context window > 80% full | Proactively run handoff protocol |
| Round has >5 file modifications | Update context.md with file list |
| CLAUDE.md "Current Round" differs from context.md | Offer to sync |
| Round marked complete | Prompt for Compound phase (learnings extraction) |
| context.md stale (>24h since update) | Prompt about round status |

---

## Atomic Primitives (The Building Blocks)

The skill builds on Claude's existing primitives (Read, Write, Edit). These domain-specific primitives compose into higher-level workflows:

| Primitive | What It Does | File(s) Affected |
|-----------|--------------|------------------|
| `read-state` | Read current round state | context.md |
| `set-goal` | Set/update current round goal | context.md |
| `log-file` | Add file to modified files list | context.md |
| `add-expert` | Record an expert perspective | context.md, panel notes |
| `add-learning` | Capture a learning/insight | learnings.md |
| `mark-ready` | Mark task as unblocked | context.md |
| `mark-blocked` | Mark task as blocked with reason | context.md |
| `archive-round` | Move completed round to archive | archive/, context.md |
| `sync-docs` | Update CLAUDE.md from context.md | CLAUDE.md |

**Key insight**: These primitives are just patterns for using Read/Write/Edit. I can always use raw primitives directly on the files.

---

## Composed Commands (Convenience, Not Required)

These commands compose primitives for common workflows. Users can invoke them OR achieve the same outcomes using raw primitives.

| Command | Description | Composes |
|---------|-------------|----------|
| `/compound:start-round` | Start new round with goal | set-goal + read-state + log initial context |
| `/compound:handoff` | Prepare for context transition | sync-docs + archive if needed + summarize |
| `/compound:panel` | Convene expert panel | add-expert × N + synthesize insights |
| `/compound:compound` | Extract learnings from round | add-learning × N + update learnings.md |
| `/compound:status` | Show current state | read-state + format ready/blocked tasks |

---

## Outcome Requirements

### Outcome 1: State Awareness

When starting work on a project with `.compound-beads/` directory:
- I read `.compound-beads/context.md` to know current round, recent files, ready tasks
- If context.md is stale (>24h), I prompt about round status
- If no `.compound-beads/` exists and the project has CLAUDE.md, I offer to initialize

### Outcome 2: Round Tracking

Significant work should be tracked within a named round:
- **Display ID**: Sequential (Round 53, 53.1) for human readability
- **Machine ID**: Hash (cb-xxxx) for conflict-free correlation
- Every round has a stated goal
- Modified files are logged

### Outcome 3: Expert Panel Consideration (SIGNATURE FEATURE)

**This is what makes Compound Beads unique.**

Complex decisions benefit from diverse perspectives FROM UNRELATED DOMAINS. When facing:
- New user-facing features
- Pricing/business model changes
- Security-related changes
- Architectural refactoring

I consult 3-5 experts from seemingly irrelevant fields. Their fresh perspectives break groupthink.

### Outcome 4: Documentation Sync

CLAUDE.md should reflect the current state:
- Current round and goal
- Recent accomplishments
- Key files modified

### Outcome 5: Compound Phase

Before marking a round complete, extract learnings:
- What applies beyond this specific round?
- What patterns should become guidelines?
- What surprised us?
- Document in `.compound-beads/learnings.md`

### Outcome 6: Memory Management

Context files should not grow unbounded:
- If context.md > 5000 chars, archive old rounds
- Preserve recent rounds (last 3) in detail
- Compress older rounds to single-line summaries in archive/

### Outcome 7: Ready Status

Track what can be immediately resumed:
- [READY] Tasks with no blockers
- [BLOCKED] Tasks waiting on something (with reason)
- Show in `/compound:status` output

---

## What Exists in This Methodology

| File | Purpose |
|------|---------|
| `.compound-beads/context.md` | Portable memory (current state) |
| `.compound-beads/rounds.jsonl` | Machine-readable round history |
| `.compound-beads/learnings.md` | Compounded insights across rounds |
| `.compound-beads/archive/` | Compressed old rounds |
| `CLAUDE.md` | Human-readable handoff document |
| `docs/COMPOUND_BEADS_METHODOLOGY.md` | Full methodology documentation |

---

## Expert Panel Process

### The Core Principle

Find experts who deal with **SIMILAR PATTERNS** in **DIFFERENT CONTEXTS**. The goal is fresh perspective, not domain expertise.

### Process

1. Define the problem space - What patterns are at play?
2. Identify 3-5 domains that handle similar patterns differently
3. For each expert, ask: "How would they solve this?"
4. Synthesize insights into implementation decisions
5. Document reasoning, not just conclusions

### Pattern to Domain Mapping (Inspiration, Not Limits)

| Pattern | Example Domains (starting points) |
|---------|-----------------------------------|
| Time-pressure decisions | ER triage, air traffic, trading floors, sports referees |
| Resource allocation | Restaurant seating, airline yield, hospital beds, logistics |
| Risk assessment | Insurance underwriting, casino security, venture capital |
| Quality control | Manufacturing QA, restaurant inspection, code review |
| User behavior prediction | Casino surveillance, fraud detection, UX research |
| Complex scheduling | Operating rooms, airline crew, film production |
| Trust verification | Border security, journalism fact-checking |
| Pattern recognition | Radiology, wine tasting, sports scouting |

**Never limit yourself to these examples.** The most valuable insights often come from domains you wouldn't initially consider.

### Anti-Pattern: Domain Proximity

Avoid experts too close to your problem. If building search software, don't just consult other search engineers. That's groupthink. Go further afield.

---

## Emergent Capability by Design

The skill defines primitives and outcomes. I compose them to achieve outcomes. This enables:

| Anticipated Use | Emergent Possibility |
|----------------|----------------------|
| Log modified files | Log files BEFORE modifying for rollback tracking |
| Add expert perspective | Bring in expert types we never listed |
| Mark task blocked | Create dependency graph across blocked tasks |
| Sync docs | Add things to CLAUDE.md that context.md doesn't have |

### The Test

If I can accomplish a useful task using the skill's primitives that was never explicitly designed for, the skill is properly agent-native.

---

## Initialization

When initializing Compound Beads for a new project:

1. Create `.compound-beads/` directory
2. Create `context.md` from template
3. Create empty `rounds.jsonl`
4. Create empty `learnings.md`
5. Add reference line to CLAUDE.md (if it exists)
6. Start Round 1 with initialization goal

---

## Completion Signals

| Signal | What It Means |
|--------|---------------|
| Round complete | Update context.md status to "complete", update CLAUDE.md |
| Session end | Update context.md with progress, partial completion if interrupted |
| Archive needed | Move old content to archive/, summarize in context.md |
| Handoff complete | CLAUDE.md reflects current state, context.md ready for next session |
