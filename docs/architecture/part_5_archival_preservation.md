# Part 5: Archival & Preservation

**Status:** Outline (to be completed)

This document describes long-term data preservation, archival policies, and recovery procedures:

- Active storage vs. archival storage
- Backup targets and schedules
- Data retention policies
- Recovery procedures (RTO/RPO)
- Metadata preservation
- Compliance and audit trails

## Contents

### Storage Strategy

#### Active Storage
- OneDrive/SharePoint for current documents and media
- GitHub for code and version-controlled assets
- SQLite database (replicated to backup targets)

#### Archival Storage
- Completed project packages (reports, media, code, virtual environments)
- Metadata and indexing for retrieval
- Long-term preservation format considerations
- Migration plans for obsolete formats

### Backup Policy

#### Schedule
- Daily automated backups of Layer 1 canonical docs/DB
- Weekly backups of Layer 3 assets and code bundles
- Monthly comprehensive snapshots

#### Targets
- OneDrive/SharePoint (CUNY-managed)
- Fly.io volumes (if using Fly.io for Datasette)
- Archive.org (optional, for maximum permanence)

#### Retention
- 1 year: Daily backups (rolling window)
- 5 years: Monthly snapshots
- Permanent: Layer 1 canonical specs and approved research

### Recovery Procedures

#### Recovery Time Objective (RTO)
- Critical systems (database, API): 4 hours
- Public-facing frontend: 24 hours
- Living archive: 72 hours

#### Recovery Point Objective (RPO)
- Database: 24 hours
- Code: 24 hours
- Media assets: 1 week

#### Testing & Validation
- Monthly backup recovery drills
- Annual full-system recovery test
- Documentation of recovery procedures

### Metadata Preservation

#### What We Preserve
- Project metadata (title, description, authors, dates, keywords)
- Dependency graphs and relationships
- DOI and citation information
- Team assignments and roles
- Milestones and deliverables

#### Format Considerations
- Prefer open, standard formats (JSON, CSV, RDF for metadata)
- Avoid proprietary or deprecated formats
- Include schema documentation with archived data
- Version control for schema changes

### Compliance & Audit

#### Data Governance
- FERPA compliance for student information
- HIPAA considerations (if applicable)
- GDPR and privacy requirements
- Institutional data retention policies

#### Audit Trails
- Version history for all canonical documents (Layer 1)
- Activity logs for Layer 2 coordination (who changed what, when)
- Commit history for all code (Layer 3)
- Access logs for sensitive data

#### Documentation
- Regular audit reports
- Disaster recovery plan documentation
- Policy updates and change logs

---

**See also:** [Part 1: Operational Management](part_1_operational_management.md) | [Part 2: Data Infrastructure](part_2_data_infrastructure.md) | [Part 3: Public Engagement](part_3_public_engagement.md) | [Part 4: External Integration](part_4_external_integration.md)
