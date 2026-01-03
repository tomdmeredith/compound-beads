# Session Start: /ready

You are starting a new session. Follow this protocol:

## 1. Read Context

Read these files in order:
1. `CLAUDE.md` - The agent handoff document
2. Any active plan files in `/.claude/plans/`
3. `/.claude/context/learnings.md` if it exists

## 2. Understand Current State

From CLAUDE.md, identify:
- Current round number and goal
- What tasks are pending
- Recent key insights
- Active blockers or deferred work

## 3. Report Status

Summarize to the user:
- "We're on Round [N]: [Goal]"
- "[X] tasks completed, [Y] pending"
- Key context from previous work
- Recommended next action

## 4. Confirm Direction

Ask: "Ready to continue with [pending task], or would you like to adjust direction?"

---

## Quick Reference

- Use `/plan` to enter planning mode for complex work
- Use `/work` for execution checkpoints
- Use `/panel` to consult an expert panel
- Use `/land` when ending the session
