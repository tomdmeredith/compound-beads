# Expert Panel Guide

> **An Optional Tool for When You're Genuinely Stuck**

Expert panels consult professionals from unrelated fields who deal with similar patterns. This can provide breakthrough insights when you're stuck.

## When to Use Expert Panels

**Use when:**
- You're genuinely stuck with no clear path forward
- Facing a novel problem domain with no prior art
- Want fresh perspective on a difficult decision
- Standard approaches aren't working

**Skip when:**
- Regular feature/bug work
- Path is clear
- Domain is familiar
- Time is critical (panels add overhead)

*Based on real usage: Expert panels were used in only 5.5% of rounds, despite many rounds technically "qualifying." Most work doesn't need them.*

---

## Why It Works

### Domain Blindness

Experts in your field share your assumptions. They've all read the same books, attended the same conferences, and learned the same "best practices."

This creates **domain blindness** - the inability to see solutions that are obvious in other fields.

### Pattern Recognition Across Fields

A security guard and an air traffic controller both:
- Monitor many things simultaneously
- Distinguish normal from abnormal patterns
- Make split-second priority decisions

If you're building a monitoring dashboard, both have insights your SaaS colleagues don't.

---

## The Expert Panel Process

### Step 1: Identify the Pattern

Before selecting experts, identify the **abstract pattern** you're dealing with:

| Surface Problem | Underlying Pattern |
|----------------|-------------------|
| Building a monitoring dashboard | Watching many things at once |
| Preventing fraud | Detecting bad actors |
| Onboarding new users | Teaching complex systems |
| Pricing a product | Capturing value |
| Handling complaints | De-escalation |

### Step 2: Find Irrelevant Experts

Select 3-5 experts from **completely unrelated fields** who deal with the same pattern:

**NOT relevant:** Same industry, adjacent roles, competitors
**Irrelevant:** Different industry, no obvious connection

### Step 3: Consult Each Expert

For each expert, ask:
> "In your work as a [role], how do you handle [pattern]?"

Document their response, focusing on:
- Techniques they use
- Mental models they apply
- Edge cases they've learned to handle
- Mistakes they've made

### Step 4: Synthesize Insights

Create a table capturing actionable insights:

```markdown
| Expert | Field | Insight Applied |
|--------|-------|-----------------|
| ER Nurse | Healthcare | Severity-based triage queue |
| Casino Pit Boss | Gaming | Pattern-based fraud detection |
| Security Guard | Surveillance | Peripheral vision for anomalies |
```

---

## Expert Library by Pattern

### Pattern: Monitoring Many Things

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Air Traffic Controller | Aviation | Hierarchy of attention - near threats first |
| ER Nurse | Healthcare | Triage by severity, not arrival order |
| Security Guard | Surveillance | Scan patterns, trust peripheral vision |
| Stock Day Trader | Finance | Pre-defined triggers, not constant watching |
| Lifeguard | Recreation | Systematic scan patterns, trust muscle memory |
| Nuclear Power Operator | Energy | Exception-based monitoring, ignore the normal |

### Pattern: Preventing Abuse/Fraud

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Casino Pit Boss | Gaming | Behavioral patterns over hard rules |
| Insurance Investigator | Insurance | Follow the incentive trail |
| Nightclub Bouncer | Hospitality | VIP vs regular treatment |
| Reddit Moderator | Online Community | Community self-policing at scale |
| Bank Teller | Banking | "Something feels wrong" intuition training |
| Customs Officer | Border Security | Risk-based inspection tiers |

### Pattern: Prioritizing Limited Resources

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| ER Doctor | Healthcare | Triage protocols - not first-come-first-served |
| Airline Scheduler | Aviation | Opportunity cost thinking |
| Food Bank Director | Non-profit | Most impact per unit, not equal distribution |
| Sports Coach | Athletics | Play to strengths, don't fix all weaknesses |
| Venture Capitalist | Finance | Power law thinking - double down on winners |
| Firefighter | Emergency Services | Save what's saveable, accept some losses |

### Pattern: Simplifying Complexity

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Kindergarten Teacher | Education | One concept at a time, celebrate small wins |
| IKEA Manual Writer | Design | Pictures > words, assume no expertise |
| Tour Guide | Tourism | Story over facts, emotional hooks |
| Video Game Designer | Entertainment | Progressive disclosure, tutorial levels |
| Children's Book Author | Publishing | Rhythm and repetition, concrete over abstract |
| Museum Curator | Arts | Thematic grouping, clear pathways |

### Pattern: Building Trust Quickly

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Hostage Negotiator | Law Enforcement | Active listening, acknowledge their reality |
| Used Car Salesperson | Sales | Transparency about flaws builds credibility |
| First Date | Romance | Genuine curiosity over performance |
| New Doctor | Healthcare | Explain what you're doing and why |
| Airbnb Host | Hospitality | Small unexpected gestures |
| Recruiter | HR | Under-promise, over-deliver |

### Pattern: Handling Complaints/De-escalation

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Hostage Negotiator | Law Enforcement | Validate emotion before addressing content |
| Customer Service Rep | Retail | Let them vent, don't interrupt |
| Bartender | Hospitality | Know when to cut someone off |
| School Principal | Education | Private conversation > public confrontation |
| Therapist | Mental Health | Reflect back what you heard |
| Flight Attendant | Aviation | Keep calm, project control |

### Pattern: Encouraging Behavior Change

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Personal Trainer | Fitness | Small wins build momentum |
| AA Sponsor | Recovery | Day at a time, community support |
| Kindergarten Teacher | Education | Positive reinforcement > punishment |
| Dog Trainer | Animal Behavior | Immediate feedback, consistent rewards |
| Dietitian | Health | Environment design, not willpower |
| Video Game Designer | Entertainment | Clear progress indicators, achievable goals |

### Pattern: Capturing Value (Pricing)

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Luxury Hotel Manager | Hospitality | Anchor high, discount strategically |
| Car Dealership Owner | Automotive | Bundles obscure individual prices |
| Theater Producer | Entertainment | Scarcity creates value (limited run) |
| Charity Fundraiser | Non-profit | Tie price to tangible outcome |
| Real Estate Agent | Property | Comparable framing ("similar homes sold for...") |
| Auction House | Collectibles | Competition drives up perceived value |

### Pattern: Onboarding/Training

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| Video Game Designer | Entertainment | Tutorial integrated with real play |
| Flight Instructor | Aviation | Simulator before real stakes |
| Martial Arts Sensei | Sports | Belt system shows visible progress |
| New Employee Buddy | HR | Human connection > documentation |
| Board Game Designer | Entertainment | Reference card, not manual memorization |
| Driving Instructor | Education | Build confidence in low-risk environment |

### Pattern: Creating Urgency

| Expert | Field | Typical Insight |
|--------|-------|-----------------|
| TV Shopping Host | Retail | Countdown timers, limited quantity |
| Flash Sale Operator | E-commerce | Scarcity must feel real |
| Event Planner | Hospitality | Early bird pricing with clear deadline |
| Political Campaign | Politics | "Last chance" framing |
| Auction House | Collectibles | Competitive pressure from other buyers |
| ER Doctor | Healthcare | Severity assessment creates natural urgency |

---

## Example Panel Session

### Context: Building a Customer Success Dashboard

We need to help Customer Success Managers monitor many accounts for health signals.

### Panel:

| Expert | Field | Question |
|--------|-------|----------|
| Air Traffic Controller | Aviation | How do you monitor many aircraft? |
| ER Nurse | Healthcare | How do you triage incoming patients? |
| Casino Pit Boss | Gaming | How do you spot cheaters? |
| Stock Day Trader | Finance | How do you watch many positions? |

### Insights Gathered:

**Air Traffic Controller:**
> "I use sectors and handoffs. Each controller owns a defined airspace. Problems get handed up, not down. I never try to watch everything."

**Insight Applied:** Divide customers into owned segments. Escalation goes up.

**ER Nurse:**
> "Triage is everything. A 10/10 pain patient waits if stable. A 3/10 with declining vitals jumps the queue. It's not about complaints—it's about trajectory."

**Insight Applied:** Dashboard should show trajectory (improving/declining), not just current score.

**Casino Pit Boss:**
> "I don't watch for specific cheats—I watch for behavior that doesn't match the pattern. Someone winning who doesn't look happy. Someone playing different than their usual style."

**Insight Applied:** Baseline each account, then flag behavioral changes (not just low scores).

**Stock Day Trader:**
> "I set alerts. I'm not staring at screens—I'm waiting for exceptions. Pre-defined triggers let me ignore 95% of the noise."

**Insight Applied:** Define health thresholds, only show exceptions. Don't show all accounts all the time.

### Synthesized Insight Table:

| Expert | Field | Insight Applied |
|--------|-------|-----------------|
| Air Traffic Controller | Aviation | Sector-based ownership with escalation |
| ER Nurse | Healthcare | Trajectory matters more than snapshot |
| Casino Pit Boss | Gaming | Behavioral change detection vs baselines |
| Stock Day Trader | Finance | Exception-based alerts, not constant monitoring |

---

## Running an Expert Panel

### Prompt Template

When asking Claude (or another AI) to simulate an expert panel:

```markdown
I'm building [CONTEXT]. I need to consult an expert panel on [PATTERN].

For each of the following experts, tell me how they would approach this
problem in their domain, and what insight we could apply:

1. [Expert 1] - [Field]
2. [Expert 2] - [Field]
3. [Expert 3] - [Field]
4. [Expert 4] - [Field] (optional)
5. [Expert 5] - [Field] (optional)

Format your response as:

**[Expert Name] ([Field]):**
> [Their perspective in first person]

**Insight Applied:** [How we apply this to our problem]
```

### Real-World Panels

For high-stakes decisions, consider actual interviews with real experts:
- LinkedIn outreach
- Industry meetups
- Consulting engagements
- Reddit AMAs in relevant communities

---

## Anti-Patterns

### "Relevant" Expert Panel

Consulting only domain experts misses the point. If you're building for sales, don't just ask salespeople.

### Surface-Level Analogies

"A hospital is like a factory" - too abstract to be useful. Go deeper: "How does an ER nurse decide who to see next when all beds are full?"

### Too Many Experts

5 experts maximum. Beyond that, insights blur together. Quality over quantity.

### Ignoring Uncomfortable Insights

The best insights often contradict your assumptions. Don't dismiss them because they're inconvenient.

---

## Documenting Panels

Always capture expert panels in a standard format:

```markdown
### Expert Panel: [Pattern Name]

**Context:** [What we're building/solving]

**Panel:**
| Expert | Field |
|--------|-------|
| [Expert 1] | [Field] |
| [Expert 2] | [Field] |
| [Expert 3] | [Field] |

**Synthesized Insights:**
| Expert | Insight Applied |
|--------|-----------------|
| [Expert 1] | [Actionable insight] |
| [Expert 2] | [Actionable insight] |
| [Expert 3] | [Actionable insight] |

**Key Takeaway:** [The single most important learning]
```

---

## See Also

- [METHODOLOGY.md](./METHODOLOGY.md) - Full methodology reference
- [ROUND_MANAGEMENT.md](./ROUND_MANAGEMENT.md) - Round lifecycle
- [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) - One-page cheat sheet
