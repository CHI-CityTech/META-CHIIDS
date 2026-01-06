# CHIIDS Integration Paths: External Systems & Platforms

This document describes how CHIIDS connects to and integrates with external systems, platforms, and tools used by CHI. It consolidates guidance for GitHub, OpenLab, WorldAnvil, Zotero, and other services.

**See Also:** [docs/architecture/ARCHITECTURE.md](../architecture/ARCHITECTURE.md) for the full three-layer system architecture, primary/secondary external systems, and publishing workflows.

## Core Integration Philosophy

CHIIDS follows the principle of **"Integration over Creation"**: instead of building redundant tools, we orchestrate existing systems into a cohesive ecosystem via APIs, metadata linking, and shared workflows.

---

## 1. GitHub Integration

### Purpose
Version control, project management, issue tracking, automation.

### How CHIIDS Uses GitHub

**Proposal Storage**
- All project proposals live in the META-CHIIDS repository (`/database/` and individual project files)
- Versioned and auditable

**Project Management**
- GitHub Issues and Project Boards track milestones, tasks, and dependencies
- Labels organize work by project, semester, domain, and team

**Team Repositories**
- Each active research project has its own repo (e.g., `ShadowPuppet-Unreal`, `AI-Puppet-Control`)
- Students commit code, assets, and documentation directly to their team repo

**GitHub Actions**
- Auto-generate reports from SQLite metadata
- Sync StudentResearch assignments to CHIIDS database
- Validate schema integrity and referential consistency
- Build Markdown and visual catalogs

**GitHub Pages**
- Public-facing catalog of all meta-projects
- Automatically updated from CHIIDS metadata
- Searchable, readable interface for browsing projects

### Best Practices
- Label issues with both project name and semester (e.g., `BSP`, `Fall2025`)
- Link proposal files in issue descriptions when discussing implementation
- Use GitHub Discussions for cross-project or meta-project conversations
- Archive closed issues yearly for historical reference

---

## 2. OpenLab Integration

### Purpose
Public web presence, community engagement, documentation hosting, broader visibility beyond GitHub.

### How CHIIDS Uses OpenLab

| Data/Communication Type | OpenLab | GitHub | Other Systems |
|--|--|--|--|
| **Project Management** | | | |
| Task Tracking & Milestones | ✔ | ✔ (primary) | |
| Resource Allocation | | ✔ (primary) | |
| Meta-Project Coordination | ✔ | ✔ | |
| **Internal Communications** | | | |
| Project Communication | ✔ Forums | ✔ Discussions (primary) | Discord |
| Cross-CHI Communication | ✔ (primary) | ✔ | Discord |
| Meta-Project Communication | ✔ | ✔ | Discord |
| **External Communications** | | | |
| Public Website | ✔ WordPress (primary) | GitHub Pages | |
| Blog Posts | ✔ (primary) | | |
| Newsletters | ✔ (primary) | | |
| Research Opportunities | ✔ (primary) | | |
| **Documentation** | | | |
| Project Documentation | ✔ Docs | ✔ Wiki (primary) | |
| Archival | ✔ Docs (primary) | Repos | |
| Living Archive | ✔ (primary) | | |
| **Knowledge Management** | | | |
| Tagging System | ✔ Tags (primary) | Issues | |
| Metadata Storage | ✔ Docs (primary) | Repos | |

### Integration Workflow
1. **Public Project Announcements** → published on OpenLab first
2. **Community Engagement** → OpenLab forums for non-technical stakeholders
3. **Documentation for Public Audiences** → OpenLab, linked from GitHub
4. **Archival of Finished Projects** → moved to OpenLab docs or offline storage
5. **Internal Project Work** → remains in GitHub

### Best Practices
- Use OpenLab for engagement with communities outside CHI/GitHub
- Keep sensitive or in-progress work in GitHub (restricted to CHI members)
- Link OpenLab pages from GitHub READMEs for public visibility
- Archive OpenLab documentation regularly to ensure linkage accuracy

---

## 3. WorldAnvil Integration: World-Building Workflow

WorldAnvil is used for the collaborative development of fictional universes and narrative worlds, particularly for the Blended Shadow Puppet (BSP) meta-project.

### Proposed Workflow (GitHub as Proposal Space, WorldAnvil as Live Repository)

**Step 1: Centralized Repository for Proposals on GitHub**
- All new proposals or major changes to the WorldAnvil world (e.g., new regions, characters, lore) are first documented as proposals on GitHub
- Researchers submit proposals in structured formats (markdown documents) within the `META-CHIIDS` repo
- Transparent tracking, discussion, and collaborative input before implementation in WorldAnvil

**Step 2: Review and Approval Process Using GitHub Issues & Pull Requests**
- Each proposal is associated with a GitHub Issue or Pull Request
- Team members comment, suggest modifications, and discuss feasibility
- Major updates go through formal review cycle with stakeholder approval
- GitHub's approval settings ensure only validated proposals move forward

**Step 3: WorldAnvil as the Final Repository for Validated Content**
- Approved proposals are moved to WorldAnvil, which serves as the "live" repository for validated entries
- Metadata tags or notes added in WorldAnvil to indicate GitHub version number and proposal ID
- Ensures traceability between proposals and final entries

**Step 4: Version Control and Historical Tracking on GitHub**
- GitHub serves as the historical record
- Tracks all proposed changes, previous iterations, and associated discussions
- For large updates, branches house "development" versions, consolidated into WorldAnvil upon final approval

**Step 5: Regular Synchronization**
- Establish regular synchronization process ensuring updates on WorldAnvil and GitHub are cross-referenced
- GitHub Actions can notify team members to review changes or create reminders for syncing

**Step 6: Feedback and Iteration**
- GitHub Projects manage world-building "sprints" or tasks
- Track each phase from proposal to final entry
- Proposals iteratively improved based on feedback

**Step 7: Separate Repositories for Content Categories**
- For complex projects, separate GitHub folders organize proposals by category (e.g., "Geography," "Culture," "Mythology")
- Facilitates focused discussions and workload division

### Potential Challenges & Solutions

| Challenge | Solution |
|--|--|
| Content Synchronization Complexity | Use automation tools (GitHub Actions) to sync metadata and versioning between GitHub and WorldAnvil |
| User Access & Permissions | Align WorldAnvil roles with GitHub permissions; only approved members update WorldAnvil directly |
| Change Tracking | Add metadata tags (e.g., GitHub Issue numbers) on WorldAnvil entries or links back to GitHub |

### Example Workflow: New Cultural Element Proposal

1. **Proposal Submission** → Researcher submits proposal on GitHub for new philosophical system
2. **Team Review** → Team reviews, comments, and suggests changes; additional materials (references, sketches) uploaded
3. **Approval & Migration** → Upon approval, final version moved to WorldAnvil with metadata and GitHub links
4. **Closing** → GitHub proposal is closed; future updates documented through new issues

---

## 4. Zotero Integration

### Purpose
Centralized academic bibliography and research reference management.

### How CHIIDS Uses Zotero

**CHI Zotero Groups**
- `BBS` — Balanced Blended Space theoretical papers
- `BRPS` — Blended Reality Performance System references
- `BSP` — Blended Shadow Puppet world-building and narrative research
- `CAI` — Collaborative AI and human–AI interaction
- `UNESCO` — Cultural transformation and heritage studies
- `SEID` — Special Education/Inclusive Design
- `QuantumMusic` — AI and music research

**Integration with Research Workflows**
- All project proposals should cite relevant Zotero entries
- Abstract from META-CHIIDS can be imported directly into Zotero as a research document
- Students contributing to projects link their work to relevant Zotero entries
- Project READMEs include Zotero group links for reference

**Metadata Linking**
- CHIIDS SQLite can reference Zotero collection URLs
- GitHub Actions can validate that cited references are accessible

### Best Practices
- Add all papers, books, and resources used in project proposals to the appropriate Zotero group
- Tag entries with project names and domains
- Keep Zotero groups synchronized with StudentResearch semester updates
- Link Zotero collections from project README files

---

## 5. Collaborative AI Practices

### Purpose
Document how AI tools are used throughout CHIIDS workflows.

### Current AI Integration

**In Proposal Writing**
- ChatGPT, Claude, or NotebookLM assists in drafting and refining proposals
- AI validates BBS syntax compliance in mediation-pathway descriptions
- AI generates summaries, outlines, and hierarchical structures

**In Research Workflows**
- AI assists in literature reviews, synthesis, and connection-finding
- AI supports brainstorming and idea refinement
- AI helps document and articulate findings

**In Project Planning**
- AI helps map dependencies, timelines, and resource allocations
- AI assists in risk assessment and feasibility analysis

**In Execution**
- AI tools (BRPS, performance systems, puppet control) integrated into live systems
- AI used for data analysis, visualization, and reporting

### Documentation
- All significant AI-assisted work is documented in the relevant GitHub Issues or team repos
- StudentResearch templates include AI usage logging
- Project proposals note which AI tools were consulted and how

### Ethical Framework
- AI is treated as a collaborator, not a replacement for human expertise
- Final decisions and validations remain with human researchers
- AI-generated content is always reviewed and approved before use
- Usage is transparent and documented for reproducibility and accountability

---

## 6. Other Integrations

### Discord
- Informal communications, quick discussions, announcements
- Used for real-time collaboration across distributed teams

### Google Drive / OneDrive
- Large file storage (media, datasets, backups)
- Shared documents and collaborative writing

### ArcGIS, Airtable, Timeline.js
- Specialized data visualization for world-building (maps, timelines, economic systems)
- Linked from proposals where relevant

### Overleaf
- Collaborative LaTeX document writing for academic papers
- Linked to Zotero for reference management

---

## Summary: Integration Architecture

All integrations follow this principle:

**GitHubCore** ← (authoritative, versioned)
├── Proposals + Metadata (META-CHIIDS + SQLite)
├── Code + Assets (Team Repos)
└── Coordination (StudentResearch)
    ├── → OpenLab (public engagement)
    ├── → WorldAnvil (world-building)
    ├── → Zotero (academic references)
    ├── → Specialized Tools (ArcGIS, Airtable, etc.)
    └── → AI Systems (analysis, documentation, collaboration)

The goal: a seamless, well-documented ecosystem where each tool does what it does best, and CHIIDS orchestrates the connections.

