# AGENTS.md

> Compound Beads v3.0 | Project: [NAME] | Initialized: [DATE]

## Methodology: Compound Beads

Core loop: START ROUND > WORK > COMPOUND (Arc + learnings) > CLOSE (push + update)

Files: CLAUDE.md (handoff) | .compound-beads/QUICKSTART.md (continuity) | context.md (state) | rounds.jsonl (history) | learnings.md (insights)

Round types: feature | bug_fix | triage | polish | infrastructure
Sizing: 30min-4hr. Break larger work into multiple rounds.

### Session Protocol
Start: Read QUICKSTART.md > context.md > scan recent learnings
End: git commit > session intelligence capture > update tracking files > regenerate QUICKSTART.md > git push
Rule: Work is not done until pushed AND tracking files updated.

### Auto-Triggers
| Condition | Action |
|-----------|--------|
| Session start + .compound-beads/ exists | Load QUICKSTART.md and context.md |
| Context window > 80% full | Run handoff protocol |
| Round has >5 file modifications | Update context.md |
| Round marked complete | Capture Arc + extract learnings |
| Session ending detected | Run session close protocol |
| Significant work completed | Update CLAUDE.md |
| Pattern discovered | Add to learnings.md |
| Bead open > 7 days | Prompt: close, defer, or update? |
| Completion signals ("that worked") | Capture learnings |
| 3+ decisions made | Capture rationale |
| Error or dead end | Record for future avoidance |

### Narrative Capture
Every round: We started believing > We ended believing > The transformation

## Skills
<!-- Run /compound:discover to scan available skills and add to this project -->
<!-- Format: name | description | trigger phrases | output -->
(none configured)

## Tools & MCPs
<!-- Populated during skill discovery or when tools are added -->
(none configured)

## Project Rules
<!-- Add as the project evolves -->
(none yet)
