# Compound Beads Skill v2.0

A methodology for iterative development that compounds knowledge across sessions.

**Key features: Round types, narrative capture, instant continuity, AI-initiated prompts.**

> Built from 127 rounds of real usage feedback. Evidence-based evolution.

## My Role

I am Claude, assisting with iterative development using Compound Beads methodology. When working on a project that uses this methodology, I maintain awareness of the current round state, track modifications, and ensure knowledge compounds across sessions.

---

## Step 0: Load Context (MANDATORY)

Before starting any work on a project with `.compound-beads/`:
1. Auto-read `QUICKSTART.md` - Immediate context (<500 chars)
2. Auto-read `context.md` - Current state and tasks
3. Scan recent learnings - Relevant patterns from past rounds

**If QUICKSTART.md is stale (>24h):** Prompt "Context may be stale. Should I check round status?"

---

## Auto-Triggers (AI-Initiated Prompts)

I proactively prompt based on conditions, not relying on user memory:

| Condition | AI Prompt |
|-----------|-----------|
| Context window > 80% full | "Context is getting full. Let me run the handoff protocol..." |
| Round has >5 file modifications | "Should I update context.md with the modified files?" |
| CLAUDE.md "Current Round" differs from context.md | "CLAUDE.md and context.md are out of sync. Should I fix?" |
| Round marked complete | "Round complete. Let me capture the Arc and update docs..." |
| Session ending detected | "Before we wrap, let me run the session close protocol..." |
| Significant work completed | "Should I update CLAUDE.md with this progress?" |
| Complex multi-step work detected | "This looks complex - want me to create a plan file?" |
| Pattern discovered | "I noticed a useful pattern - add to learnings.md?" |
| Bead open > 7 days | "This bead has been open 7+ days - close, defer, or update?" |
| Completion signals detected ("that worked", "it's fixed") | "Great! Let me capture what we learned..." |

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

## Composed Commands

| Command | Description |
|---------|-------------|
| `/compound:start-round` | Start new round with type and goal |
| `/compound:handoff` | Prepare for context transition (includes session close) |
| `/compound:panel` | Convene expert panel (optional, use when stuck) |
| `/compound:compound` | Extract learnings and capture Arc |
| `/compound:status` | Show current round state and tasks |
| `/compound:compile` | Compile Arc statements into presentations |
| `/compound:research` | Search learnings for relevant patterns |
| `/compound:close-session` | Run session close protocol |

**Note:** Many of these run automatically via AI-initiated prompts. Manual invocation optional.

---

## Outcome Requirements

### Outcome 1: State Awareness

When starting work on a project with `.compound-beads/` directory:
- I read `.compound-beads/context.md` to know current round, recent files, ready tasks
- If context.md is stale (>24h), I prompt about round status
- If no `.compound-beads/` exists and the project has CLAUDE.md, I offer to initialize

### Outcome 2: Round Tracking

Significant work should be tracked within a named round:
- **Display ID**: Sequential integers (Round 53, 54, 55) - no decimals
- **Machine ID**: Hash (cb-xxxx) for conflict-free correlation
- **Type**: feature | bug_fix | triage | polish | infrastructure
- Every round has a stated goal
- Modified files are logged

**Round Types:**
| Type | Purpose |
|------|---------|
| feature | Ship new functionality (3-7 tasks typical) |
| bug_fix | Address issues (2-5 tasks typical) |
| triage | Convert feedback to tasks (creates many, closes few) |
| polish | Refine existing features (5-10 small tasks typical) |
| infrastructure | DevOps, config, DNS (1-3 tasks typical) |

**Sizing:** 30 min minimum, 4 hours maximum. Break larger work into multiple rounds.

### Outcome 3: Expert Panel (OPTIONAL TOOL)

**Downgraded from "signature feature" to "optional tool" based on real usage (5.5% of rounds).**

Use expert panels when:
- Genuinely stuck with no clear path forward
- Facing a novel problem domain with no prior art
- Want fresh perspective on a difficult decision

Skip expert panels when:
- Regular feature/bug work
- Path is clear
- Domain is familiar

When used, consult 3-5 experts from seemingly irrelevant fields for fresh perspectives.

### Outcome 4: Documentation Sync

CLAUDE.md should reflect the current state:
- Current round and goal
- Recent accomplishments
- Key files modified

### Outcome 5: Narrative Capture

Every round captures The Arc (3-sentence transformation):
```markdown
## The Arc
**We started believing**: [Initial hypothesis]
**We ended believing**: [Final understanding]
**The transformation**: [One sentence describing the shift]
```

For major rounds, also capture:
- **The Pivot Point**: Single most important turning moment
- **Stakes**: Why this mattered, what was at risk

### Outcome 6: Compound Phase

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

### Outcome 8: Session Close Protocol

Before session ends, run this checklist:
```
[ ] 1. git status              (check what changed)
[ ] 2. git add <files>         (stage code changes)
[ ] 3. git commit -m "..."     (commit code)
[ ] 4. Update rounds.jsonl     (add round entry if closing)
[ ] 5. Update context.md       (current state)
[ ] 6. Update QUICKSTART.md    (regenerate for next session)
[ ] 7. git push                (push to remote)
```

**Critical Rule:** *"Work is not done until pushed AND tracking files updated."*

### Outcome 9: Instant Continuity

QUICKSTART.md must always be current so any new Claude instance can pick up immediately:
- Auto-regenerated at session close
- Contains: current round, type, status, next steps, recent history
- Under 500 chars total
- Points to CLAUDE.md for full context

---

## What Exists in This Methodology

| File | Purpose |
|------|---------|
| `.compound-beads/QUICKSTART.md` | Instant continuity (<500 chars, auto-updated) |
| `.compound-beads/context.md` | Portable memory (current state) |
| `.compound-beads/rounds.jsonl` | Machine-readable round history (event-based) |
| `.compound-beads/learnings.md` | Compounded insights across rounds |
| `.compound-beads/archive/` | Compressed old rounds |
| `CLAUDE.md` | Human-readable handoff document |
| `docs/METHODOLOGY.md` | Full v2.0 methodology documentation |

---

## Expert Panel Process (When Needed)

> **Optional tool.** Use when genuinely stuck, not as standard practice.

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
2. Create `QUICKSTART.md` from template
3. Create `context.md` from template
4. Create empty `rounds.jsonl`
5. Create empty `learnings.md`
6. Add reference line to CLAUDE.md (if it exists)
6. Start Round 1 with initialization goal

---

## Completion Signals

| Signal | What It Means |
|--------|---------------|
| Round complete | Update context.md status to "complete", update CLAUDE.md |
| Session end | Update context.md with progress, partial completion if interrupted |
| Archive needed | Move old content to archive/, summarize in context.md |
| Handoff complete | CLAUDE.md reflects current state, context.md ready for next session |
