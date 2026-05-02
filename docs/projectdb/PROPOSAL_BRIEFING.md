# CHIIDS Project Proposals & Engineering Documents - Agent Briefing

This document provides structured briefings for three critical CHIIDS infrastructure projects. Use these outlines to generate formal proposals and engineering documents.

**Context:** CHIIDS is the CHI Integrated Digital System - a meta-project coordination framework for all CHI (Combinative Human Intelligence) research initiatives at CUNY.

---

## Project 1: Data Source & Schema Planning

**Priority:** P0 - Prerequisite (blocks all data population work)  
**Timeline:** 1-2 weeks  
**Effort:** Low (planning/analysis, minimal coding)  
**Target Audience:** Project leadership, data stewards

### Current State
- CHIIDS database schema exists with tables for projects, dependencies, tags
- 14 seed projects loaded for testing
- Real CHI project data scattered across multiple sources (GitHub repos, Google Docs, ROADMAP files)
- No unified data ingestion strategy defined
- Proposals storage location undecided

### Proposal Should Address
1. **Data Source Inventory** - Where does CHI project data live?
   - CHI-CityTech GitHub organization repos (README.md, project/ files, ROADMAP.md)
   - External GitHub repositories requiring linking
   - Project idea lists (locations TBD - Google Docs? Shared folders?)
   - Proposal documents (distributed? centralized? TBD)
   - Interview/feedback documents (stored where?)

2. **Schema Extensions Needed**
   - `maturity_level` column: idea/sketch/proposal/active/completed/archived
   - `priority` column: blocker/high/medium/low
   - `proposals` table: for tracking proposals separately
   - `project_proposals` junction table: link projects to proposals
   - Views/indexes for filtering by new fields

3. **Critical Decisions to Document**
   - Where should proposals live? (Option A: distributed in project repos; Option B: centralized proposals repo; Option C: hybrid with proposals subsection)
   - How are ideas submitted? (Web form? GitHub issues? Google Form?)
   - Who can create ideas/proposals? (Open to all? Restricted?)
   - What's the promotion workflow? (idea → proposal → active project)
   - What metadata fields are required for ideas vs full projects?

4. **Data Extraction Rules** (per source type)
   - GitHub README parsing rules (which fields map to what)
   - ROADMAP.md parsing rules (extract planned projects, dependencies)
   - Project class files parsing (project/ directory YAML frontmatter)
   - External repo linking strategy (metadata needed)
   - Conflict resolution rules (duplicate detection, merge logic)

### Engineering Document Should Cover
1. SQL migrations for schema changes
2. Data extraction/transformation logic (pseudocode or SQL)
3. Validation rules for imported data
4. Rollback/recovery procedures
5. Testing strategy (sample data, edge cases)
6. Data quality metrics/reporting

---

## Project 2: Automated Data Ingestion Agent

**Priority:** P0 - Critical path blocker  
**Timeline:** 3-4 weeks  
**Effort:** Medium-High (substantial Python development)  
**Target Audience:** Data engineering team, DevOps

### Current State
- Schema ready and tested
- Manual seed data loaded (14 projects)
- GitHub org accessible but not systematically scanned
- No automated proposal/idea ingestion mechanism
- Multiple scattered data sources not yet integrated

### Proposal Should Address
1. **Agent Architecture & Components**
   - GitHub org scanner (enumerate repos, read metadata)
   - README.md parser (extract project info, description, lead_contact)
   - ROADMAP.md parser (extract planned projects, priorities, dependencies)
   - Project class files parser (parse YAML frontmatter, extract metadata)
   - Proposal/ideas parser (extract from designated storage)
   - Validation engine (schema compliance, reference integrity)
   - Conflict resolution engine (detect/merge duplicates)
   - Database loader (transaction handling, rollback capability)

2. **Data Sources to Integrate**
   - CHI-CityTech GitHub org: all repositories
   - External repositories: (list TBD)
   - Project idea sources: (locations TBD)
   - Proposal sources: (location TBD)
   - ROADMAP files across all repos

3. **Processing Pipeline**
   - Discovery phase: enumerate sources
   - Extraction phase: parse each source type
   - Normalization phase: standardize format
   - Validation phase: check schema compliance
   - Deduplication phase: detect/resolve conflicts
   - Load phase: atomic database transaction
   - Reporting phase: quality metrics, error summary

4. **Error Handling & Recovery**
   - Handle network failures gracefully
   - Provide detailed error logs with context
   - Support rollback to pre-import state
   - Generate conflict/warning reports
   - Retry logic for transient failures

### Engineering Document Should Cover
1. **System Design**
   - Component architecture (classes/modules)
   - Data flow diagram
   - External API dependencies (GitHub API, etc.)
   - Rate limiting strategy
   - Caching/optimization considerations

2. **Implementation Details**
   - Python packages used (PyGithub? requests? pandas?)
   - Configuration file format (for data sources, parsing rules)
   - Database transaction handling
   - Logging strategy
   - Progress reporting/status updates

3. **Testing Strategy**
   - Unit tests for each parser
   - Integration tests (end-to-end)
   - Rollback testing
   - Performance benchmarks
   - Edge case handling (special characters, missing fields, circular deps)

4. **Deployment & Operations**
   - CLI command structure
   - Environment configuration (API tokens, database credentials)
   - Dry-run mode (preview changes without committing)
   - Scheduling/automation (GitHub Actions workflow)
   - Monitoring and alerting

5. **Maintenance Procedures**
   - How to add new data sources
   - How to update parsing rules
   - How to handle schema changes
   - Data quality monitoring
   - Rollback procedures

---

## Project 3: Datasette Public Deployment

**Priority:** P0 - Infrastructure enabler  
**Timeline:** 2-3 weeks  
**Effort:** Medium (infrastructure, documentation)  
**Target Audience:** DevOps, systems architecture team

### Current State
- Datasette working locally (port 8001 with --cors)
- React frontend successfully consuming JSON API
- No public deployment infrastructure
- Platform choice not yet evaluated
- Backup/monitoring not configured

### Proposal Should Address
1. **Platform Evaluation**
   - Compare: Vercel vs Fly.io vs Railway vs AWS Lambda
   - Criteria: cost, scalability, ease of deployment, monitoring, backup support
   - Recommendation with justification
   - Migration path from local to public

2. **Deployment Architecture**
   - Datasette instance configuration
   - Read-only access enforcement
   - CORS headers (allow frontend domain)
   - SSL/TLS certificates
   - Domain/DNS setup
   - Load balancing (if needed)

3. **Operational Requirements**
   - Automated backups (frequency, retention, off-site storage)
   - Monitoring/alerting (uptime, error rates, response times)
   - Logging strategy
   - Disaster recovery procedures (RTO/RPO targets)
   - Access control (who can deploy, view logs, etc.)

4. **Frontend Integration**
   - Datasette URL configuration (environment variables)
   - CORS allowlisting
   - Error handling for API failures
   - Fallback behavior (graceful degradation)

5. **API Documentation**
   - Public endpoint documentation (Swagger/OpenAPI)
   - Query examples for common use cases
   - Rate limiting policy
   - Authentication (if future requirement)
   - Terms of service for public API

### Engineering Document Should Cover
1. **Deployment Procedures**
   - Step-by-step deployment to chosen platform
   - Configuration management (secrets, environment variables)
   - Database seeding/initialization
   - Verification checklist

2. **Infrastructure as Code**
   - Terraform or equivalent (if applicable)
   - GitHub Actions deployment workflow
   - Automated testing before deployment
   - Rollback procedures

3. **Monitoring & Operations**
   - Prometheus/CloudWatch metrics to track
   - Alert thresholds and escalation
   - Log aggregation strategy
   - Incident response playbook

4. **Backup & Recovery**
   - Backup automation script/workflow
   - Backup validation procedures
   - Recovery time estimates
   - Disaster recovery drill schedule

5. **Security Considerations**
   - Read-only database access
   - API rate limiting
   - DDoS mitigation
   - Data privacy/FERPA compliance (if applicable)
   - Audit logging

6. **Performance Optimization**
   - Database indexing strategy
   - Canned queries for common searches
   - Caching strategy (if applicable)
   - Connection pooling
   - Load testing results

---

## Template Structure for Agent

When generating proposals and engineering documents, follow this structure:

### PROPOSAL DOCUMENT
```
1. Executive Summary (1 page)
   - What problem does this solve?
   - Expected impact
   - Timeline and cost

2. Background & Context (1-2 pages)
   - Current state (what exists)
   - Gaps/challenges
   - Why this matters

3. Scope & Objectives (1-2 pages)
   - What is included
   - What is out of scope
   - Success criteria

4. Approach (2-3 pages)
   - High-level technical strategy
   - Key components/phases
   - Dependencies and risks

5. Resource Requirements
   - Team roles/skills needed
   - Budget estimate (if applicable)
   - Timeline milestones

6. Risk Mitigation
   - Technical risks
   - Resource risks
   - Mitigation strategies

7. Next Steps
   - Approval process
   - When to start
   - First phase deliverables
```

### ENGINEERING DOCUMENT
```
1. System Architecture
   - Component diagram
   - Data flows
   - External dependencies

2. Detailed Design
   - APIs/interfaces
   - Data schema
   - Algorithm/process descriptions
   - Security considerations

3. Implementation Plan
   - Phased breakdown
   - Technology choices
   - Development environment setup
   - Build/test procedures

4. Testing Strategy
   - Unit test coverage
   - Integration tests
   - Performance/load testing
   - Acceptance criteria

5. Deployment Plan
   - Environment setup
   - Deployment steps
   - Configuration management
   - Rollback procedures

6. Operations & Maintenance
   - Monitoring/observability
   - Logging/debugging
   - Common issues and solutions
   - Upgrade procedures

7. Documentation
   - API documentation
   - User guides (if applicable)
   - Administrator runbooks
   - Troubleshooting guides
```

---

## Context Documents for Agent

Provide this briefing along with:
1. [DEVELOPMENT.md](../DEVELOPMENT.md) - Current local setup
2. [project/ROADMAP.md](../project/ROADMAP.md) - Full timeline and dependencies
3. [docs/architecture/part_4_external_integration.md](../docs/architecture/part_4_external_integration.md) - Integration architecture
4. Database schema: `database/schema/schema.sql`
5. Frontend code: `frontend/src/services/api.js` (current API integration)

---

## Deliverables Checklist

For each project, the agent should produce:

**Project 1 - Data Source & Schema Planning:**
- [ ] Proposal document (3-5 pages)
- [ ] Engineering document with SQL migrations (4-6 pages)
- [ ] Data extraction rules spreadsheet
- [ ] Decision matrix for proposals storage location
- [ ] Sample SQL migration files

**Project 2 - Data Ingestion Agent:**
- [ ] Proposal document (4-6 pages)
- [ ] Engineering document with architecture diagrams (6-8 pages)
- [ ] Python pseudocode/outline for ingestion script
- [ ] Test case scenarios
- [ ] Configuration file templates
- [ ] Sample GitHub Actions workflow

**Project 3 - Datasette Deployment:**
- [ ] Proposal document with platform comparison (5-7 pages)
- [ ] Engineering document with deployment procedures (6-8 pages)
- [ ] Infrastructure as Code templates (Terraform/YAML)
- [ ] Monitoring/alerting configuration
- [ ] API documentation template
- [ ] Disaster recovery procedures

---

## Instructions for Using This Briefing

1. **For Proposal Agent:** Use sections "Proposal Should Address" as requirements
2. **For Engineering Agent:** Use sections "Engineering Document Should Cover" as outline
3. **Cross-reference:** Link to ROADMAP for timeline context
4. **Iterate:** If proposals identify new requirements, update ROADMAP accordingly
5. **Integration:** Documents should reference each other (proposals link to engineering docs)

---

**Generated:** January 8, 2026  
**Status:** Ready for agent processing  
**Next Step:** Assign to appropriate agent, provide this document + context files
