# CHIIDS Architecture: Three-Layer System

> **Historical Note:** This architecture evolved from the [original CHIIDS engineering specification](CHIIDS-ORIGINAL-SPEC.md) (September 2024). The original spec provides foundational context for the design decisions documented here.

## Overview

The CHI Integrated Digital System (CHIIDS) is a distributed digital ecosystem consisting of three interacting layers, each with distinct responsibilities and temporal characteristics. This document describes how these layers work together to support the Balanced Blended Space (BBS) framework and all related CHI meta-projects.

---

## Important: CHIIDS as Structural Blueprint, Not Territory

**CHIIDS is the architectural map, not the territory.**

This repository documents **how** the CHI research ecosystem is organized and coordinated. It does not duplicate project content. For project details, proposals, and active work, see the authoritative sources:

- **For Meta-Project Descriptions & Proposals** → [CHI-CityTech Organization](https://github.com/CHI-CityTech)
  - Example: [META-Balanced-Blended-Space](https://github.com/CHI-CityTech/META-Balanced-Blended-Space)
- **For Semester Activity & Coordination** → [StudentResearch Repository](https://github.com/CHI-CityTech/StudentResearch)
  - Project Cards, team assignments, milestones
- **For Execution & Deliverables** → Individual team repositories in CHI-CityTech org
  - Code, assets, research logs, sprint tracking

This architecture document explains the *structure* and *principles* that organize all that activity. If you're looking for "What is BSP?" or "Who's working on BRPS this semester?", follow the links above. If you're asking "How does CHI's digital infrastructure work?", you're in the right place.

---

## The Three Layers

### Layer 1: Meta-Project Layer (Permanent, Canonical)

**Location:** `META-CHIIDS` repository (this repo)

**Contents:**
- Project proposals (canonical, versioned)
- Relational database schema (SQLite)
- Meta-project ontology (dependencies, relationships, tags)
- Long-term documentation and architectural decisions

**Purpose:**
Define *what* each CHI meta-project is, how they relate, and what problems they solve. This layer does not change by semester.

**Key Principle:**
Projects are defined once, thoroughly, with clear dependencies. Proposals are the authoritative source of truth for project structure, not temporary semester work.

**Examples:**
- Balanced Blended Space (BBS) — Universal framework
- Blended Reality Performance System (BRPS) — Modular test environment
- Blended Shadow Puppet (BSP) — Flagship creative testbed
- Collaborative AI (CAI) — AI-human co-creation ecosystem
- BABS (Bio-Aware Blended Spaces) — Sensor-driven intelligent environment

---

### Layer 2: Research Coordination Layer (Persistent, Semester-Updated)

**Location:** `StudentResearch` repository

**Role:** 
StudentResearch is the **coordination hub** for semester activity—like CHIIDS is the map of the data system, StudentResearch is the map of the Student Research *program*. It does not duplicate work; it *links* to it.

**Contents:**
- GitHub Projects boards (one per semester) with active project cards
- Team rosters linking to team repositories
- Student proposals (documentation of what was proposed)
- Links to meta-project repositories (META-BRPS, META-BSP, etc.)
- Program-level reports (enrollment, participation, meta-project coverage, semester assessment)

**What it DOES NOT contain:**
- Code, assets, or deliverables (those live in team repos)
- Canonical project proposals (those live in META-CHIIDS)
- Individual project reports (those live in team repos)

**Purpose:**
Coordinate who is working on what, when, and link to where actual work happens. Track the Student Research *program* as a whole (enrollment, meta-project participation, semester outcomes).

**Key Principle:**
StudentResearch is *persistent* (updated every semester), *semester-organized*, and *linking-focused*. Everything points elsewhere; the repo itself is coordination and program metadata.

**Structure (by semester):**
```
StudentResearch/
├── README.md                          # Current semester overview
├── semesters/
│   ├── 2025-Spring/
│   │   ├── README.md                  # Active projects, links to meta-projects
│   │   ├── proposals/                 # Student proposals (what was proposed)
│   │   ├── teams/
│   │   │   ├── BRPS-AI-Team.md        # Team roster with repo link
│   │   │   ├── BSP-Video-Team.md      # Points to github.com/CHI-CityTech/team-repo
│   │   │   └── ...
│   │   └── program-reports/           # Program-level assessment
│   │       ├── enrollment.md          # How many students, which meta-projects
│   │       └── semester-assessment.md # Overall outcomes & lessons learned
│   ├── 2025-Fall/
│   │   ├── README.md
│   │   ├── proposals/
│   │   ├── teams/
│   │   └── program-reports/
│   └── 2026-Spring/
└── potential-projects/                # Ideas waiting for semester assignment
    ├── CASTI-Mobility.md
    └── ...

GitHub Projects (attached to StudentResearch repo):
├── "Spring 2025 Research"   → Cards for each active project
├── "Fall 2025 Research"     → Cards for Fall projects
└── "Spring 2026 Research"   → Boards created at start of semester
```

---

### Layer 3: Execution Layer (Multiple Repositories per Semester)

**Location:** Individual team repositories (e.g., `CHI-CityTech/ShadowPuppet-Unreal`, `CHI-CityTech/AI-Puppet-Control`)

**Contents:**
- Code
- Media assets
- Research logs
- Design documentation
- Sprint logs
- Prototypes and deliverables

**Purpose:**
Where the actual research and development work happens.

**Key Principle:**
Each project has its own repo. Students own and commit to their team's repo. No semester-reset; work accumulates over time.

**Examples (current teams):**
- Blended Reality Performance System
- Shadow Puppet Unreal
- AI Puppet Control System
- Collaborative AI Research
- Lumbra (game)
- UNESCO-Transformations
- Clamorous E.L.F.

---

## How the Layers Connect

```
┌─────────────────────────────────────────┐
│ Layer 1: Meta-Project Layer             │
│ (META-CHIIDS repo)                      │
│                                          │
│ • Proposals (canonical)                 │
│ • SQLite ontology (projects + deps)     │
│ • Permanent documentation               │
└──────────────┬──────────────────────────┘
               │
               │ (metadata linking via SQLite)
               │ (proposal_path, team_repo_url, dependencies)
               ▼
┌──────────────────────────────────────────┐
│ Layer 2: Research Coordination           │
│ (StudentResearch repo)                   │
│                                           │
│ • Project Cards                          │
│ • Student assignments (semester-based)   │
│ • Team membership                        │
│ • Tracking issues                        │
└──────────────┬──────────────────────────┘
               │
               │ (links to team repos)
               │
               ▼
┌───────────────────────────────────────────┐
│ Layer 3: Execution                        │
│ (Individual team repositories)            │
│                                            │
│ • Code                                    │
│ • Assets                                  │
│ • Research logs                           │
│ • Deliverables                            │
└────────────────────────────────────────────┘
```

## Data Flow

1. **Proposals** → defined in META-CHIIDS, indexed in SQLite
2. **Semester Activity** → tracked in StudentResearch via Project Cards
3. **Student Assignments** → linked from StudentResearch back to CHIIDS metadata
4. **Actual Work** → lives in team repos, coordinated via StudentResearch
5. **Visualization & Reports** → generated automatically via GitHub Actions pulling from SQLite

## GitHub Actions Automation

GitHub Actions maintain synchronization across layers:

- **Syncing StudentResearch → CHIIDS SQLite:**
  When a new Project Card is created or a student is assigned, an Action updates the metadata database with semester-specific activity.

- **Generating Reports:**
  Actions can auto-generate hierarchy diagrams, dependency graphs, semester rosters, and contribution logs from SQLite metadata.

- **Validating Consistency:**
  Ensure all referenced repos, proposals, and team assignments are still valid and accessible.

## Key Design Principles

1. **Separation of Concerns**
   - Define once (Layer 1)
   - Coordinate per semester (Layer 2)
   - Execute without friction (Layer 3)

2. **Single Source of Truth**
   - Proposals are authoritative and permanent
   - Metadata lives in SQLite, not scattered across files
   - StudentResearch reflects current semester state

3. **Arbitrary but Declared Primary Parents**
   - Every project has one primary parent (for clarity)
   - All secondary dependencies are explicit (for accuracy)
   - This honors BBS's combinative nature

4. **Scalability Across Semesters**
   - CHIIDS grows as new projects are added
   - StudentResearch updates without resetting
   - Team repos accumulate work indefinitely

5. **AI Collaboration Throughout**
   - AI assists in proposal writing and refinement
   - AI documents and validates BBS compliance
   - AI helps analyze project dependencies and relationships

---

## External Systems & Surfaces

**Note:** CHIIDS is an active work-in-progress; systems listed reflect current intended architecture and evolve as integration deepens. The structure (not specific tools) is canonical.

### Primary Systems (Universal, External-Partner-Ready)

These systems prioritize cross-institutional collaboration and are not locked to CUNY infrastructure.

| Surface | Purpose | Primary Layer Touchpoints | Data Types |
| --- | --- | --- | --- |
| Slack / Discord / Mattermost | Communication, collaboration, meetings | Layer 2 (coordination), Layer 3 (team ops) | Chat logs, meeting summaries, decisions (policy-bound) |
| Google Drive / Notion / Nextcloud / GitHub | Document storage, active collaboration, backup | Layer 1 (canonical docs), Layer 2 (coordination artifacts), Layer 3 (assets/code) | Docs, media, assets, version history |
| GitHub | Version control, issues, CI/CD | Layer 1 (canonical proposals/DB), Layer 2 (cards/issues), Layer 3 (code) | Code, version history, issues, PRs |
| Zenodo / OSF / Internet Archive | Long-term research archival, public access | Layer 1 (published outputs), Layer 3 (deliverables) | Research data, media, publications, DOI-minted artifacts |
| CUNY Academic Works | Institutional repository, student/faculty publications | Layer 1 (canonical outputs), Layer 3 (deliverables) | Papers, datasets, theses, creative works with DOIs |
| WordPress / Open Lab / Static site | Public web presence | Layer 2 (publishing coordination), Layer 3 (content sources) | Public content, project outcomes, research opportunities |
| CHI Publications (OJS Journal) | Peer-reviewed academic journal | Layer 2 (editorial management), Layer 3 (manuscript sources) | Reviewed articles, creative scholarship, multimedia works |
| Datasette API (or similar) | Read-only project metadata & visualization | Layers 1–3 (frontend consumption) | Project/ontology data, dashboards |

### Secondary Systems (CUNY-Specific, Optional Internal Integration)

These systems support internal CUNY workflows but are not required for cross-institutional collaboration.

| Surface | Purpose | Primary Layer Touchpoints | Notes |
| --- | --- | --- | --- |
| Microsoft Teams | Internal CUNY meetings, async chat | Layer 2 (coordination), Layer 3 (team ops) | Bridge to Slack/Discord via webhooks/integrations; optional for fully external teams |
| SharePoint / OneDrive | CUNY-managed storage, compliance | Layer 1 (backup), Layer 3 (internal file sharing) | Mirrors primary system (Google Drive/Nextcloud); consider for CUNY institutional requirements only |

---

## Data Domains & Stewardship

- **Project Management:** Layer 1 (canonical definitions/ontology), Layer 2 (cards/assignments), Layer 3 (issues/boards).
- **Research Opportunities Dataset:** Layer 1 (SQLite), surfaced to frontend/public; linked to StudentResearch for assignments.
- **Docs & Reports:** Layer 1 (canonical proposals/decisions), Layer 3 (working docs); Layer 2 references and publishes.
- **Media & Living Archive:** Produced in Layer 3; curated/published via Layer 2 to OpenLab; backed up to OneDrive/SharePoint.
- **Version Control:** GitHub across layers; Layer 1 schema/proposals, Layer 2 coordination artifacts, Layer 3 code/assets.
- **Communication Data:** Teams/Discord; retain per policy; summaries/decisions flow back to Layer 2 records.
- **Backup & Archival:** OneDrive/SharePoint snapshots for Layer 1 docs, Layer 3 assets/code/virtual envs; defined cadence/retention.

---

## CHIIDS as Meta-Project (Self-Referential)

CHIIDS is **both** the architectural blueprint AND a meta-project with its own implementation roadmap.

**As Blueprint:** CHIIDS defines the structure (three layers, data domains, integration paths) and coordinates all meta-projects (BRPS, BSP, CAI, etc.).

**As Implementation:** CHIIDS itself is a meta-project that requires student work to build:
- Layer 1: Database schema, seed data population, Datasette API
- Layer 2: Research coordination system, StudentResearch GitHub Projects
- Layer 3: Frontend (React/Vite), automation (GitHub Actions), integrations (CUNY Academic Works, OJS, Zenodo)

**In StudentResearch:** CHIIDS appears as active project card(s) each semester:
- **Fall 2025–Spring 2026:** "CHIIDS Database & API Deployment" (infrastructure student)
- **Spring 2026:** "CHIIDS Frontend Development" (web dev student team)
- **Ongoing:** "CHIIDS Automation & Integration" (as needed)

This is intentional: the system that coordinates all work *itself* is coordinated through that same system. CHIIDS is simultaneously the map and the territory.

---

## Public Engagement & Publishing Flow

### General Publishing Pipeline

1. Layer 3 produces code, media, and write-ups.
2. Layer 2 curates, reviews, and approves for public release.
3. Publish to OpenLab/WordPress (site) and Buffer (social). Track cadence and approvals in Layer 2.
4. Archive published assets to CUNY Academic Works / Zenodo / archival storage per backup policy.

### CHI Publications: Academic Journal (In Development)

**Purpose:** Formalize student and faculty research outputs through peer/faculty-reviewed academic publishing.

**Scope:**
- Student-authored research (undergraduate/graduate)
- Faculty-mentored scholarship
- Interdisciplinary/creative works (papers, media, interactive)
- Diamond Open Access (free to read and publish)

**Platform:** Open Journal Systems (OJS) or equivalent, hosted via CUNY Libraries or self-hosted.

**Editorial Workflow (Layer 2 Managed):**
1. **Submission:** Layer 3 outputs submitted via OJS editorial system.
2. **Review:** Faculty/peer review coordinated by editorial board.
3. **Acceptance:** Approved articles receive DOIs and formal publication.
4. **Archival:** Published works automatically deposited to:
   - CUNY Academic Works (institutional record)
   - Zenodo (cross-institutional backup)
   - Indexed in DOAJ, Google Scholar
5. **Announcement:** Layer 2 coordinates announcements via OpenLab and social channels.

**CHIIDS Integration:**
- **Layer 1:** SQLite tracks publication metadata (DOI, authors, linked projects).
- **Layer 2:** Manages editorial board, review assignments, publication schedule.
- **Layer 3:** Source of manuscripts and supporting materials.

**External Communications Role:**
- Public-facing journal increases CHI visibility and credibility.
- Provides citeable, DOI-minted outputs for student portfolios and faculty tenure.
- Connects to broader academic community and external partners.

**Internal Coordination:**
- Editorial board meetings and decisions tracked in Layer 2 coordination tools.
- Submission deadlines align with semester milestones.
- Published issues linked back to originating CHIIDS projects.

---

## Storage, Backup, and Archival Policy (Draft)

- **Active storage:** OneDrive/SharePoint for current docs and media; GitHub for code.
- **Backups:** Scheduled backups of Layer 1 canonical docs/DB and Layer 3 assets/code bundles to OneDrive/SharePoint.
- **Archival:** Completed project packages (reports, media, virtual environments) stored with metadata for retrieval.
- **Recovery:** Define RPO/RTO targets; test restores periodically.

---

## Communication Pathways

- **Internal (Teams/Discord):** Day-to-day coordination; key decisions summarized into Layer 2 records.
- **External (OpenLab/Buffer):** Announcements and public updates managed via Layer 2, sourced from Layer 3 outputs.

---

## Integration Principles (from Draft Engineering Specification)

- Scalability for more participants/projects without performance loss.
- Interoperability with City Tech systems (e.g., CIS, OpenLab) and external tools.
- Accessibility and inclusivity for varied technical ability and resources.
- Automation for syncs, backups, and validations.
- Robust version control for documents and code.
- Reuse existing solutions before building new ones.

---

## Research Opportunities Dataset (Draft Placement)

- **Source:** Layer 1 SQLite schema holds opportunity metadata (title, tags, deadlines, eligibility).
- **Exposure:** Datasette/Frontend reads from SQLite for browse/search.
- **Linkage:** Layer 2 Project Cards reference opportunities; student assignments tracked in StudentResearch; Layer 3 delivers outputs linked back to the opportunity record.

## CHIIDS as a Meta-Project: Its Own Roadmap

CHIIDS itself follows this three-layer model. It is both the **architectural blueprint** (this document) and an **executable system** (database, API, frontend, integrations). 

**CHIIDS Development:**
- **Layer 1:** Database schema, ARCHITECTURE docs, templates, integration principles (canonical)
- **Layer 2:** Semester-updated development roadmap, GitHub Project boards, team assignments
- **Layer 3:** API (Datasette), Frontend (React/Vite), automation (GitHub Actions), integrations

For current status, bootstrap projects, and semester milestones, see **[CHIIDS-ROADMAP.md](CHIIDS-ROADMAP.md)**.

All meta-projects (BBS, BRPS, BSP, CAI, UNESCO, etc.) are encouraged to follow the **[roadmap template](../templates/META-PROJECT-ROADMAP.md)** for consistency, visibility, and dependency tracking.

---

## For More Information

- See **[CHIIDS-ROADMAP.md](CHIIDS-ROADMAP.md)** for CHIIDS development status and bootstrap projects
- See **[templates/META-PROJECT-ROADMAP.md](../templates/META-PROJECT-ROADMAP.md)** for canonical roadmap structure (all projects)
- See `ECOSYSTEM.md` for the current state of all meta-projects
- See `GLOSSARY.md` for definitions of key terms
- See `INTEGRATION-PATHS.md` for how CHIIDS connects to external systems (GitHub, OpenLab, WorldAnvil, Zotero)
- See `/database/schema.sql` for the relational structure

