---
project_class: true
layer: 1
meta_project: CHIIDS
---

# CHIIDS Development Roadmap

## Overview

The CHIIDS Development Roadmap charts the path from bootstrap (database, API, core documentation) through production (frontend, automation, integration, and publishing). This roadmap integrates all major objectives: building a meta-project ontology, developing discovery interfaces (both graphical and AI-powered), implementing three-layer integration (meta-projects → semester coordination → execution), automating data flows, and establishing long-term archival and preservation. The roadmap is organized in phases (P0–P3) with clear deadlines, owners, and success metrics. Each phase builds on previous work to create a sustainable system supporting CHI's mission of holistic integration across research, collaboration, and knowledge stewardship.

## Current Status: Bootstrap Phase (P0)

CHIIDS is in critical bootstrap phase, establishing foundational infrastructure for all CHI projects.

---

## P0: Critical Path (Deadline: Jan 31, 2026)

### 0. Data Source & Schema Planning ⚠️ **PREREQUISITE**
**Deadline:** January 15, 2026  
**Owner:** Project Lead + Data Science Student

**Data Source Inventory:**
- [ ] Document all project idea list locations and formats
- [ ] Identify all CHI-CityTech GitHub repos to ingest
- [ ] List external repositories requiring linking
- [ ] Map ROADMAP file locations across all repos
- [ ] Locate proposal storage (Google Docs, repo, etc.) - DECISION NEEDED
- [ ] Define metadata extraction rules per source type

**Schema Extensions:**
- [ ] Add `maturity_level` column (idea/sketch/proposal/active/completed/archived)
- [ ] Add `priority` column (blocker/high/medium/low)
- [ ] Create `proposals` table (title, description, source_url, type, status)
- [ ] Create `project_proposals` junction table
- [ ] Create views for filtering by maturity/priority
- [ ] Document all new schema changes

**Decisions Required:**
- [ ] Where do proposals live? (distributed per-project vs centralized repo)
- [ ] How are ideas submitted? (web form, GitHub issues, Google Docs)
- [ ] Who can create ideas/proposals? (open vs restricted)
- [ ] Approval workflow for promoting ideas → projects

### 1. Database Population & Access ⚠️ **BLOCKER**
**Deadline:** January 20, 2026  
**Owner:** Data Science Student (to be assigned)

**Automated Ingestion Agent:**
- [ ] Build GitHub org scanner to extract repo metadata
- [ ] Parse README.md, project/ROADMAP.md, project/GOVERNANCE.md from each repo
- [ ] Extract project data: name, domain, type, description, lead_contact, repository_url
- [ ] Parse ROADMAP files to identify planned/proposed projects
- [ ] Map project dependencies from documentation
- [ ] Import project ideas from designated ideas location
- [ ] Validate all imported data against schema
- [ ] Handle conflicts/duplicates in merge process
- [ ] Create rollback procedure for bad imports

**Manual Data Entry (if needed):**
- [ ] Define procedure for adding projects not in GitHub
- [ ] Create CSV import format for batch uploads
- [ ] Document approval process before import

**Verification:**
- [ ] Validate schema integrity for all imported data
- [ ] Check dependency relationships are valid
- [ ] Verify all tag references exist
- [ ] Document data quality metrics

**Blockers:**
- No data science student assigned yet
- Proposal storage location not yet decided
- Data source inventory not yet complete

### 2. Datasette Public Deployment ⚠️ **BLOCKER**
**Deadline:** January 31, 2026  
**Owner:** Data Science Student (to be assigned)

- [ ] Evaluate hosting platforms (Vercel vs Fly.io vs Railway vs AWS)
- [ ] Deploy Datasette API with read-only public access
- [ ] Configure CORS for frontend consumption
- [ ] Set up automated backups
- [ ] Create basic API documentation
- [ ] Configure canned queries for common reports
- [ ] Set up monitoring/uptime alerts
- [ ] Document disaster recovery procedures

**Blockers:**
- Platform evaluation not started
- Deployment procedures undefined
- No owner assigned

### 3. Architecture Documentation ✅ IN PROGRESS
**Deadline:** January 15, 2026  
**Status:** Repository structure documented, data layer integrated, Parts 2-5 outlined

- [x] Part 1 / ARCHITECTURE.md: GitHub three-layer repository structure
- [x] Root README: Mission-driven overview with four cornerstones
- [x] Original Spec: Moved to project/architecture with full diagram
- [x] Authority Model: Split into canonical rules (project/) + detailed guide (docs/)
- [x] Data Layer: Database schema, Datasette API, React frontend as Storage + Integration implementation
- [x] Project Activities: Three-layer integration (meta-projects → semester coordination → team work)
- [ ] Complete Part 2: Data Infrastructure (full database documentation, disaster recovery)
- [ ] Complete Part 3: Public Engagement (publishing pipeline, website architecture)
- [ ] Complete Part 4: External Integration (GitHub automation, Zenodo, Zotero, WorldAnvil)
- [ ] Complete Part 5: Archival & Preservation (backup strategy, recovery procedures, compliance)

---

## P1: Frontend & Ideas Pipeline (Feb 2026)

### 4. React Frontend Development ✅ WORKING
**Status:** Connected to Datasette, displaying 14 seed projects
**Owner:** Frontend Developer + Data Science Student

- [x] Build React + Vite frontend
- [x] Connect to Datasette JSON API (with _shape=objects)
- [x] Implement project list with search/filters
- [x] Create project detail pages
- [ ] Add dependency graph visualization (Recharts)
- [ ] Improve styling and UX
- [ ] Deploy to Vercel or Netlify

### 4b. AI Agent: Natural Language Query Interface (NEW)
**Status:** In development by external project team  
**Owner:** AI/ML Team (external)

**Purpose:** Develop conversational AI agent that serves as front-end authority for natural language queries about projects and research integrations.

**Capabilities:**
- [ ] Query CHIIDS database to answer human language questions about projects
- [ ] Understand research integration questions (e.g., "What projects use AR/VR?" "Show me AI-related work")
- [ ] Provide intelligent recommendations for project collaborations
- [ ] Navigate project dependencies and explain relationships
- [ ] Access extended project data (proposals, activity history, team rosters)
- [ ] Generate summaries of project portfolios and research areas

**Integration Points:**
- [ ] Consume Datasette API for project queries
- [ ] Access extended metadata (project_activity, dependencies, proposals)
- [ ] Integrate with React frontend as alternative discovery interface
- [ ] Potentially serve as chatbot/assistant component in main application

**Coordination:**
- [ ] Define API contracts with Datasette (what queries must be fast/reliable)
- [ ] Establish prompt engineering standards for consistency
- [ ] Set up evaluation metrics for query accuracy
- [ ] Plan integration with frontend (embedded vs standalone)
- [ ] Document use cases and example interactions

### 5. Project Ideas Pipeline (P1)
**Owner:** Data Science Student + UX Designer

**Ideas Management:**
- [ ] Add `maturity_level` field to schema (idea/sketch/proposal/active/completed/archived)
- [ ] Build ideas submission form (name, domain, description, tags)
- [ ] Create ideas browser interface (separate from active projects)
- [ ] Filter/search ideas by domain, tags, maturity
- [ ] Show idea status: under_review, approved, rejected, implemented

**Promotion Workflow:**
- [ ] Admin panel to review ideas
- [ ] Approve idea → create project with maturity=proposal
- [ ] Reject idea with reasoning
- [ ] Convert approved idea to GitHub issue in StudentResearch
- [ ] Track lifecycle: idea → proposal → active → completed/archived

**Priority System:**
- [ ] Add `priority` column (blocker/high/medium/low)
- [ ] Display priority in project list
- [ ] Filter by priority
- [ ] Block other projects when dependency is blocker

**Proposals Tracking:**
- [ ] Create proposals table (with source tracking)
- [ ] Link proposals to projects
- [ ] Show proposal status (under_review, approved, implemented)
- [ ] Display proposal documents as external links
- [ ] Extract proposals from ROADMAP files automatically
- [ ] Support manual proposal submission

### 6. Dependency Graph Visualization
**Owner:** Data Science Student

- [ ] Design graph layout algorithm
- [ ] Implement interactive visualization (Recharts or D3)
- [ ] Show primary parents and secondary dependencies
- [ ] Add filtering by domain/type/status/priority
- [ ] Highlight blocker dependencies in red
- [ ] Click to drill into related projects

---

## P2: Integration & Automation (Mar 2026)

### 7. GitHub Integration & Project Hierarchy
**Owner:** Data Science Student + DevOps

**Project Hierarchy Workflow:**
- [ ] Determine if `generate_hierarchy.yml` lives in META-CHIIDS or CHI-CityTech repo
- [ ] Document seed data sourcing (CHI data dump) vs live database transition
- [ ] Plan migration of hierarchy report from static markdown to Datasette view
- [ ] Establish generation schedule (on push, scheduled, manual trigger)

**GitHub Org Scanning:**
- [ ] Scan CHI-CityTech org for all repositories
- [ ] Extract metadata from each repo (README, ROADMAP, etc.)
- [ ] Build reverse-mapping: GitHub repo → CHIIDS project_id
- [ ] Auto-update repository_url field when repos are renamed/moved
- [ ] Handle external repos requiring linking

**StudentResearch Integration:**
- [ ] Organize StudentResearch repository structure
- [ ] Link semester activity to projects
- [ ] Sync team assignments to project_activity table
- [ ] Auto-create/update issue templates for projects

### 8. External System Integration
- [ ] CUNY Academic Works API connection
- [ ] Zenodo DOI assignment workflow
- [ ] WorldAnvil synchronization (if applicable)
- [ ] Zotero bibliography integration (query collections, sync citations)

---

## P3: Publishing & Documentation (Apr 2026)

### 8. Public Engagement Pipeline
- [ ] WordPress integration for public-facing content
- [ ] Open Journal Systems (OJS) for CHI Publications
- [ ] Automated blog post generation from project updates
- [ ] Social media content pipeline

### 9. Documentation Completion
- [ ] Complete all architecture parts (2-5)
- [ ] Create user guides for researchers
- [ ] Write API documentation
- [ ] Document integration procedures

---

## Future Enhancements (Beyond Spring 2026)

### Advanced Features
- Semantic search improvements for AI Agent
- Automated dependency detection from code repositories
- Cross-project analytics dashboard
- Research impact visualization
- Advanced filtering by time-series analysis (project lifecycle tracking)

### Sustainability
- Long-term archival strategy implementation
- Backup automation and monitoring
- Compliance documentation
- Security audit and hardening

---

## Dependencies & Blockers

**Critical Blockers (P0):**
1. ⚠️ Data science student assignment (needed for database population + Datasette deployment)
2. ⚠️ Platform evaluation and decision (Vercel vs Fly.io vs Railway vs AWS for Datasette hosting)
3. ⚠️ Database population with all CHI projects and proposals
4. ⚠️ Production deployment and migration from local SQLite

**P1 Integration Points:**
1. Database must be populated before frontend can display real data
2. Project activities table must be synced with StudentResearch for semester tracking
3. AI Agent project depends on stable Datasette API with documented contracts
4. Dependency graph depends on complete project relationship mapping

**Medium Priority:**
1. Frontend developer availability for React enhancements
2. CUNY Academic Works API access for publication integration
3. Zenodo API credentials for research output archival
4. WorldAnvil API integration specifications

**Low Priority:**
1. Social media automation decisions
2. OJS deployment timeline
3. External repository scanning edge cases

---

## Success Metrics

**Phase P0 (Bootstrap):**
- [ ] Database populated with all CHI projects and proposals
- [ ] Datasette API publicly accessible and documented
- [ ] Architecture documentation complete through Part 2
- [ ] Data layer fully integrated with project activities

**Phase P1 (Frontend & Discovery):**
- [ ] Working frontend deployed with search/filter/details
- [ ] Users can browse and filter projects
- [ ] Dependency graph visualization functional
- [ ] AI Agent can answer natural language queries about projects
- [ ] Ideas pipeline operational

**Phase P2 (Integration & Automation):**
- [ ] GitHub automation running for data synchronization
- [ ] External systems connected (Zenodo, Zotero, CUNY systems)
- [ ] Project activity synced with StudentResearch
- [ ] Data flows automatically across layers

**Phase P3 (Publishing & Sustainability):**
- [ ] Public engagement pipeline operational
- [ ] Documentation comprehensive and maintained
- [ ] System self-sustaining with clear ownership
- [ ] Backup and recovery procedures tested

---

## Integrated Objective Summary

CHIIDS aims to implement a complete meta-project management system with these integrated objectives:

1. **Data Management** (P0): SQLite database capturing project ontology, proposals, activities, and dependencies
2. **Public API** (P0): Datasette providing standardized JSON interface for programmatic access
3. **User Discovery** (P1): React frontend for browsing, searching, and understanding projects
4. **Natural Language Interface** (P1): AI Agent for conversational queries about research integrations
5. **Three-Layer Integration** (P0-P2): Connect meta-project definitions → semester coordination → execution repositories
6. **Automation** (P2): GitHub scanning, data ingestion, and synchronization
7. **External Integration** (P2-P3): Zenodo, Zotero, CUNY systems, WorldAnvil
8. **Publishing** (P3): Public engagement pipeline from project data to public-facing content
9. **Preservation** (P3-P5): Long-term archival, backup, and recovery strategies

All components work together to support CHI's mission of **holistic integration** across diverse projects, participants, and systems.

---

## Notes

This roadmap follows the CHIIDS self-referential model: CHIIDS is experiencing its own Layer 2 (coordination) and Layer 3 (execution) work while simultaneously defining the Layer 0 framework that governs all CHI projects.

**Last Updated:** January 8, 2026

---

## Detailed Specifications (Parts 2–5)

### Part 2: Data Infrastructure (Layer 0 implementation)
- SQLite schema: finalize tables for `projects`, `relationships`, `tags`, `domains`, `repos`, `people`
- Datasette: configure metadata, permissions, canned queries, JSON pagination, CORS
- Frontend: API contracts (endpoints, shapes), search/filter semantics, error handling
- Backups: schedule, retention, encryption, restore runbook; staging vs prod policies
- Performance: indices for dependency queries; view optimizations for common lists

### Part 3: Public Engagement
- Publishing pipeline: source of truth, review gates, auto-publish triggers
- Website: information architecture (IA), navigation, search, accessibility baseline
- OJS (CHI Publications): journal setup, submission workflow, DOI policy integration
- CUNY Academic Works: deposit criteria, metadata mapping, automated export from CHIIDS
- Social: content templates, cadence, governance for announcements and highlights

### Part 4: External Integration
- GitHub: Actions for schema validation, report generation, catalog build; label/taxonomy
- **Project Hierarchy Generation:** Clarify ownership (META-CHIIDS vs CHI-CityTech); document seed data sourcing; plan transition to Datasette view
- Zenodo: DOI minting workflow; metadata mapping from CHIIDS; preservation copies
- WorldAnvil: sync model (authoritative fields vs derived); review/approval flow
- Zotero: group libraries; citation sync; bibliography exports per meta-project; formal integration with CUNY Academic Works and Zenodo
- CUNY systems: OpenLab site structure, Teams/SharePoint document policies, SSO touchpoints

### Part 5: Archival & Preservation
- Storage tiers: active vs archival; cold storage policy; checksum strategy
- Backup windows: daily/weekly/monthly cadence; offsite rotation; restore testing
- Recovery: RTO/RPO targets; disaster drills; dependency rebuild procedures
- Metadata preservation: provenance, file manifests, DOI linkage, catalog snapshots
- Compliance: FERPA/IRB where applicable; audit trails; access controls

---

## Consolidated Blockers (Parts 2–5)
- Owners unassigned for database population and Datasette deployment (P0)
- Hosting platform decision pending (P0): Vercel vs Fly.io vs Railway vs AWS
- External credentials: Zenodo, CUNY Academic Works, OJS, WorldAnvil
- Policy decisions: backup retention, publishing governance, DOI workflows

