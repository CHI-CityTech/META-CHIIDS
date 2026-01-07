---
project_class: true
layer: 1
meta_project: CHIIDS
---

# CHIIDS Development Roadmap

## Current Status: Bootstrap Phase (P0)

CHIIDS is in critical bootstrap phase, establishing foundational infrastructure for all CHI projects.

---

## P0: Critical Path (Deadline: Jan 31, 2026)

### 1. Database Population & Access ⚠️ **BLOCKER**
**Deadline:** January 20, 2026  
**Owner:** Data Science Student (to be assigned)

- [ ] Populate SQLite database with all CHI meta-projects
- [ ] Add project relationships, dependencies, and tags
- [ ] Validate schema integrity
- [ ] Document data entry procedures

**Blockers:**
- No data science student assigned yet
- Database currently empty except seed data

### 2. Datasette Public Deployment ⚠️ **BLOCKER**
**Deadline:** January 31, 2026  
**Owner:** Data Science Student (to be assigned)

- [ ] Evaluate hosting platforms (Vercel vs Fly.io vs Railway vs AWS)
- [ ] Deploy Datasette API with read-only public access
- [ ] Configure CORS for frontend consumption
- [ ] Set up automated backups
- [ ] Create basic API documentation

**Blockers:**
- Platform evaluation not started
- Deployment procedures undefined
- No owner assigned

### 3. Architecture Documentation ✅ IN PROGRESS
**Deadline:** January 15, 2026  
**Status:** Part 1 complete, Parts 2-5 outlined

- [x] Part 1: Operational Management (Layer 0 + Layers 1-3)
- [x] Clarify projection system analogy
- [ ] Complete Part 2: Data Infrastructure
- [ ] Complete Part 3: Public Engagement
- [ ] Complete Part 4: External Integration
- [ ] Complete Part 5: Archival & Preservation

---

## P1: Frontend & Visualization (Feb 2026)

### 4. React Frontend Development
**Owner:** Data Science Student + Frontend Developer

- [ ] Build React + Vite frontend
- [ ] Connect to Datasette JSON API
- [ ] Implement project list with search/filters
- [ ] Create project detail pages
- [ ] Add dependency graph visualization (Recharts)
- [ ] Deploy to Vercel or Netlify

### 5. Dependency Graph Visualization
**Owner:** Data Science Student

- [ ] Design graph layout algorithm
- [ ] Implement interactive visualization
- [ ] Show primary parents and secondary dependencies
- [ ] Add filtering by domain/type/status

---

## P2: Integration & Automation (Mar 2026)

### 6. GitHub Integration
- [ ] GitHub Actions for schema validation
- [ ] Auto-sync StudentResearch data
- [ ] Generate project reports
- [ ] Build catalog from metadata

### 7. External System Integration
- [ ] CUNY Academic Works API connection
- [ ] Zenodo DOI assignment workflow
- [ ] WorldAnvil synchronization (if applicable)
- [ ] Zotero bibliography integration

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
- Natural language search (semantic search across projects)
- AI-assisted project recommendation
- Automated dependency detection
- Cross-project analytics dashboard
- Research impact visualization

### Sustainability
- Long-term archival strategy implementation
- Backup automation and monitoring
- Compliance documentation
- Security audit and hardening

---

## Dependencies & Blockers

**Critical Blockers (P0):**
1. ⚠️ Data science student assignment (needed for database + deployment)
2. ⚠️ Platform evaluation and decision
3. ⚠️ Database population with project data

**Medium Priority:**
1. Frontend developer availability
2. CUNY Academic Works API access
3. Zenodo API credentials

**Low Priority:**
1. WorldAnvil integration specifications
2. Social media automation decisions

---

## Success Metrics

**Phase P0 (Bootstrap):**
- [ ] Database populated with all projects
- [ ] Datasette API publicly accessible
- [ ] Basic documentation complete

**Phase P1 (Frontend):**
- [ ] Working frontend deployed
- [ ] Users can browse and search projects
- [ ] Dependency graph functional

**Phase P2 (Integration):**
- [ ] GitHub automation running
- [ ] External systems connected
- [ ] Data flows automatically

**Phase P3 (Publishing):**
- [ ] Public engagement pipeline operational
- [ ] Documentation comprehensive
- [ ] System self-sustaining

---

## Notes

This roadmap follows the CHIIDS self-referential model: CHIIDS is experiencing its own Layer 2 (coordination) and Layer 3 (execution) work while simultaneously defining the Layer 0 framework that governs all CHI projects.

**Last Updated:** January 7, 2026

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
- Zenodo: DOI minting workflow; metadata mapping from CHIIDS; preservation copies
- WorldAnvil: sync model (authoritative fields vs derived); review/approval flow
- Zotero: group libraries; citation sync; bibliography exports per meta-project
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

