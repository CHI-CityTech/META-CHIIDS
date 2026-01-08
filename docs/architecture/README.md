# CHIIDS Architecture Documentation

## Purpose of This Folder

This folder contains the **normative architectural specifications** for **CHIIDS (CHI Integrated Digital System)**.

The architecture is organized in **five interconnected parts**, each addressing a different aspect of the system:

1. **[Part 1: Operational Management](part_1_operational_management.md)** — Internal structure (three layers)
2. **[Part 2: Data Infrastructure](part_2_data_infrastructure.md)** — Technical systems (database, API, frontend, backups)
3. **[Part 3: Public Engagement](part_3_public_engagement.md)** — Publishing and public-facing features
4. **[Part 4: External Integration](part_4_external_integration.md)** — Connections to external systems and organizations
5. **[Part 5: Archival & Preservation](part_5_archival_preservation.md)** — Long-term storage and recovery

**Start here:** If you're new to CHIIDS, read **[Part 1](part_1_operational_management.md)** first to understand the three-layer operational model. Then explore the other parts based on what you need to know.

---

## Scope of "Architecture" in CHIIDS

In CHIIDS, *architecture* refers to:

- system layering and responsibility boundaries  
- canonical vs. derived data  
- authority and governance of structure  
- preservation of continuity across semesters  
- integration with external systems and organizations

It does **not** refer to:

- UI or presentation design  
- code style or implementation details  
- semester-specific workflows  
- individual project behavior  

---

## The Five Parts Explained

### Part 1: Operational Management
**System-Level Architecture**

Defines:
- the three-layer CHIIDS model (Meta-Projects, Coordination, Execution)
- where canonical proposals live  
- the role of StudentResearch as coordination hub
- how execution repositories accumulate work over time
- CHIIDS as a self-referential meta-project

This document answers:
> *How is CHIIDS structured as a system? Who owns what? How do the layers work together?*

**Audience:** Project managers, coordinators, anyone understanding CHI's organizational structure

---

### Part 2: Data Infrastructure
**Technical Systems**

Describes:
- SQLite database schema and project ontology
- Datasette API for public querying
- Frontend application (React/Vite)
- Data flow and synchronization
- Backup and recovery systems

This document answers:
> *How is data stored, accessed, and backed up? What are the technical systems?*

**Audience:** Developers, database admins, infrastructure engineers

---

### Part 3: Public Engagement & Publishing
**Publishing Pipeline**

Covers:
- Publishing workflow (Layer 3 → Layer 2 curation → Public)
- Website and content management (OpenLab, WordPress)
- Social media strategy (Buffer)
- CUNY Academic Works integration
- Academic journal (OJS) and DOI issuance

This document answers:
> *How do CHIIDS projects share work publicly? How are research outputs preserved?*

**Audience:** Communications team, faculty, librarians, publishers

---

### Part 4: External Integration
**Connections Beyond CHIIDS**

Details:
- GitHub workflows and automation
- Zenodo for research output archival
- WorldAnvil for virtual worlds
- Zotero for bibliography
- CUNY systems (CIS, OpenLab, Teams, SharePoint)
- API specifications and data exchange

This document answers:
> *How does CHIIDS connect to external tools and organizations?*

**Audience:** Systems integrators, external partners, IT teams

---

### Part 5: Archival & Preservation
**Long-Term Storage**

Specifies:
- Active storage vs. archival storage
- Backup targets, schedules, and retention
- Recovery procedures (RTO/RPO)
- Metadata preservation
- Compliance and audit trails

This document answers:
> *How do we ensure CHIIDS data survives long-term? What's our backup and recovery strategy?*

**Audience:** System administrators, compliance officers, archivists

---

## Navigation

**If you're looking for...**

| You want to know... | See... |
|---|---|
| How is CHIIDS organized? | [Part 1: Operational Management](part_1_operational_management.md) |
| Where is data stored? How is it backed up? | [Part 2: Data Infrastructure](part_2_data_infrastructure.md) |
| How do we publish research? | [Part 3: Public Engagement](part_3_public_engagement.md) |
| How does CHIIDS integrate with other systems? | [Part 4: External Integration](part_4_external_integration.md) |
| How do we preserve CHIIDS data long-term? | [Part 5: Archival & Preservation](part_5_archival_preservation.md) |
| Three-layer model details | [Part 1: Operational Management](part_1_operational_management.md#the-three-layers) |
| StudentResearch structure | [Part 1: Operational Management](part_1_operational_management.md#layer-2-research-coordination-layer-persistent-semester-updated) |
| Meta-project proposals | [CHI-CityTech GitHub](https://github.com/CHI-CityTech) |
| Semester activity and project assignments | [StudentResearch GitHub](https://github.com/CHI-CityTech/StudentResearch) |

---

## Consistency Rules

If there is ever a conflict between documentation elsewhere in the repository and documents in this folder, **the documents in this folder take precedence**.

These are the normative architectural specifications. They define the "correct" structure. All meta-projects, team repositories, and semester workflows should align with these principles.

---

## Related Documents

- **[glossary.md](../reference/glossary.md)** — Definitions of key terms (BBS, BRPS, BSP, meta-project, etc.)
- **[ecosystem.md](../reference/ecosystem.md)** — Current state of all CHI meta-projects
- **[integration_paths.md](../reference/integration_paths.md)** — Detailed integration workflows (GitHub, WorldAnvil, etc.)
- **[ROADMAP.md](../../project/ROADMAP.md)** — CHIIDS development status and roadmap (canonical)
 - **[chiids_original_spec.md](../../project/architecture/chiids_original_spec.md)** — Original September 2024 engineering specification (historical, also [PDF](../../project/architecture/chiids_original_spec_2024_09_21.pdf))
- **[project_hierarchy.md](project_hierarchy.md)** — Auto-generated visualization of project dependencies
