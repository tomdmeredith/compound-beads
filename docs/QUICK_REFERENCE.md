# Compound Beads Quick Reference

> **One-page cheat sheet for daily use**

---

## Round Format

```markdown
## Round N: [One-Line Goal]

> **Goal**: [Measurable outcome]

- [x] Completed task
- [ ] Pending task
- [~] Deferred task

**Key Insight:** [Major learning]
```

---

## Numbering

| Type | Format | Example |
|------|--------|---------|
| Major round | Integer | Round 5 |
| Sub-round | Decimal | Round 5.1 |
| Hot-fix | Double decimal | Round 5.1.1 |

---

## CLAUDE.md Sections

1. Header (project, round, date)
2. Quick Context (2-3 sentences)
3. Documentation (links table)
4. Key Files (paths table)
5. Current Work (Round N)
6. Previous Round (condensed)
7. Earlier Rounds (table)
8. Tech Stack
9. How to Continue

---

## Compression

| Section | Detail Level |
|---------|--------------|
| Current Round | Full (50-100 lines) |
| Previous Round | Condensed (20-30 lines) |
| Earlier Rounds | Table row (1 line) |

---

## Slash Commands

| Command | When |
|---------|------|
| `/ready` | Session start |
| `/plan` | Complex work |
| `/work` | During implementation |
| `/eval` | After implementation |
| `/review` | Before finishing |
| `/land` | Session end |
| `/panel` | New problem domain |

---

## Expert Panel Quick Picks

| Pattern | Experts to Consult |
|---------|-------------------|
| Monitoring | ATC, ER Nurse, Trader |
| Fraud prevention | Casino Boss, Bouncer |
| Prioritization | ER Doctor, Firefighter |
| Simplification | Teacher, IKEA Writer |
| Trust building | Negotiator, Doctor |
| Behavior change | Trainer, Game Designer |

---

## The 5-Phase Cycle

```
1. EXPERT PANEL     → Fresh perspectives
2. ANALYSIS         → Deep dive + define success criteria
3. IMPLEMENTATION   → Build solution
4. EVALUATION       → Measure against criteria
5. DOCUMENTATION    → Capture learnings + error analysis
```

---

## Plan File Naming

Format: `[adjective]-[verb]-[noun].md`

Examples:
- `dynamic-seeking-backus.md`
- `curious-dancing-hopper.md`
- `swift-building-lovelace.md`

---

## Task States

```markdown
- [ ] Pending
- [x] Completed
- [~] Deferred
- [!] Blocked
```

---

## Evals Quick Reference

**Before starting:**
```markdown
| Criterion | Metric | Target |
|-----------|--------|--------|
```

**After implementation:**
```markdown
| Criterion | Target | Actual | Status |
|-----------|--------|--------|--------|
```

**For failures (5 Whys):**
```markdown
| Error | Root Cause | Action |
|-------|------------|--------|
```

---

## Key Principles

1. **Document as you go** - Not after
2. **Compress regularly** - Prevent bloat
3. **One goal per round** - Stay focused
4. **Update CLAUDE.md** - Every round
5. **Consult irrelevant experts** - Break blindness
6. **Measure, don't guess** - Define success criteria

---

## Quick Start

```bash
# 1. Copy template
cp templates/CLAUDE.md ./CLAUDE.md

# 2. Copy commands
cp -r .claude ./.claude

# 3. Run /ready
claude

# 4. Start Round 1
```

---

## Emergency Recovery

If context is lost:
1. Read CLAUDE.md
2. Check `.claude/plans/` for active plans
3. Read `.claude/context/learnings.md`
4. Start fresh round referencing previous

---

*Print this. Tape it to your monitor.*
