# WorldAnvil Workflow for Blended Shadow Puppet World-Building

*This document provides detailed guidance for using WorldAnvil as the canonical repository for the Blended Shadow Puppet (BSP) fictional universe, with GitHub as the proposal and review space.*

**See `INTEGRATION-PATHS.md` for the full WorldAnvil integration philosophy and workflow.**

This document focuses on practical implementation steps.

---

## Workflow Overview

### The Three Repositories

1. **GitHub (Proposal & Review Space)**
   - All new world-building ideas start here
   - Researchers propose changes, additions, or new entries
   - Team discusses, reviews, approves
   - Historical record of all world-building decisions

2. **WorldAnvil (Live Repository)**
   - The authoritative, public-facing universe
   - Contains all approved, validated entries
   - Linked back to GitHub proposals for traceability
   - Serves as the reference for narrative consistency

3. **Individual Team Repos (Research & Assets)**
   - Concept art, character designs, thematic research
   - Sketches, mood boards, cultural references
   - Supporting documentation that informs WorldAnvil entries

---

## Step-by-Step Process

### Phase 1: Proposal Submission (GitHub)

**Create a GitHub Issue or Markdown file in META-CHIIDS/projects/BSP/proposals/**

Example filename: `proposal_new_cultural_element_philosophy.md`

**Proposal template:**

```markdown
# WorldAnvil Proposal: [Entry Name]

## Type
[ ] New Character
[ ] New Location/Region
[ ] New Cultural Element
[ ] New Mythology/Lore
[ ] Revision to Existing Entry

## Summary
[1-2 sentence overview]

## Detailed Description
[What is this? Why does it exist? How does it fit into the BSP universe?]

## Cultural / Narrative Context
[What real-world or BSP-universe context informs this?]

## Related Entries
[What other WorldAnvil entries does this connect to?]

## Supporting Materials
[Links to concept art, research papers, references, Zotero entries]

## Proposed Status
- [ ] Draft (discussion phase)
- [ ] Ready for review (needs approval)
- [ ] Approved (ready to add to WorldAnvil)
```

### Phase 2: Team Review & Discussion (GitHub)

**In the Issue or PR:**
- Team members comment with feedback, questions, or suggestions
- Designer provides sketches or visual references
- Researcher provides cultural/historical precedent
- Narrative coordinator checks alignment with existing lore

**Decision Gate:**
- [ ] All feedback addressed
- [ ] Cultural sensitivity reviewed
- [ ] Narrative consistency validated
- [ ] Visual direction approved

### Phase 3: Approval & Migration (WorldAnvil)

**Upon approval:**

1. **Format the final entry** according to WorldAnvil conventions
   - Use consistent naming, tagging, and structure
   - Link to related entries (in WorldAnvil UI)

2. **Add metadata:**
   - GitHub Proposal Link: `https://github.com/CHI-CityTech/META-CHIIDS/issues/[number]`
   - Proposal ID: `[GitHub-issue-number]`
   - Approval Date: `[date]`
   - Contributors: `[names]`

3. **Publish in WorldAnvil**
   - Choose appropriate folder/category
   - Set access level (public or private)
   - Add to relevant world maps or relationships

4. **Close the GitHub Proposal**
   - Mark as resolved
   - Link to WorldAnvil entry in closing comment

### Phase 4: Maintenance & Future Iterations (GitHub + WorldAnvil)

**If changes are needed:**
- Open a new GitHub Issue referencing the original proposal
- Discuss changes
- Update WorldAnvil with approved modifications
- Link new proposal to the original

---

## Best Practices

### Naming Conventions

- **GitHub Proposals:** `proposal_[domain]_[title].md`
  - `proposal_cultural_philosophy_dualism.md`
  - `proposal_location_mountains_of_the_north.md`

- **WorldAnvil Entries:** [Consistent with existing entries in the world]

### Metadata for Traceability

In WorldAnvil entry footer:

```
---
**GitHub Proposal:** [Link to issue]
**Version:** v1 (approved [date])
**Contributors:** [Names]
**Last Updated:** [Date]
```

### Communication Channels

- **Proposal Discussions:** GitHub Issues (threaded, permanent record)
- **Quick Questions:** Discord #bsp-world-building
- **Major Decisions:** GitHub Pull Request or Issue with voting/approval labels

### Version Control

- WorldAnvil is the "live" version
- GitHub holds historical versions and rationale
- If a major revision is needed, create a new GitHub proposal (don't edit the old one)

---

## Timeline & Milestones

Typical proposal lifecycle:

| Phase | Timeline | Owner |
|--|--|--|
| Proposal Submission | — | Researcher |
| Community Discussion | 3–7 days | Team |
| Revision (if needed) | 3–5 days | Researcher |
| Final Approval | 1–2 days | Lead Designer / Narrative Coordinator |
| WorldAnvil Migration | 1 day | Whoever approved |
| Documentation & Link | 1 day | Project Manager |
| **Total** | **~2 weeks** | — |

For simple additions, this can be 3–5 days. Major additions or controversial entries may take longer.

---

## Example: Complete Workflow

### Scenario: Proposing a New Ritual/Ceremony

1. **Researcher writes proposal in GitHub:**
   `proposal_cultural_moonlight_ceremony.md`
   - Describes the ritual, its origin, its significance
   - Provides cultural references and research sources
   - Links to Zotero entries for anthropological context

2. **Team reviews (3 days):**
   - Cultural researcher validates anthropological accuracy
   - Narrative coordinator ensures consistency with existing lore
   - Artist sketches visual representations
   - Game designer considers how it might appear in gameplay/narrative

3. **Researcher revises** based on feedback (1 day)

4. **Narrative lead approves** (1 day)

5. **Entry migrated to WorldAnvil:**
   - Properly formatted
   - Linked to related entries (characters involved, locations, times of year)
   - Tagged with domain, culture, and themes
   - GitHub link embedded

6. **GitHub issue closed** with link to WorldAnvil entry

7. **StudentResearch updated** with milestone completion

---

## Tools & Tips

### GitHub Features to Use
- **Labels:** `worldanvil`, `cultural-research`, `bsp-proposal`, `review-needed`, `approved`
- **Milestones:** Semester-based or narrative-arc-based (e.g., "Season 1 Lore")
- **Project Board:** Columns for "Proposals," "In Review," "Approved," "Published"

### WorldAnvil Features to Use
- **Templates:** Use existing entry templates for consistency
- **Categories & Folders:** Organize by domain (geography, culture, characters, etc.)
- **Internal Links:** Link related entries for narrative cohesion
- **Conditions:** Mark some entries as "draft" or "internal" until ready for public

### Collaboration Tools
- **Discord:** For brainstorming and quick feedback
- **Zotero:** For sharing research sources and references
- **Google Drive:** For collaborative sketching or mood boards
- **Overleaf:** For formal world-building documents or canonical texts

---

## Troubleshooting

### "A proposal was approved, but the WorldAnvil entry hasn't been updated yet"
→ Check StudentResearch milestone tracker; add to next sprint if not assigned

### "There's a conflict between GitHub and WorldAnvil versions"
→ Always treat WorldAnvil as live; if GitHub version is newer, open a new proposal with the update

### "We want to deprecate an entry"
→ Don't delete from WorldAnvil; mark as "deprecated" with a note explaining why and what supersedes it. Keep GitHub historical reference.

---

## Summary

This workflow ensures:
- ✔ All world-building decisions are documented and traceable
- ✔ Community input is solicited before changes go live
- ✔ WorldAnvil remains the authoritative universe
- ✔ GitHub provides the historical record
- ✔ AI and human reviewers can validate consistency
- ✔ Semester progress is tracked in StudentResearch

For questions, see `INTEGRATION-PATHS.md` or the main `README.md`.

