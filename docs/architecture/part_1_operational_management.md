# Part 1: Operational Management (Internal Structure)

## Overview

The CHI Integrated Digital System (CHIIDS) is a distributed digital ecosystem consisting of three interacting layers, each with distinct responsibilities and temporal characteristics. This document describes the **internal operational structure**—how projects are defined, coordinated, and executed.

For data infrastructure (databases, APIs, storage), see **[Part 2: Data Infrastructure](part_2_data_infrastructure.md)**.  
For public engagement and publishing, see **[Part 3: Public Engagement](part_3_public_engagement.md)**.  
For external integrations, see **[Part 4: External Integration](part_4_external_integration.md)**.  
For archival and preservation, see **[Part 5: Archival & Preservation](part_5_archival_preservation.md)**.

> **Historical Note:** This architecture evolved from the [original CHIIDS engineering specification](chiids_original_spec.md) (September 2024). The original spec provides foundational context for the design decisions documented here.

---

## Important: CHIIDS as Structural Blueprint, Not Territory

**CHIIDS is the architectural map, not the territory.**

This repository defines the **structure and schema** for how the CHI research ecosystem is organized. It does not contain the projects themselves. For the actual Project Map and project details, see the authoritative source:

- **For the Canonical Project Map** → [CHI-CityTech Organization](https://github.com/CHI-CityTech)
  - README lists all META-projects and their relationships
  - Individual META-* repos (META-Balanced-Blended-Space, META-BRPS, etc.) contain project details
  - Projects are tagged to show membership in multiple meta-projects
  
- **For Semester Activity & Coordination** → [StudentResearch Repository](https://github.com/CHI-CityTech/StudentResearch)
  - Project Cards, team assignments, milestones
  
- **For Execution & Deliverables** → Individual team repositories in CHI-CityTech org
  - Code, assets, research logs, sprint tracking

This architecture document explains the *structure* that organizes all of that activity.

---

## The Three Layers

### Layer 1: Meta-Project Layer (Permanent, Canonical)

**Location:** `META-CHIIDS` repository (this repo) — *The Structural Blueprint*

**Contents:**
- Relational database schema (SQLite) defining project structure
- Meta-project ontology (how projects relate, dependencies, tagging system)
- Architectural principles and integration rules
- Long-term documentation and system design decisions
- Configuration files (datasette.yml, etc.)

**Important:** The actual *Project Map* (canonical list of projects and their details) lives in the [CHI-CityTech organization](https://github.com/CHI-CityTech). CHIIDS defines the **structure and schema** that the Project Map conforms to, not the project content itself.

**Purpose:**
Define the *structure* for how CHI meta-projects are organized, related, and tagged. This layer specifies: "If we want to track projects and their relationships, here's the schema." It does not change by semester; it only evolves when the structural design itself needs to change.

**Key Principle:**
Projects conform to a canonical structure (defined here), with clear schema for relationships and tags. Many projects can belong to multiple meta-projects via the tagging system. CHIIDS is the *map of the system*, not the territory.

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
┌────────────────────────────────────────────────────────────┐
│ Layer 1: Meta-Project Layer (CANONICAL, PERSISTENT)        │
│ • Proposals, ontology, schema, documentation               │
│ • Authority: What is this project?                         │
└─────────────────────┬──────────────────────────────────────┘
                      │
                      │ References / Authority checks
                      │
┌─────────────────────▼──────────────────────────────────────┐
│ Layer 2: Research Coordination Layer (SEMESTER-UPDATED)    │
│ • Project cards, team rosters, program reports             │
│ • Authority: Who's working on what this semester?          │
└─────────────────────┬──────────────────────────────────────┘
                      │
                      │ Coordination / Tracking
                      │
┌─────────────────────▼──────────────────────────────────────┐
│ Layer 3: Execution Layer (TEAM REPOS, SEMESTER-BASED)      │
│ • Code, assets, logs, deliverables                         │
│ • Authority: What was actually built?                      │
└────────────────────────────────────────────────────────────┘
```

**Data Flow:**
1. Layer 1 defines the project.
2. Layer 2 assigns students and teams to Layer 1 projects each semester.
3. Layer 3 delivers code, media, and research outputs.
4. Layer 2 tracks semester participation and aggregates program outcomes.
5. Layer 1 is updated with lessons learned and new research opportunities.

---

## CHIIDS as Meta-Project (Self-Referential)

CHIIDS is **both** the architectural blueprint AND a meta-project with its own implementation roadmap.

**As Blueprint:** CHIIDS defines the structure (three layers, operational principles) and coordinates all meta-projects (BRPS, BSP, CAI, etc.).

**As Implementation:** CHIIDS itself is a meta-project that requires student work to build:
- Layer 1: Database schema, seed data population, Datasette API specification
- Layer 2: Research coordination system, StudentResearch GitHub Projects setup
- Layer 3: Frontend (React/Vite), automation (GitHub Actions), integrations (CUNY Academic Works, OJS, Zenodo)

**In StudentResearch:** CHIIDS appears as active project card(s) each semester:
- **Fall 2025–Spring 2026:** "CHIIDS Database & API Deployment" (infrastructure student)
- **Spring 2026:** "CHIIDS Frontend Development" (web dev student team)
- **Ongoing:** "CHIIDS Automation & Integration" (as needed)

This is intentional: the system that coordinates all work *itself* is coordinated through that same system. CHIIDS is simultaneously the map and the territory.

---

## Integration Principles

These principles guide the design of CHIIDS and all meta-projects:

1. **Scalability** — System grows with CHI without performance loss.
2. **Interoperability** — Seamless integration with existing platforms (City Tech CIS, OpenLab, GitHub, Slack, etc.).
3. **Accessibility & Inclusivity** — Users of all technical abilities can participate.
4. **Automation** — Syncs, backups, and validations happen automatically.
5. **Version Control** — Robust history for documents and code.
6. **Reuse Existing Solutions** — Leverage existing tools before building new ones.
7. **Separation of Concerns** — Clear boundaries between layers; each has a defined responsibility.
8. **Linking, Not Duplicating** — References point to authoritative sources; no redundant copies.

---

## For More Information

- See **[Part 2: Data Infrastructure](part_2_data_infrastructure.md)** for SQLite, Datasette, Frontend, backups
- See **[Part 3: Public Engagement](part_3_public_engagement.md)** for publishing, website, journal, social media
- See **[Part 4: External Integration](part_4_external_integration.md)** for GitHub, CUNY Academic Works, Zenodo, WorldAnvil, Zotero
- See **[Part 5: Archival & Preservation](part_5_archival_preservation.md)** for long-term storage, recovery, archival policy
- See **[chiids_roadmap.md](chiids_roadmap.md)** for CHIIDS development status and bootstrap projects
- See **[ecosystem.md](../reference/ecosystem.md)** for current state of all meta-projects
- See **[glossary.md](../reference/glossary.md)** for definitions of key terms
- See **[integration_paths.md](../reference/integration_paths.md)** for how CHIIDS connects to external systems
- See `/database/schema.sql` for the relational database structure
