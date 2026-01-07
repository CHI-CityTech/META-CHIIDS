# Part 2: Data Infrastructure

**Status:** Outline (to be completed)

This document describes the technical infrastructure that supports CHIIDS operations:

- SQLite database schema and design
- Datasette API deployment and configuration
- Frontend application (React/Vite)
- Data flow between layers
- Backup and recovery systems

## Contents

### SQLite Database Design
- Project ontology schema
- Research opportunities dataset
- Team and student metadata
- Proposal and milestone tracking
- Integration with external systems

### Datasette API
- Read-only public endpoints
- Query examples
- Performance considerations
- Deployment targets (Vercel, Fly.io, Railway, AWS)

### Frontend Application
- Technology stack (React 18, Vite 5, TailwindCSS)
- Features (search, browse, filter, dependency visualization)
- Data fetching from Datasette
- Deployment and hosting

### Backup & Recovery
- Backup targets (OneDrive/SharePoint, Fly.io volumes)
- Backup frequency and retention policy
- Recovery procedures and RTO/RPO targets
- Testing and validation

---

**See also:** [Part 1: Operational Management](part_1_operational_management.md) | [Part 3: Public Engagement](part_3_public_engagement.md) | [Part 4: External Integration](part_4_external_integration.md) | [Part 5: Archival & Preservation](part_5_archival_preservation.md)
