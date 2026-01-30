# /compound:process-session

Process the current Claude Code session to extract all valuable intelligence into Compound Beads artifacts.

**Once processed, the raw session transcript is unnecessary — all value has been captured.**

## Trigger

- Before `/compound:close-session` (called automatically)
- Before `/compound:handoff` (called automatically)
- User invokes `/compound:process-session` manually
- Session ending detected (auto-trigger)
- Completion signals detected ("that worked", "it's fixed", "working now")

## Phase 0: Assess Session Magnitude

Before running the full protocol, assess how deep to process:

| Magnitude | Criteria | Protocol Depth |
|-----------|----------|----------------|
| **SMALL** | <15 min AND <3 file changes | Phase 1 + work items + continuity only |
| **MEDIUM** | 15-60 min OR 3-10 file changes | All phases, standard depth |
| **SIGNIFICANT** | >60 min OR >10 changes OR round completed | All phases, expanded (full decision record, pattern analysis, error deep-dive) |

---

## Phase 1: GATHER (Automated)

Collect raw data from the session — these steps are mechanical.

### Step 1: Detect Session ID

Detect the current Claude Code session UUID using these methods (in priority order):

1. **Scratchpad path** — Extract the UUID segment from the scratchpad directory path (format: `/private/tmp/claude-<uid>/<encoded-path>/<session-uuid>/scratchpad`)
2. **History file** — Read the last entry of `~/.claude/history.jsonl` and extract the `sessionId` field
3. **Project sessions** — Find the most recently modified `.jsonl` file in `~/.claude/projects/<encoded-path>/`

Record the session UUID. This will be included in all events written to `rounds.jsonl`.

### Step 2: Snapshot Code State

```bash
git status
git diff --stat
git diff --name-status
git log --oneline -5
```

Classify files into: created, modified, deleted. Note change magnitudes.

### Step 3: Snapshot Round State

Read `.compound-beads/context.md`:
- Current round ID, type, goal, status
- Which tasks were already done vs. newly completed this session
- Previous modified files list (to diff against current)
- Existing open questions (to check for resolution)

### Step 4: Reconstruct Session Timeline

Review what happened in this session, in order:
- What was the first thing worked on?
- Were there pivots or redirections?
- What was the last thing worked on?
- How does the work relate to the stated round goal?

---

## Phase 2: EXTRACT (Judgment Required)

Extract intelligence from the session. Depth varies by magnitude.

### Step 5: Extract Work Items Ledger

Walk through every piece of work touched in this session and categorize:

| Status | What to Record | Example |
|--------|---------------|---------|
| **COMPLETED** | Task description + outcome | "Implemented retry logic — 3 retries with exponential backoff" |
| **IN_PROGRESS** | Task + exact stopping point (file, line, function) | "Email validation in `/src/lib/auth.ts:45` — stuck on international domain regex" |
| **DISCOVERED** | New work found + how it was discovered | "Rate limiter doesn't handle WebSocket — found during load testing" |
| **DEFERRED** | Task + rationale for deferral | "Apple Sign-In — Apple Developer account not set up yet" |
| **INVALIDATED** | Task + why it's no longer needed | "Email verification redesign — switching to magic links makes it unnecessary" |

For MEDIUM+ sessions, also note:
- Items that took significantly longer than expected (why?)
- Items that were easier than expected (why?)

### Step 6: Extract Intelligence

Systematically ask these questions. Skip sections that don't apply.

#### 6a. Decisions Made (MEDIUM+ sessions)

For each choice that required judgment:
- **What was the decision?**
- **What alternatives were considered?**
- **Why this choice?** (rationale)
- **How reversible is it?** (easy / moderate / difficult)
- **Will a future session need to know this?**

```markdown
### Decision: [Title]
**Choice:** [What was chosen]
**Alternatives:** [What was rejected]
**Rationale:** [Why]
**Reversibility:** [easy | moderate | difficult]
```

#### 6b. Learnings Discovered (All sessions)

What do I know now that I didn't at session start?

| Category | Question |
|----------|----------|
| **Technical** | What code, API, tool, or framework behavior did I discover? |
| **Process** | What did I learn about how to work effectively? |
| **Domain** | What did I learn about the product or business? |
| **Surprise** | What contradicted my expectations? |
| **Anti-pattern** | What should NOT be done in the future? |

For each learning, also capture:
- **Future application**: When would this insight be useful again?
- **Confidence**: High / medium / low

#### 6c. Errors and Dead Ends (All sessions)

What went wrong, or almost went wrong?

| Type | What to Record |
|------|---------------|
| **Bug found** | Issue + symptoms + where it manifests |
| **Bug fixed** | Issue + root cause + fix applied |
| **Failed approach** | What was tried + why it didn't work + what worked instead |
| **Near-miss** | Problem almost introduced but caught (e.g., almost committed secrets) |
| **Regression risk** | Change that could break existing functionality |

**For each error, ask:** Can this be generalized into a **Prevention Rule**?

A Prevention Rule is a reusable guideline that prevents this class of error:
```markdown
**Rule:** Never store auth tokens in localStorage
**Source:** Round N, Session [UUID]
**Severity:** Critical
**Context:** Replay attack vulnerability discovered during security review
```

#### 6d. Patterns Recognized (SIGNIFICANT sessions only)

Did I notice any reusable approach or recurring structure?

For each pattern:
- **Name**: A concise label (e.g., "Middleware chain", "Feature flag rollout")
- **Description**: What the pattern is and how it works
- **Applicability**: When to use it
- **Has this been seen before?** Check `learnings.md` — if yes, increment the count

**Pattern Promotion Rule:**
- Seen 1 time → Observation (stored under round learnings)
- Seen 2 times → Recognized Pattern (promoted to Patterns table)
- Seen 3+ times → Established Guideline (promoted to top of learnings.md)

#### 6e. Questions Raised (All sessions)

What questions came up that couldn't be answered?

| Field | Description |
|-------|-------------|
| **Question** | The question itself |
| **Category** | Technical / product / process / research |
| **Urgency** | Blocking (can't continue without answer) / important (should address soon) / curious (nice to know) |
| **Context** | Why this question matters |

Check existing Open Questions in `context.md` — were any resolved this session? If so, mark them RESOLVED with the answer.

### Step 7: Compose Continuity Package

Synthesize the handoff for the next session:

```markdown
## Continuity Package

**Stopping point:** [Exact file, line, function, and what's mid-way]
**Mental model:** [The understanding built up during this session that took effort to develop]

**Next steps (prioritized):**
1. [Most important next action]
2. [Second priority]
3. [Third priority]

**Environment notes:** [Any relevant non-code state — servers running, tokens configured, etc.]
**Open dependencies:** [Things waiting on external people/services/events]
```

**Key principle:** Write down the "last 10% of understanding" — things that feel obvious right now but will be completely gone in the next session.

---

## Phase 3: PERSIST (Systematic)

Route all extracted intelligence to the correct artifacts.

### Step 8: Update rounds.jsonl

Append the `session_processed` event:

```json
{
  "event": "session_processed",
  "sessionId": "<detected-uuid>",
  "machineId": "cb-xxxx",
  "displayId": "N",
  "timestamp": "ISO8601",
  "magnitude": "small|medium|significant",
  "work_summary": {
    "completed": ["task descriptions"],
    "in_progress": ["task descriptions with stopping points"],
    "discovered": ["newly identified items"],
    "deferred": ["items with rationale"],
    "invalidated": ["items no longer needed"]
  },
  "files_changed": {
    "created": [{"path": "/src/file.ts", "role": "description"}],
    "modified": [{"path": "/src/file.ts", "nature": "what changed and why"}],
    "deleted": [{"path": "/src/file.ts", "reason": "why removed"}]
  },
  "decisions": [
    {"title": "...", "choice": "...", "rationale": "...", "alternatives": ["..."], "reversibility": "easy|moderate|difficult"}
  ],
  "learnings": [
    {"category": "technical|process|domain|surprise|anti_pattern", "insight": "...", "future_application": "...", "confidence": "high|medium|low"}
  ],
  "errors": [
    {"type": "bug_found|bug_fixed|failed_approach|near_miss|regression_risk", "description": "...", "root_cause": "...", "prevention_rule": "..."}
  ],
  "patterns": [
    {"name": "...", "description": "...", "applicability": "..."}
  ],
  "questions_raised": [
    {"question": "...", "category": "technical|product|process", "urgency": "blocking|important|curious"}
  ],
  "continuity": {
    "stopping_point": "...",
    "mental_model": "...",
    "next_steps": ["..."],
    "environment_notes": "..."
  }
}
```

Also append individual high-value events for searchability:

```json
{"event":"decision_made","sessionId":"...","machineId":"...","title":"...","choice":"...","rationale":"...","timestamp":"..."}
{"event":"learning_captured","sessionId":"...","machineId":"...","category":"...","insight":"...","future_application":"...","timestamp":"..."}
{"event":"error_captured","sessionId":"...","machineId":"...","type":"...","description":"...","root_cause":"...","prevention_rule":"...","timestamp":"..."}
{"event":"pattern_recognized","sessionId":"...","machineId":"...","name":"...","description":"...","applicability":"...","timestamp":"..."}
{"event":"question_raised","sessionId":"...","machineId":"...","question":"...","category":"...","urgency":"...","timestamp":"..."}
{"event":"blocker_discovered","sessionId":"...","machineId":"...","description":"...","blocked_task":"...","depends_on":"...","timestamp":"..."}
{"event":"blocker_resolved","sessionId":"...","machineId":"...","description":"...","resolution":"...","timestamp":"..."}
```

### Step 9: Update context.md

Update these sections (create if they don't exist):

- **Current Round**: Status, progress, last activity, session ID
- **Modified Files This Round**: Full list with change descriptions
- **Ready Tasks**: What can be immediately continued
- **Blocked Tasks**: What is blocked and why
- **Discovered Work**: New items found this session
- **Open Questions**: New questions + resolved questions updated
- **Session Decisions**: Decisions that affect ongoing work
- **Partial Completion Tracking**: Exact stopping point
- **Handoff Summary**: The continuity package from Step 7
- **Recent Activity**: Table entry for this session
- **Session History**: Append current session with activity summary

### Step 10: Update learnings.md

Append new learnings under the current round heading. Then update the compounding sections:

**Prevention Rules** — Add any new prevention rules from Step 6c:
```markdown
| Rule | Source | Severity | Context |
|------|--------|----------|---------|
| [Rule text] | Round N, Session [UUID] | Critical/High/Medium | [When this applies] |
```

**Dead Ends Registry** — Add any failed approaches from Step 6c:
```markdown
| Approach | Round | Why It Failed | What Worked Instead |
|----------|-------|---------------|---------------------|
| [What was tried] | [N] | [Why it failed] | [Alternative that worked] |
```

**Recognized Patterns** — Add or update patterns from Step 6d:
```markdown
| Pattern | First Seen | Times Applied | Description |
|---------|-----------|---------------|-------------|
| [Name] | Round [N] | [count] | [Description] |
```

**Pattern Promotion Check**: For each pattern, check the count:
- Count reaches 2 → Move to Recognized Patterns table
- Count reaches 3+ → Promote to **Established Guidelines** section at top of learnings.md

**Established Guidelines** (top of file):
```markdown
## Established Guidelines
(Validated 3+ times — treat as authoritative for this project)

- **[Guideline name]**: [Description]. First seen Round [N], validated [count] times.
```

### Step 11: Regenerate QUICKSTART.md and Sync CLAUDE.md

**QUICKSTART.md** — Regenerate with current state. Now also includes:
- Top open question (if blocking or important)
- Newly discovered work items (if any)
- Key decision from this session (if architecturally significant)

**CLAUDE.md** — Sync current round section:
- Updated accomplishments
- Key Decisions table updated (if new decisions made)
- Modified files updated
- Key Insight updated (if significant learning captured)

---

## Compounding Intelligence Mechanisms

This protocol feeds three compounding mechanisms:

### 1. Three-Tier Knowledge Promotion

```
Tier 1: OBSERVATION — Single session captures a learning
  → Stored in learnings.md under that round/session

Tier 2: RECOGNIZED PATTERN — Same pattern seen 2+ times
  → Promoted to "Recognized Patterns" table

Tier 3: ESTABLISHED GUIDELINE — Seen 3+ times or expert-validated
  → Promoted to top of learnings.md as authoritative
```

### 2. Mistake → Prevention Rule Pipeline

```
Error occurs → Root cause identified → Prevention Rule created
→ /compound:research surfaces it for future related work
→ Future sessions see the rule BEFORE starting
```

### 3. Dead Ends Registry

```
Approach tried → Approach fails → Recorded with reason + alternative
→ /compound:research surfaces it when similar approach is considered
→ Future sessions skip the dead end entirely
```

### 4. Persistent Open Questions

```
Question raised → Carried forward in context.md
→ Checked each session for resolution
→ After 3+ sessions unresolved: flagged as "chronic"
→ Prompt: "Dedicate a round to this, or explicitly deprioritize?"
```

---

## Example Output

### SMALL Session
```
Processing session [a1b2c3d4...]...
Magnitude: SMALL (8 min, 2 files changed)

Work Items:
  Completed: 1 (Fixed typo in error message)

Continuity:
  Stopping point: N/A (task complete)
  Next: Continue with Round 12 task list

Updated: rounds.jsonl, context.md, QUICKSTART.md
Session processed.
```

### SIGNIFICANT Session
```
Processing session [e5f6g7h8...]...
Magnitude: SIGNIFICANT (2.5 hours, 14 files changed, round completed)

Work Items:
  Completed: 5 tasks
  Discovered: 2 new items
  Invalidated: 1 item

Decisions: 3 recorded
  - Chose rotating tokens over fixed (security)
  - Scoped to Google/GitHub OAuth only (Apple deferred)
  - Used middleware pattern for all auth endpoints

Learnings: 4 captured
  - [Technical] Framework handles OAuth redirects automatically
  - [Domain] 60% signup drop-off at password creation
  - [Surprise] 15% email bounce rate
  - [Anti-pattern] Never store tokens in localStorage

Errors: 2 captured
  - [Bug fixed] Race condition in webhook handler → added idempotency key
  - [Near-miss] Almost committed .env.local → caught in git status review

Patterns: 1 recognized
  - "Middleware chain" (validate→process→respond) — seen 3x, PROMOTED to Established Guideline

Prevention Rules: 1 new
  - "Never store auth tokens in localStorage" (Critical)

Questions: 1 raised
  - "Should users link multiple social accounts?" (product, important)

Updated: rounds.jsonl (8 events), context.md, learnings.md, QUICKSTART.md, CLAUDE.md
Session fully processed. All intelligence captured.
```

## The Completeness Test

After processing, a fresh Claude instance should be able to:

1. **Understand what was done** → from work items in rounds.jsonl + context.md
2. **Understand why** → from decisions in rounds.jsonl + learnings.md
3. **Know what NOT to do** → from prevention rules + dead ends in learnings.md
4. **Resume exactly where we stopped** → from continuity package in context.md
5. **Know what new work exists** → from discovered items in context.md
6. **Know what's still unknown** → from open questions in context.md
7. **Benefit from patterns** → from patterns + guidelines in learnings.md

If all seven pass, the raw session transcript adds zero value. The session is fully processed.
