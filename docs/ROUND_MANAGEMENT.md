# Round Management Guide

> **Working with Beads: Lifecycle, Numbering, and Context Flow**

This guide covers the practical details of managing rounds in Compound Beads.

---

## Round Lifecycle

### 1. Round Start

**Trigger:** New goal identified, previous round complete, or session beginning.

**Actions:**
1. Read current CLAUDE.md for context
2. Define clear, single-focus goal
3. Create round header with goal
4. Add initial checkboxes for known tasks

**Template:**
```markdown
## Round N: [One-Line Goal]

> **Methodology**: [Approach/technique]
> **Goal**: [Measurable outcome]

- [ ] First task
- [ ] Second task
- [ ] Third task
```

### 2. During Round

**Rhythm:**
- Check off tasks as completed
- Add tasks as discovered
- Note blockers inline
- Use sub-rounds for iterations

**Task States:**
```markdown
- [ ] Pending
- [x] Completed
- [~] Deferred (moved to backlog)
- [!] Blocked (note blocker)
```

### 3. Round End

**Trigger:** Goal achieved, session ending, or major pivot.

**Actions:**
1. Ensure all tasks have resolution (done, deferred, or blocked)
2. Write "Key Insight" if significant learning
3. Compress to Previous Round section
4. Update Earlier Rounds table
5. Prepare handoff for next session

---

## Numbering Conventions

### Major Rounds

Sequential integers: 1, 2, 3, 4...

Use for:
- New features
- Major refactors
- Distinct problem domains
- Clear goal shifts

### Sub-Rounds

Decimal notation: 4.1, 4.2, 4.3...

Use for:
- Iterations on a major round
- Bug fixes discovered during implementation
- Scope additions to current work
- Multiple sessions on same goal

### Hot-Fix Rounds

Rare double-decimal: 4.1.1

Use for:
- Urgent fixes during a round
- Critical bugs that can't wait
- Rollback/recovery operations

### Examples

```
Round 1: Project Setup
Round 2: Core Data Model
Round 3: Authentication
Round 3.1: Fix OAuth callback bug
Round 3.2: Add remember-me option
Round 4: API Endpoints
Round 5: Frontend Integration
Round 5.1: Mobile responsive fixes
Round 5.1.1: Hotfix - production crash
Round 5.2: Performance optimization
Round 6: Testing
```

---

## Context Flow

### The Compression Hierarchy

```
┌─────────────────────────────────────┐
│  Current Work (Round N)             │  Full detail
│  - All checkboxes                   │  50-100 lines
│  - Implementation notes             │
│  - Key files modified               │
└─────────────────────────────────────┘
         ↓ (when N+1 starts)
┌─────────────────────────────────────┐
│  Previous Round (Round N)           │  Condensed
│  - Summary paragraph                │  20-30 lines
│  - Key accomplishments              │
│  - Key insight                      │
└─────────────────────────────────────┘
         ↓ (when N+2 starts)
┌─────────────────────────────────────┐
│  Earlier Rounds                     │  Table row
│  | N | Focus | Outcome |            │  1 line
└─────────────────────────────────────┘
```

### When to Compress

**Compress Previous Round to Table:**
- When starting Round N+2
- When CLAUDE.md exceeds 400 lines
- When previous round details are no longer actively referenced

**Keep Uncompressed:**
- Current round (always full detail)
- Previous round (recent context valuable)
- Rounds with significant architectural decisions

### Compression Template

**From Full Round:**
```markdown
## Round 5: User Authentication

> **Methodology**: Security-first with OAuth
> **Goal**: Secure login/logout with session management

- [x] Implement OAuth2 flow with Google
- [x] Create session management layer
- [x] Add CSRF protection
- [x] Write integration tests
- [x] Add remember-me functionality

**Key Insight:** Rolling session tokens prevent replay attacks better than fixed tokens.

**Files Modified:**
- /src/auth/oauth.ts (new)
- /src/auth/session.ts (new)
- /src/middleware/csrf.ts (new)
```

**To Previous Round:**
```markdown
### Previous Round (Round 5)

**User Authentication:** Implemented OAuth2 with Google, session management, and CSRF protection. Key insight: rolling session tokens prevent replay attacks.
```

**To Table Row:**
```markdown
| 5 | User Authentication | OAuth2, sessions, CSRF |
```

---

## Round Types

### Feature Rounds

Standard new functionality:
```markdown
## Round 7: Add Search Feature

- [ ] Create search endpoint
- [ ] Implement fuzzy matching
- [ ] Build search UI
- [ ] Add search analytics
```

### Bug Fix Rounds

Addressing issues:
```markdown
## Round 7.1: Fix Search Edge Cases

> **Trigger**: User reported empty results on special characters

- [x] Handle special characters in query
- [x] Fix null result crash
- [x] Add input sanitization
```

### Refactor Rounds

Technical improvement without feature change:
```markdown
## Round 8: Refactor Auth Module

> **Goal**: Reduce auth module complexity from 800 LOC to <400

- [ ] Extract token management
- [ ] Consolidate session handling
- [ ] Remove deprecated methods
- [ ] Update all callers
```

### Audit Rounds

Expert review and improvement:
```markdown
## Round 9: Security Audit

> **Methodology**: Expert panel (Security Consultant, Pentester, Compliance Officer)

- [ ] Run panel consultation
- [ ] Document findings
- [ ] Prioritize fixes
- [ ] Implement P0 issues
```

### Documentation Rounds

Capturing knowledge:
```markdown
## Round 10: API Documentation

- [ ] Document all endpoints
- [ ] Add example requests/responses
- [ ] Create getting started guide
- [ ] Add authentication guide
```

---

## Multi-Session Rounds

### Spanning Sessions

When a round spans multiple sessions:

1. **End of Session 1:**
   - Add "Handoff Notes" section
   - Document current state
   - List immediate next steps

2. **Start of Session 2:**
   - Read handoff notes
   - Continue with same round number
   - Remove handoff section after reading

**Handoff Notes Template:**
```markdown
**Handoff Notes (Session End):**
- Current state: [Where we left off]
- Blocked by: [If applicable]
- Next steps:
  1. [First thing to do]
  2. [Second thing to do]
- Files being modified: [List]
```

### When to Split Rounds

Split into new round when:
- Goal fundamentally changes
- Scope becomes unmanageable (10+ tasks)
- Direction pivots significantly
- Clean break point reached

---

## Round Retrospectives

### Quick Retro (Every Round)

At round end, capture:
- What worked well
- What didn't work
- Key insight/learning

Embed in round as "Key Insight."

### Deep Retro (Every 5-10 Rounds)

Review patterns across rounds:
- Common blockers
- Recurring patterns
- Methodology improvements
- Tool gaps

Document in `.claude/context/learnings.md`.

---

## Common Questions

### "What if I forget to start a new round?"

Retroactively add the round header once you realize. Number it appropriately based on when the work conceptually started.

### "Should I combine small tasks into one round?"

Yes, if they share a goal. A round can be 2 checkboxes or 15 checkboxes. The key is coherent focus.

### "What if requirements change mid-round?"

Options:
1. **Minor change:** Add/remove tasks, continue same round
2. **Major change:** Close current round as "Pivoted", start new round

### "How do I handle parallel work streams?"

Use separate round tracks if needed:
```markdown
## Round 5: Frontend
## Round 5-B: Backend (parallel)
```

Or wait for natural merge points.

### "What about work that didn't succeed?"

Document it:
```markdown
## Round 6: Attempt Redis Caching (Abandoned)

> Attempted Redis implementation but reverted due to complexity.
> Decision: Use in-memory caching for now, revisit later.

- [x] Implemented Redis integration
- [x] Discovered latency issues
- [x] Reverted to in-memory
- [~] Full Redis migration (deferred)
```

Failed rounds contain valuable learnings.

---

## See Also

- [METHODOLOGY.md](./METHODOLOGY.md) - Full methodology reference
- [EXPERT_PANEL_GUIDE.md](./EXPERT_PANEL_GUIDE.md) - Expert panel technique
- [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) - One-page cheat sheet
