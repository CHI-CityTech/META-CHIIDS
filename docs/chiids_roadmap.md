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

### 🔥 URGENT: Public Database Access (Critical Blocker)

**Why Critical:** Users need read access to query projects and research opportunities NOW. Without this, CHIIDS is not functional for its primary purpose.

| Milestone | Target Date | Owner(s) | Status | Priority | Notes |
|-----------|-------------|----------|--------|----------|-------|
| **Infrastructure Evaluation** | **January 15** | **[Data Science Student]** | 🔴 **URGENT** | **P0** | Compare Vercel, Fly.io, Railway, AWS RDS for size/cost/performance |
| **Database Population (All Projects)** | **January 20** | **[Data Science Student]** | 🔴 **URGENT** | **P0** | Populate all CHI meta-projects, dependencies, research opportunities |
| **Datasette Public Deployment (MVP)** | **January 31** | **[Data Science Student]** | 🔴 **URGENT** | **P0** | Deploy to chosen platform; public read-only access |
| **Basic Documentation (Query Examples)** | **January 31** | **[Data Science Student]** | 🔴 **URGENT** | **P0** | How to query, example searches, API docs |

### Other Spring 2026 Milestones

| Milestone | Target Date | Owner(s) | Status | Blockers |
|-----------|-------------|----------|--------|----------|
| Basic GitHub Actions Sync | March 31 | [To be assigned] | 🟡 In Progress | Public API live |
| CUNY Academic Works Discussion + Planning | February 28 | Dr. Smith (librarian liaison) | 🟡 In Progress | Librarian availability |
| Frontend Wireframes & Data Model | April 15 | [To be assigned] | 🔴 Not started | Public API live |
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
- **🔥 User Access to Projects** — BLOCKED until Datasette deployed (P0)
- **All Layer 3 Execution** — Benefits from Datasette API (not hard blocking)
- **Publishing Workflows** — Depend on CUNY Academic Works + OJS setup

---

## Key Risks & Blockers

- **🔥 NO PUBLIC DATABASE ACCESS (CRITICAL)** — Impact: **BLOCKING** — Mitigation: Prioritize database population + Datasette deployment by end of January; assign owner immediately
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

## Infrastructure Platform Options

**Database Size Considerations:**
- **Current:** ~5-10MB (seed data with basic CHI projects)
- **Year 1 Projected:** 50-100MB (all meta-projects, team members, research outputs, dependencies)
- **Year 3-5 Projected:** 500MB-2GB (historical data, archived projects, full dependency graphs, publications)

**Platform Evaluation (Data Science Student Task):**

| Platform | SQLite Limit | Free Tier | Paid Plans | Performance | Best For |
|----------|--------------|-----------|------------|-------------|----------|
| **Vercel** | 512MB (hobby)<br/>4GB (pro) | 512MB free | $20/mo (4GB) | Good (edge CDN) | Small-medium databases |
| **Fly.io** | Volume-based | 3GB free storage | ~$2-5/mo | Excellent (persistent disk) | Growing databases |
| **Railway** | No hard limit | $5 credit/mo | ~$5-10/mo | Good | SQLite-friendly hosting |
| **AWS RDS/S3** | No limit (S3) | Minimal free tier | $15-50/mo | Excellent (scalable) | Large-scale production |
| **PlanetScale** | MySQL only | Free tier (1GB) | $29/mo | Excellent (serverless) | Requires SQLite → MySQL migration |

**Recommended Approach:**
1. **Phase 1 (MVP - Jan 2026):** Start with **Fly.io free tier** (3GB persistent storage, sufficient for 2-3 years)
2. **Phase 2 (Monitor):** Track database growth monthly; upgrade to paid Fly.io (~$5/mo) if approaching 2GB
3. **Phase 3 (Scale if needed):** If exceeding 4GB, consider AWS S3 + Lambda or migrate to managed PostgreSQL

**Student Deliverable:** Infrastructure evaluation report comparing costs, size limits, deployment complexity, backup strategies, and migration paths.

---

## Team & Coordination

- **Overall Coordinator:** Dr. David B. Smith
- **Database & Infrastructure Lead:** [Data Science Student - To be assigned]
- **API/Backend Lead:** [To be assigned]
- **Frontend Lead:** [To be assigned]
- **Integrations Lead:** [To be assigned]
- **Meeting Schedule:** Weekly CHIIDS standup (Fridays 2pm EST), bi-weekly with CHI leadership
- **Tracking:** [GitHub Projects](https://github.com/CHI-CityTech/META-CHIIDS/projects) + StudentResearch issues
- **Communication:** [Discord/Slack TBD]

---

## Links

- **CHIIDS ARCHITECTURE:** [docs/architecture/architecture.md](../docs/architecture/architecture.md)
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
