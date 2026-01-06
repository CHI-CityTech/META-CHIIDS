# CHIIDS Development Roadmap

**Last Updated:** January 6, 2026  
**Coordinator:** Dr. David B. Smith  
**Repository:** [META-CHIIDS](https://github.com/CHI-CityTech/META-CHIIDS)

---

## Overview

CHIIDS (CHI Integrated Digital System) is itself a meta-project following the three-layer architecture it defines. This roadmap tracks the development of CHIIDS's infrastructure: database, API, frontend, integrations, and supporting tools that scaffold all CHI research.

CHIIDS is both the **map** (architecture documentation) and the **territory** (executable system) — this roadmap focuses on the territory: the bootstrap projects that bring the architecture to life.

---

## Current Status Summary

**Overall Progress:** ~30% (Foundation layer complete; execution layer in progress)

| Component | Status | Notes |
|-----------|--------|-------|
| Database Schema & Ontology | 🟢 Complete | SQLite schema designed; seed data partial |
| Documentation (Architecture, Principles) | 🟢 Complete | ARCHITECTURE, templates, integration paths documented |
| Datasette API Setup | 🟡 In Progress | Basic deployment planned for Spring 2026 |
| Frontend (React/Vite) | 🔴 Planned | UI for browsing projects, dependencies, opportunities |
| GitHub Actions Automation | 🟡 In Progress | Basic sync logic; full automation pipeline planned |
| CUNY Academic Works Integration | 🔴 Planned | Library discussion phase; implementation Spring 2026 |
| OJS Journal Setup | 🔴 Planned | Platform selection + configuration; launch Spring/Fall 2026 |
| Backup & Archive Automation | 🔴 Planned | Zenodo sync, OneDrive backups; Q2 2026 |

---

## Completed (Layer 3 Delivered)

- **Database Schema** — Full relational schema for meta-projects, dependencies, research opportunities — Completed January 2026
- **ARCHITECTURE Documentation** — Three-layer system blueprint, external systems, publishing workflows — Completed January 2026
- **CHIIDS Spec Incorporation** — Updated architecture to reflect original engineering spec — Completed January 2026
- **Project Proposal Template** — Template for new CHI meta-projects — Completed [previous]
- **Project Card Template** — Template for semester coordination — Completed [previous]
- **Roadmap Template** — Canonical structure for all roadmaps (this document) — Completed January 2026

---

## In Progress (Spring 2026 Focus)

| Milestone | Target Date | Owner(s) | Status | Blockers |
|-----------|-------------|----------|--------|----------|
| Datasette API Setup & Documentation | March 31 | [To be assigned] | 🟡 In Progress | None |
| Basic GitHub Actions Sync | March 31 | [To be assigned] | 🟡 In Progress | Database seeding |
| CUNY Academic Works Discussion + Planning | February 28 | Dr. Smith (librarian liaison) | 🟡 In Progress | Librarian availability |
| Frontend Wireframes & Data Model | April 15 | [To be assigned] | 🔴 Not started | API finalization |
| StudentResearch Integration Plan | March 15 | [To be assigned] | 🔴 Not started | Project card standardization |

---

## Planned (Fall 2026 & Beyond)

**Fall 2026:**
- Frontend MVP (React/Vite) — Project browser, dependency graph, search
- Full GitHub Actions automation (sync StudentResearch → SQLite)
- CUNY Academic Works collection setup & student submission workflow
- Zenodo integration (batch export of research outputs)

**Spring 2027:**
- OJS Journal launch (CHI Publications)
- Advanced analytics & reporting dashboards
- AI-assisted metadata generation
- WorldAnvil integration (automated wiki sync)

---

## Dependencies

### Depends On
- **CHI Organization Structure** (✅ Stable) — Meta-project repos, StudentResearch repo
- **CUNY Systems** (⏳ In discussion) — Academic Works setup, possible Nextcloud instance
- **Student/Faculty Availability** (⏳ Ongoing) — Frontend dev, automation scripting, testing

### Blocks
- **All Layer 2 Coordination** — Relies on Project Card templates + GitHub Project Boards
- **All Layer 3 Execution** — Benefits from Datasette API (not blocking)
- **Publishing Workflows** — Depend on CUNY Academic Works + OJS setup

---

## Key Risks & Blockers

- **Librarian/CUNY Coordination** — Impact: High — Mitigation: Early engagement (Dr. Smith), clear requirements, pilot with one team
- **Student Developer Availability** — Impact: High — Mitigation: Break frontend into phases, document architecture, allow contribution from multiple semesters
- **Data Quality (Seed Data)** — Impact: Medium — Mitigation: Automated validation, semester reviews to verify accuracy
- **Tool Lock-in** — Impact: Medium — Mitigation: Design for data portability, document API, avoid closed platforms
- **Scope Creep** — Impact: Medium — Mitigation: Strict separation of concerns (map vs territory), prioritized roadmap

---

## Bootstrap Projects (Execution Layer)

These are the actual GitHub repositories and tasks that realize CHIIDS:

### Layer 1: Canonical Schema & Documentation
- **Repository:** [META-CHIIDS](https://github.com/CHI-CityTech/META-CHIIDS)
- **Scope:** Database schema, ARCHITECTURE docs, templates, integration guidance
- **Status:** Core complete; ongoing refinement
- **Tracking:** [Issues](https://github.com/CHI-CityTech/META-CHIIDS/issues)

### Layer 2: API & Data Service (Datasette)
- **Repository:** [CHIIDS-API](https://github.com/CHI-CityTech/CHIIDS-API) *(to be created)*
- **Scope:** Datasette deployment, SQLite database management, read-only API endpoints
- **Status:** Planning (Spring 2026)
- **Dependencies:** Database schema finalized, initial seed data

### Layer 3: Frontend & Visualization
- **Repository:** [CHIIDS-Frontend](https://github.com/CHI-CityTech/CHIIDS-Frontend) *(to be created)*
- **Scope:** React/Vite app for browsing projects, dependencies, research opportunities
- **Status:** Wireframes in progress (Spring 2026)
- **Dependencies:** Datasette API live

### Layer 3b: GitHub Actions & Automation
- **Repository:** [StudentResearch](https://github.com/CHI-CityTech/StudentResearch) + [META-CHIIDS](https://github.com/CHI-CityTech/META-CHIIDS)
- **Scope:** Workflows to sync project cards to SQLite, generate reports, validate consistency
- **Status:** Basic scripts exist; expansion planned
- **Dependencies:** API running, schema stable

### Layer 3c: Publishing & Integrations
- **Scope:** CUNY Academic Works integration, OJS journal platform, Zenodo API sync
- **Status:** Requirements gathering (Spring 2026)
- **Repositories:** TBD after platform selection

---

## Team & Coordination

- **Overall Coordinator:** Dr. David B. Smith
- **API/Backend Lead:** [To be assigned]
- **Frontend Lead:** [To be assigned]
- **Integrations Lead:** [To be assigned]
- **Meeting Schedule:** Weekly CHIIDS standup (Fridays 2pm EST), bi-weekly with CHI leadership
- **Tracking:** [GitHub Projects](https://github.com/CHI-CityTech/META-CHIIDS/projects) + StudentResearch issues
- **Communication:** [Discord/Slack TBD]

---

## Links

- **CHIIDS ARCHITECTURE:** [docs/architecture/ARCHITECTURE.md](../docs/architecture/ARCHITECTURE.md)
- **Database Schema:** [database/schema.sql](../database/schema.sql)
- **CHIIDS Spec:** [docs/CHI Integrated Digital System (CHIDS).md](../docs/CHI%20Integrated%20Digital%20System%20(CHIDS).md)
- **StudentResearch Repo:** [CHI-CityTech/StudentResearch](https://github.com/CHI-CityTech/StudentResearch)
- **CHI Organization:** [CHI-CityTech](https://github.com/CHI-CityTech)

---

## Notes

- CHIIDS development is intentionally paced to avoid over-engineering. Each component (database, API, frontend) is delivered incrementally.
- The roadmap reflects Spring 2026 priorities; feedback from active projects will inform Fall 2026+ direction.
- Tool choices (Datasette, React, OJS) are provisional; replacements considered if better alternatives emerge.

---

**Last Review:** January 6, 2026 | **Next Review:** March 1, 2026
