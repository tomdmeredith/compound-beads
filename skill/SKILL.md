# Compound Beads Skill v3.0

A methodology for iterative development that compounds knowledge across sessions.

**Key features: AGENTS.md passive context layer, round types, narrative capture, session intelligence capture, instant continuity, AI-initiated prompts.**

> Built from 127 rounds of real usage feedback. Evidence-based evolution.

## My Role

I am Claude, assisting with iterative development using Compound Beads methodology. When working on a project that uses this methodology, I maintain awareness of the current round state, track modifications, and ensure knowledge compounds across sessions.

---

## Step -1: Check AGENTS.md (Passive Context)

Before loading any CB files, check for `AGENTS.md` at the project root:
1. If `AGENTS.md` exists — it is automatically loaded by Claude Code as passive context. The methodology, auto-triggers, configured skills, tools, and project rules are already in the prompt.
2. If `AGENTS.md` does NOT exist but `.compound-beads/` does — this is a pre-v3.0 project. Offer to create AGENTS.md: "This project uses Compound Beads but has no AGENTS.md. Create one for passive context?"
3. If neither exists — this is a new project. Follow normal initialization.

AGENTS.md solves the "fire alarm paradox": auto-triggers only work when the skill is loaded, but AGENTS.md is always loaded as native Claude Code passive context.

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
| Session start (no session ID recorded yet) | "Let me record this session ID for traceability..." |
| Session magnitude assessed as SIGNIFICANT | "This was a significant session. Let me run full intelligence capture..." |
| 3+ decisions made in session | "Several decisions were made. Let me capture the rationale..." |
| Error or dead end encountered | "We hit a dead end. Let me record this so future sessions avoid it..." |
| Open question persists 3+ sessions | "The question about [X] has been open for 3 sessions. Dedicate a round or deprioritize?" |
| `.compound-beads/` exists but no `AGENTS.md` | "This project uses CB but has no AGENTS.md. Create one for passive context?" |
| First init of new project | "Run /compound:discover to add skills and tools to this project?" |

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
| `get-session-id` | Detect current Claude Code session UUID | (read-only) |
| `add-decision` | Record a decision with rationale | rounds.jsonl, context.md |
| `add-question` | Record an open question | context.md |
| `add-prevention-rule` | Record a mistake-derived prevention rule | learnings.md |
| `promote-pattern` | Promote observation → pattern → guideline | learnings.md |

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
| `/compound:process-session` | Extract session intelligence into CB artifacts |
| `/compound:close-session` | Run session close protocol (calls process-session) |
| `/compound:discover` | Scan skills/tools, copy to project, compress into AGENTS.md |

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

### Outcome 7: Memory Management

Context files should not grow unbounded:
- If context.md > 5000 chars, archive old rounds
- Preserve recent rounds (last 3) in detail
- Compress older rounds to single-line summaries in archive/

### Outcome 8: Ready Status

Track what can be immediately resumed:
- [READY] Tasks with no blockers
- [BLOCKED] Tasks waiting on something (with reason)
- Show in `/compound:status` output

### Outcome 9: Session Close Protocol

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

### Outcome 10: Instant Continuity

QUICKSTART.md must always be current so any new Claude instance can pick up immediately:
- Auto-regenerated at session close
- Contains: current round, type, status, next steps, recent history
- Under 500 chars total
- Points to CLAUDE.md for full context

### Outcome 11: Session Traceability

Every round tracks which Claude Code sessions contributed to it:
- Session ID (UUID v4) captured at round start, session close, and arc capture
- Multiple sessions per round supported (a round may span sessions)
- Session IDs enable `claude -r <session-id>` to return to any conversation
- Stored in `rounds.jsonl` events and `context.md`

**Detection method:** Extract UUID from scratchpad directory path, or read last entry of `~/.claude/history.jsonl`.

### Outcome 12: Session Intelligence Capture

Before closing a session, systematically extract all valuable intelligence:
- **9 categories captured**: Work items, code changes, decisions, learnings, errors/dead ends, continuity, blockers, patterns, questions
- **Magnitude-based depth**: SMALL sessions get lightweight capture, SIGNIFICANT sessions get full extraction
- **Compounding mechanisms**: Three-tier knowledge promotion (observation → pattern → guideline), mistake → prevention rule pipeline, dead ends registry, persistent open questions
- **Completeness test**: After processing, a fresh Claude instance can understand what was done, why, what not to do, where to resume, what's new, what's unknown, and what patterns to apply — without needing the raw session transcript

See `/compound:process-session` for the full protocol.

### Outcome 13: Passive Context Layer

AGENTS.md at the project root provides passive context that Claude Code reads automatically:
- CB methodology and auto-triggers are always in the prompt — no skill loading required
- Configured skills are listed with trigger phrases so Claude can recognize when to invoke them
- Tools and MCPs are listed so Claude knows what's available
- Project rules accumulate as the project evolves
- Solves the "fire alarm paradox" where auto-triggers only fire when the skill is loaded

### Outcome 14: Skill Artifact Protocol

Skills copied to `.compound-beads/skills/{name}/` during discovery:
- Each copy evolves independently per-project (can diverge from global version)
- Skill outputs go to `.compound-beads/skills/{name}/output/`
- AGENTS.md contains compressed one-line entries for each skill (name, description, triggers, output)
- Re-running `/compound:discover` adds new skills without removing existing ones

---

## What Exists in This Methodology

| File | Purpose |
|------|---------|
| `AGENTS.md` | Passive context layer (always loaded by Claude Code) |
| `.compound-beads/QUICKSTART.md` | Instant continuity (<500 chars, auto-updated) |
| `.compound-beads/context.md` | Portable memory (current state) |
| `.compound-beads/rounds.jsonl` | Machine-readable round history (event-based) |
| `.compound-beads/learnings.md` | Compounded insights across rounds |
| `.compound-beads/archive/` | Compressed old rounds |
| `.compound-beads/skills/` | Per-project skill copies (from /compound:discover) |
| `CLAUDE.md` | Human-readable handoff document |
| `docs/METHODOLOGY.md` | Full methodology documentation |

**Templates (for presentations and reference):**

| Template | Purpose |
|----------|---------|
| `templates/beat-sheet.md` | Script-ready narrative for presentations |
| `templates/round-card.md` | Single-page round summary for quick reference |
| `templates/round.md` | Full round documentation with Arc |
| `templates/expert-panel.md` | Expert panel notes |

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
6. Create `AGENTS.md` at project root from template
7. Create `.compound-beads/skills/` directory
8. Run skill discovery (`/compound:discover`)
9. Add reference line to CLAUDE.md (if it exists)
10. Start Round 1 with initialization goal

---

## Completion Signals

| Signal | What It Means |
|--------|---------------|
| Round complete | Update context.md status to "complete", update CLAUDE.md |
| Session end | Update context.md with progress, partial completion if interrupted |
| Archive needed | Move old content to archive/, summarize in context.md |
| Handoff complete | CLAUDE.md reflects current state, context.md ready for next session |
