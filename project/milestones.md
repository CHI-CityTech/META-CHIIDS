# CHIIDS Development Milestones

## Current Sprint: Bootstrap Phase (Jan 7 - Jan 31, 2026)

---

## Milestone 1: Database & Deployment (Jan 7 - Jan 31)

**Priority:** P0 - Critical Path  
**Owner:** [Data Science Student - TO BE ASSIGNED]

### Week 1 (Jan 7-13)
- [ ] Assign data science student to CHIIDS project
- [ ] Review database schema and requirements
- [ ] Set up local development environment
- [ ] Begin populating database with meta-project data

### Week 2 (Jan 14-20)
- [ ] Complete database population (all CHI meta-projects)
- [ ] Validate relationships and dependencies
- [ ] Document data entry procedures
- [ ] **Deadline:** Database population complete (Jan 20)

### Week 3 (Jan 21-27)
- [ ] Evaluate hosting platforms (Vercel, Fly.io, Railway, AWS)
- [ ] Select deployment platform
- [ ] Configure Datasette for public access
- [ ] Set up CORS and security settings

### Week 4 (Jan 28-31)
- [ ] Deploy Datasette API to production
- [ ] Configure backups
- [ ] Create basic API documentation
- [ ] **Deadline:** Public Datasette deployment (Jan 31)

---

## Milestone 2: Architecture Documentation (Jan 7 - Jan 15)

**Priority:** P0  
**Owner:** Project Lead

### Completed
- [x] Part 1: Operational Management (Layer 0 framework)
- [x] Clarify projection system analogy
- [x] Create /project/ directory structure
- [x] Document META-* Project Class pattern

### In Progress (Jan 8-15)
- [ ] Complete Part 2: Data Infrastructure
  - SQLite design details
  - Datasette configuration
  - Frontend architecture
  - Backup strategy
  
- [ ] Complete Part 3: Public Engagement
  - Publishing pipeline
  - WordPress integration
  - OJS journal setup
  - CUNY Academic Works workflow
  
- [ ] Complete Part 4: External Integration
  - GitHub Actions specifications
  - Zenodo DOI workflow
  - WorldAnvil sync (if applicable)
  - CUNY systems integration
  
- [ ] Complete Part 5: Archival & Preservation
  - Storage strategy
  - Backup schedules
  - Recovery procedures
  - Compliance requirements

---

## Milestone 3: Frontend Development (Feb 1 - Feb 28)

**Priority:** P1  
**Owner:** [Frontend Developer + Data Science Student - TO BE ASSIGNED]

### Week 1 (Feb 1-7)
- [ ] Set up React + Vite project structure
- [ ] Configure TailwindCSS
- [ ] Implement basic routing (React Router v6)
- [ ] Create layout components (Header, Footer)

### Week 2 (Feb 8-14)
- [ ] Connect to Datasette JSON API
- [ ] Build project list page with search
- [ ] Implement filters (domain, type, status)
- [ ] Add pagination

### Week 3 (Feb 15-21)
- [ ] Create project detail pages
- [ ] Display project relationships
- [ ] Show metadata and tags
- [ ] Link to external resources

### Week 4 (Feb 22-28)
- [ ] Implement dependency graph visualization (Recharts)
- [ ] Add interactive filtering
- [ ] Deploy to Vercel/Netlify
- [ ] Test and refine UI

---

## Milestone 4: Integration & Automation (Mar 1 - Mar 31)

**Priority:** P2  
**Owner:** [TO BE ASSIGNED]

### GitHub Actions
- [ ] Schema validation workflow
- [ ] StudentResearch sync automation
- [ ] Report generation
- [ ] Catalog builder

### External Integrations
- [ ] CUNY Academic Works API connection
- [ ] Zenodo DOI workflow
- [ ] WorldAnvil sync setup
- [ ] Zotero bibliography integration

---

## Future Milestones

### Milestone 5: Publishing Pipeline (Apr 2026)
- WordPress integration
- OJS journal setup
- Social media automation
- Public content generation

### Milestone 6: Documentation & Polish (May 2026)
- Complete all documentation
- User guides and tutorials
- API reference
- System maintenance procedures

---

## Team Assignments

### Current Team
- **Project Lead:** [TO BE ASSIGNED]
- **Data Science Student:** [TO BE ASSIGNED] ⚠️ **URGENT**
- **Frontend Developer:** [TO BE ASSIGNED]

### Roles & Responsibilities

**Project Lead:**
- Architecture documentation
- System design decisions
- Integration planning
- Team coordination

**Data Science Student:**
- Database population and validation
- Datasette deployment and configuration
- API documentation
- Backend data management

**Frontend Developer:**
- React application development
- UI/UX design and implementation
- Visualization components
- Frontend deployment

---

## Blockers & Risks

### Critical Blockers
1. ⚠️ **No data science student assigned** (blocks Milestone 1)
2. ⚠️ **Platform evaluation incomplete** (delays deployment)
3. ⚠️ **Database empty** (blocks frontend development)

### Medium Risks
- Frontend developer availability uncertain
- External API access not confirmed (CUNY, Zenodo)
- Documentation completion timeline ambitious

### Mitigation Strategies
- **Immediate:** Assign data science student this week
- **Short-term:** Complete platform evaluation by Jan 14
- **Long-term:** Document all procedures for future maintainers

---

## Success Criteria

### Milestone 1 Success
- ✅ Database contains all CHI meta-projects
- ✅ Datasette API publicly accessible
- ✅ Basic API documentation available
- ✅ Backup system operational

### Milestone 2 Success
- ✅ All 5 architecture parts complete and comprehensive
- ✅ Cross-references accurate
- ✅ META-* Project Class documented

### Future Milestone Success
- Frontend functional and deployed
- Automation running reliably
- Documentation complete and accurate
- System self-sustaining

---

**Last Updated:** January 7, 2026  
**Next Review:** January 14, 2026
