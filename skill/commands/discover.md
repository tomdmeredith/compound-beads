# /compound:discover

Scan available skills, MCPs, and CLIs. Present them to the user. Copy selected skills to the project. Compress into AGENTS.md.

## Trigger

User invokes `/compound:discover` or during first initialization of a project with Compound Beads v3.0.

## Process

### Phase 1: Scan Available Skills

Scan `~/.claude/skills/` for skill directories:
1. List all subdirectories of `~/.claude/skills/`
2. For each directory, read `SKILL.md` (or `skill/SKILL.md` if nested)
3. Extract the first line (title) and first paragraph (description)
4. If `skill-rules.json` exists, extract trigger phrases from it
5. Skip `compound-beads` itself (it's the methodology, not a project skill)

### Phase 2: Categorize and Present

Group skills by category (infer from description if not explicit):

```
Available Skills for This Project
==================================

Content & Marketing:
  1. brand-voice        - Extract or define consistent brand voice
  2. seo-content        - Create SEO-optimized content that ranks
  3. content-atomizer   - Transform one piece into platform-optimized assets
  4. newsletter         - Create newsletters people want to read

Research & Intelligence:
  5. competitor-analysis - Orchestrate competitor content analysis
  6. fresh-intelligence  - Real-time briefing on any industry
  7. keyword-research    - Strategic keyword research without expensive tools

Creative:
  8. ai-image-generation - Generate images via Replicate API
  9. direct-response-copy - Write copy that converts

Select skills to add (comma-separated numbers, or 'none'):
```

### Phase 3: User Selection

- Present the categorized list using AskUserQuestion or direct prompt
- Accept comma-separated numbers, "all", or "none"
- Confirm selection before proceeding

### Phase 4: Copy Selected Skills

For each selected skill:
1. Create `.compound-beads/skills/{name}/` directory
2. Copy the skill's `SKILL.md` to `.compound-beads/skills/{name}/SKILL.md`
3. Create `.compound-beads/skills/{name}/output/` directory for artifacts
4. The copied skill can now evolve independently per-project

### Phase 5: Compress to AGENTS.md

For each selected skill, add a line to the `## Skills` section of `AGENTS.md`:

```markdown
## Skills
<!-- Run /compound:discover to scan available skills and add to this project -->
<!-- Format: name | description | trigger phrases | output -->
brand-voice | Extract or define consistent brand voice | "my voice", "brand tone" | voice-profile.md
competitor-analysis | Orchestrate competitor content analysis | "analyze competitors" | competitor-report.md
seo-content | Create SEO-optimized content that ranks | "write article", "SEO" | optimized-content.md
```

Format: `name | description | trigger phrases | output artifact`

### Phase 6: Scan Tools & MCPs

1. Check for MCP server configurations:
   - Read `~/.claude/settings.json` for `mcpServers` key
   - Read project `.claude/settings.json` if it exists
2. Check for common CLIs on PATH: `gh`, `vercel`, `netlify`, `aws`, `gcloud`, `docker`, `kubectl`
3. Present discovered tools to user
4. Add confirmed tools to `## Tools & MCPs` section of `AGENTS.md`:

```markdown
## Tools & MCPs
<!-- Populated during skill discovery or when tools are added -->
gh | GitHub CLI | issues, PRs, releases, actions
brave-search | Web search via Brave API | research, current events
notion | Notion API | pages, databases, comments
```

## Example Output

```
Skill Discovery Complete
========================

Skills added to project:
  - brand-voice (copied to .compound-beads/skills/brand-voice/)
  - seo-content (copied to .compound-beads/skills/seo-content/)

Tools detected:
  - gh (GitHub CLI)
  - brave-search (MCP)
  - notion (MCP)

Updated: AGENTS.md (Skills and Tools sections)
Created: .compound-beads/skills/brand-voice/SKILL.md
Created: .compound-beads/skills/seo-content/SKILL.md
```

## Edge Cases

### No Skills Found
If `~/.claude/skills/` doesn't exist or is empty (besides compound-beads):
```
No additional skills found in ~/.claude/skills/.
Skills section left empty. You can re-run /compound:discover after installing skills.
```

### AGENTS.md Already Has Skills
If the `## Skills` section already has entries:
- Show what's already configured
- Only present skills NOT yet added
- Ask if user wants to replace or append

### skill-rules.json Available
If a skill has a `skill-rules.json` file, use it for better trigger extraction:
- Extract `trigger` patterns for the trigger phrases column
- Extract `description` for the description column
- This provides more accurate data than parsing SKILL.md alone

### Re-running Discovery
Discovery can be run multiple times:
- New skills are appended (duplicates skipped)
- Removed skills are NOT auto-cleaned (user must manually remove)
- Tools section is refreshed each time
