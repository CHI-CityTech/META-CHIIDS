# CHIIDS Architecture: Three-Layer System

## Overview

The CHI Integrated Digital System (CHIIDS) is a distributed digital ecosystem consisting of three interacting layers, each with distinct responsibilities and temporal characteristics. This document describes how these layers work together to support the Balanced Blended Space (BBS) framework and all related CHI meta-projects.

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

**Contents:**
- Project Cards (one per active project per semester)
- Student assignment tracking
- Team membership rosters
- Semester milestones and goals
- GitHub Issues and tracking links
- Coordination documentation

**Purpose:**
Connect abstract projects (defined in Layer 1) to actual work (done in Layer 3) and track who is doing what, when.

**Key Principle:**
StudentResearch is *persistent* (it never resets), but *updated* every semester. It coordinates between proposals and execution; it does not store execution details.

**Does NOT contain:**
- Code, assets, or deliverables (those live in team repos)
- Canonical proposals (those live in META-CHIIDS)

**Structure (by semester):**
```
StudentResearch/
├── ProjectCards/
│   ├── BRPS-BABS-Fall2025.md
│   ├── BSP-GameTeam-Fall2025.md
│   └── ...
├── Students/
│   ├── studentname1.md
│   └── ...
└── SemesterLogs/
    ├── Fall2025.md
    └── Spring2026.md
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

## For More Information

- See `ECOSYSTEM.md` for the current state of all meta-projects
- See `GLOSSARY.md` for definitions of key terms
- See `INTEGRATION-PATHS.md` for how CHIIDS connects to external systems (GitHub, OpenLab, WorldAnvil, Zotero)
- See `/database/schema.sql` for the relational structure

