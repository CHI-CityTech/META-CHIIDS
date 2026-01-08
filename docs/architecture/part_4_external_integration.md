# Part 4: External Integration

**Status:** Outline (to be completed)

This document describes how CHIIDS integrates with external systems and platforms, and clarifies the boundary between internal CHIIDS components and external integrations.

## CHIIDS Internal Components

### Version Control & Collaboration
- **GitHub Organization (chi-projects):** Central repository for all meta-project repositories and StudentResearch coordination
  - CHI-CityTech, CHI-WorldAnvil, and other Layer 1 meta-project repositories
  - StudentResearch repository (for tracking student research work)
  - GitHub Actions for automation and deployment

### Data Infrastructure
- **SQLite Database:** Project ontology, research opportunities, team/student metadata, proposals, milestones
- **Datasette API:** Read-only public endpoints for data access
- **React Frontend (Vite):** Web application for browsing, searching, filtering, and dependency visualization

### Bibliography & Reference System
- **Zotero Collections/Libraries:** Formal CHIIDS bibliographic management and tag-based information organization
  - Multiple integrated collections for different project domains
  - Serves as internal reference hub
  - Can link to both CUNY Academic Works and Zenodo deposits

### Automation & Scripts
- **Python CLI Tools:** Data management and integration workflows
- **GitHub Actions:** Deployment, testing, and data synchronization

---

## External System Integrations

### Academic/Institutional Archival
- **CUNY Academic Works:** Primary institutional repository for CUNY-based research outputs
  - Serves as archival destination for research emerging from CUNY infrastructure
  - Integrated via Zotero references

- **Zenodo:** International open-access repository for CHI Hub projects developed outside CUNY infrastructure
  - Provides DOI assignment and long-term preservation
  - Target for external CHI Hub outputs
  - Integrated via Zotero references

### Public Engagement & World-Building
- **WorldAnvil:** Fictive universe world-building platform
  - Public-facing collaborative space for narrative and setting documentation
  - Separate from technical CHIIDS infrastructure

### Researcher Workflow Integration
- **CHI-OpenLab Integration:** Connection between CUNY OpenLab platform and WordPress-based frontend
  - Planned integration point
  - Status: In development

- **Google Suite (Docs, Sheets, Drive):** Researcher tools for daily workflow
  - Currently used by researchers for collaboration and documentation
  - Integration strategy: TBD
  - Decision: Internal vs. external classification pending further discussion

---

## Integration Principles

1. **Zotero as Reference Hub:** All external integrations that produce citable outputs (CUNY Academic Works, Zenodo) are discoverable and referenceable through CHIIDS Zotero collections.

2. **Scope-Based Archival:**
   - CUNY-based research → CUNY Academic Works (primary)
   - External CHI Hubs → Zenodo (supplementary/international)

3. **Researcher-Centric Design:** Integration decisions consider how researchers currently work and maintain their workflows.

---

**See also:** [Part 1: Operational Management](part_1_operational_management.md) | [Part 2: Data Infrastructure](part_2_data_infrastructure.md) | [Part 3: Public Engagement](part_3_public_engagement.md) | [Part 5: Archival & Preservation](part_5_archival_preservation.md)
