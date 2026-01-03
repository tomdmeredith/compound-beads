# Expert Panel Example: Customer Success Dashboard

> **Date:** December 2024
> **Context:** Building a dashboard for CSMs to monitor 50+ accounts
> **Pattern:** Monitoring many things at once

This is a real expert panel session from Round 25 of CloneICP development.

---

## The Problem

We needed to help Customer Success Managers (CSMs) monitor dozens of accounts for health signals. The challenge: how do you watch many things without missing critical issues?

---

## Panel Members

| Expert | Field | Why Selected |
|--------|-------|--------------|
| Air Traffic Controller | Aviation | Monitors many aircraft simultaneously |
| ER Nurse | Healthcare | Triages severity-based queues |
| Casino Pit Boss | Gaming | Detects behavioral patterns |
| Stock Day Trader | Finance | Watches many positions |

---

## Consultation

### Air Traffic Controller (Aviation)

> "I don't try to track every plane equally. I use sectors and handoffs. Each controller owns a defined airspace. When a plane leaves my sector, I hand it off. I focus on conflicts - two planes getting too close. The key is hierarchy of attention: near threats first, then potential future conflicts, then routine traffic. I never stare at everything constantly."

**Insight Applied:** Divide customers into owned segments. CSMs own specific accounts. Escalation goes up, not sideways. Focus on conflicts (declining health) not routine (stable accounts).

---

### ER Nurse (Healthcare)

> "Triage is everything. A patient screaming in 10/10 pain waits if they're stable. A quiet patient with declining vitals jumps the queue. We look at trajectory, not just current state. Someone who was fine an hour ago but is getting worse is more urgent than someone who's been at the same level for hours. Arrival order means nothing. Severity and trajectory are everything."

**Insight Applied:** Show trajectory (improving/declining) prominently, not just current health score. A score of 70 that was 90 last month is more urgent than a stable 60.

---

### Casino Pit Boss (Gaming)

> "I'm not looking for specific cheats - I watch for behavior that breaks pattern. Someone winning who doesn't look happy. A player betting differently than their usual style. Regulars suddenly playing at odd hours. I build a mental model of 'normal' for each player, then flag deviations. Hard rules catch amateurs. Pattern detection catches pros."

**Insight Applied:** Baseline each customer's normal behavior. Flag behavioral changes: sudden drop in logins, usage pattern shifts, support ticket spikes. Don't just use absolute thresholds.

---

### Stock Day Trader (Finance)

> "I set alerts. I am NOT staring at screens all day - that's for movies. I define my triggers ahead of time: price crosses X, volume spikes, pattern completes. Then I wait for exceptions. 95% of the time I'm not actively watching. The alerts do the work. When one fires, I act. Constant monitoring is how you burn out and miss the big moves."

**Insight Applied:** Design for exception-based monitoring. Define health thresholds and alert rules. The dashboard should show exceptions, not all accounts all the time.

---

## Synthesized Insights

| Expert | Insight Applied |
|--------|-----------------|
| Air Traffic Controller | Sector-based ownership, escalation hierarchy |
| ER Nurse | Trajectory > snapshot, severity-based triage |
| Casino Pit Boss | Behavioral baselines, deviation detection |
| Stock Day Trader | Exception-based alerts, not constant monitoring |

---

## Key Takeaway

**Don't show everything. Show exceptions to the norm.**

The dashboard shouldn't display all 50 accounts equally. It should:
1. Calculate a "normal" baseline for each account
2. Detect deviations from that baseline
3. Surface only accounts with significant trajectory changes
4. Let CSMs focus on what matters, not what's stable

---

## Implementation Actions

Based on this panel:

1. [x] Add trajectory indicators (improving/declining arrows)
2. [x] Create behavioral baseline per account (30-day rolling average)
3. [x] Implement exception-based alerts (deviation > 2 std dev)
4. [x] Design "at-risk" queue vs "stable" view
5. [x] Add account ownership and handoff workflow

---

## What We Built

The resulting dashboard has:
- **Exception Queue**: Only accounts with significant changes
- **Trajectory Badges**: ↑ improving, ↓ declining, → stable
- **Baseline Deviation**: Highlights unusual behavior patterns
- **Owned vs All**: CSMs see their accounts, can view all

This panel fundamentally changed our approach from "show everything" to "show what matters."

---

*This is a real panel session. Names and specific metrics modified for this example.*
