# Round Types Guide

> Formalized from patterns observed across 127 rounds of real usage.

---

## Why Round Types?

Declaring a round type at the start:
- Sets scope expectations
- Guides sizing decisions
- Makes history scannable
- Helps identify patterns in your work

---

## The Five Round Types

### Feature

**Purpose:** Ship new functionality

| Aspect | Guidance |
|--------|----------|
| Typical tasks | 3-7 |
| Duration | 2-8 hours |
| Examples | Add user auth, Implement search, Build dashboard |

**When to use:**
- Adding capabilities that didn't exist before
- Building new user-facing features
- Creating new integrations

**Arc often captures:**
- "We thought users needed X, they actually needed Y"
- "Our initial approach was too complex/simple"

---

### Bug Fix

**Purpose:** Address issues

| Aspect | Guidance |
|--------|----------|
| Typical tasks | 2-5 |
| Duration | 30 min - 4 hours |
| Examples | Fix payment processing, Resolve login loop, Correct calculation |

**When to use:**
- Something that worked before is now broken
- Reported issues from users
- Failed tests or monitoring alerts

**Arc often captures:**
- "We thought the bug was in X, it was actually in Y"
- "This exposed a deeper problem we need to address"

**Special rule:** P0 bugs ALWAYS get their own round for visibility, even if <30 min.

---

### Triage

**Purpose:** Convert feedback to actionable tasks

| Aspect | Guidance |
|--------|----------|
| Typical tasks | Creates many, closes few |
| Duration | 1-3 hours |
| Examples | Process user feedback, Review error logs, Categorize support tickets |

**When to use:**
- Large batch of feedback to process
- Periodic review of issues
- After launch/release to capture issues

**Arc often captures:**
- "We expected users to struggle with X, they struggled with Y"
- "The volume of issues in Z suggests a deeper problem"

**Unique characteristic:** Triage rounds often create MORE beads than they close. That's expected.

---

### Polish

**Purpose:** Refine existing features

| Aspect | Guidance |
|--------|----------|
| Typical tasks | 5-10 small |
| Duration | 2-6 hours |
| Examples | Improve onboarding UX, Refine error messages, Smooth animations |

**When to use:**
- Feature works but could be better
- User experience improvements
- Visual/interaction refinements

**Arc often captures:**
- "Small changes had bigger impact than expected"
- "We realized polish IS the product for users"

**Tip:** Polish rounds benefit from batching related improvements together.

---

### Infrastructure

**Purpose:** DevOps, configuration, DNS, tooling

| Aspect | Guidance |
|--------|----------|
| Typical tasks | 1-3 |
| Duration | 30 min - 4 hours |
| Examples | Set up email service, Configure CI/CD, Migrate database |

**When to use:**
- Changes that users don't see directly
- Developer experience improvements
- System reliability work
- Configuration changes

**Arc often captures:**
- "Infra work took longer than expected because..."
- "This unblocked other work we couldn't do before"

**Note:** Infrastructure work is often under-documented. Giving it a round type forces proper tracking.

---

## Sizing Guidelines

| Duration | Action |
|----------|--------|
| <30 min | Bundle into current round as sub-task |
| 30 min - 4 hours | Individual round |
| >4 hours | Break into multiple rounds |

### Breaking Large Work

If a feature round is scoping to >7 tasks, consider:
1. Splitting into multiple feature rounds
2. Extracting a triage round first to scope properly
3. Identifying infrastructure prerequisites as a separate round

### Combining Small Work

If you have several <30 min items:
- Related items → One polish round
- Unrelated items → Sub-tasks in current round
- P0 bugs → Always separate (visibility)

---

## Type Selection Decision Tree

```
Is it broken?
├── Yes → bug_fix
└── No
    └── Is it new functionality?
        ├── Yes → feature
        └── No
            └── Is it feedback/issues to process?
                ├── Yes → triage
                └── No
                    └── Is it user-facing improvement?
                        ├── Yes → polish
                        └── No → infrastructure
```

---

## Patterns from Real Usage

Based on 127 rounds of CloneICP development:

| Type | % of Rounds | Avg Tasks | Notes |
|------|-------------|-----------|-------|
| Feature | 45% | 4.2 | Most common |
| Bug Fix | 20% | 2.8 | Often urgent |
| Polish | 15% | 7.1 | High task count, low complexity |
| Infrastructure | 15% | 1.9 | Low task count, high complexity |
| Triage | 5% | Creates 15+, closes 2-3 | Creates work for future |

---

## Common Mistakes

### "Everything is a Feature"
**Problem:** Calling bug fixes or polish "features"
**Fix:** Features add NEW capabilities. If it existed before, it's not a feature.

### "Infrastructure is Invisible"
**Problem:** Doing infra work without rounds, so it's undocumented
**Fix:** Any work >30 min gets a round. Infrastructure is work.

### "Triage Creates Too Many Beads"
**Problem:** Feeling overwhelmed after triage
**Fix:** That's the point! Triage surfaces work. Now prioritize.

### "Polish Never Ends"
**Problem:** Polish rounds that expand indefinitely
**Fix:** Time-box polish rounds. "2 hours of homepage polish" not "Polish until perfect"
