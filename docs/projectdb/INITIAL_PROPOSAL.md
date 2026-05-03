# Initial Proposal

## Proposal Metadata

- Proposal title: Development of CHI Relational Research Project Database Backend
- Proposal type: Original initial proposal
- Researcher: Hosain Ali
- Organization: Center for Holistic Integration (CHI), New York City College of Technology, CUNY
- Project context: CHI Integrated Digital System (CHIIDS) meta-project
- Proposal term: Spring 2026
- Version: v0.1 (initial reconciliation draft)

## Statement of Work Reconciliation

This document is the initial proposal baseline for the CHI Relational Research Project Database Backend.
It reconciles the original Statement of Work provided by project stakeholders with current CHIIDS planning artifacts in this repository.

Primary sources used:

- Original SoW text provided by project leadership (May 2026)
- [PROPOSAL_BRIEFING.md](PROPOSAL_BRIEFING.md)
- [CHI repository reference](../reference/CHI-repositories-2026s.md)
- Zoom working notes: https://docs.zoom.us/doc/q2IJTAKORDuyHCsQvSzNUg

## 1. Project Overview

This project establishes the authoritative relational backend for CHI research projects.
The backend will store, normalize, and expose structured information about CHI initiatives in a searchable, versioned data environment.

The backend is designed to support integration with an independently developed agentic interface.
This proposal and scope cover backend infrastructure only.

The system must:

1. Automatically ingest project information from existing approved sources.
2. Normalize and deduplicate records.
3. Maintain provenance and version history.
4. Expose a stable documented API for external agent integration.

Out of scope:

- Development of the agentic frontend.

## 2. Objectives

1. Design a normalized relational schema for CHI projects and related entities.
2. Build an automated ingestion pipeline that updates project records from approved sources.
3. Implement non-destructive lifecycle tracking.
4. Provide a versioned REST API for deterministic structured queries.
5. Publish an Agent Integration Contract defining allowed interaction patterns.

## 3. Scope of Work

### 3.1 System Architecture

The backend shall include four layers.

#### A. Database Layer

- SQLite initial implementation with migration path documented.
- Normalized schema with stable primary keys.
- Foreign key constraints enforced.
- History or changelog support for state transitions.

#### B. Ingestion Layer

- Modular source connectors.
- Extraction logic for structured and semi-structured documents.
- Extraction event logging.
- Scheduled or trigger-based update operation.

#### C. Resolution Layer

- Deterministic normalization rules.
- Duplicate detection logic.
- Merge flagging and review support.
- Canonical record promotion rules.

#### D. API Layer

- RESTful JSON API.
- Filtering, pagination, and sorting.
- Version endpoint and capabilities endpoint.
- Full-text search support if feasible within schedule.

## 4. Data Model Requirements

Minimum required core tables:

1. Projects
2. People
3. Project_People
4. Artifacts
5. Extraction_Events
6. Project_History

### 4.1 Projects

- project_id (stable, non-derivable identifier)
- title
- abstract
- status (active or paused or retired)
- start_date
- end_date
- primary_domain
- created_at
- updated_at

### 4.2 People

- person_id
- name
- affiliation

### 4.3 Project_People

- project_id
- person_id
- role
- start_date
- end_date

### 4.4 Artifacts

- artifact_id
- project_id (nullable until resolved)
- source_type
- source_location
- ingestion_timestamp

### 4.5 Extraction_Events

- extraction_id
- artifact_id
- field_name
- candidate_value
- confidence_score
- extractor_version
- extraction_timestamp

### 4.6 Project_History

- history_id
- project_id
- field_changed
- previous_value
- new_value
- change_timestamp

The schema must include a formal data dictionary.

## 5. Ingestion Specifications

Automated ingestion must support at least two high-yield source types in the initial implementation:

1. GitHub repositories (README, metadata, and optionally issues)
2. Structured Markdown documents

Each ingestion cycle must:

1. Register artifact.
2. Extract candidate fields.
3. Log extraction events.
4. Apply deterministic normalization.
5. Promote validated values to canonical tables.

Canonical records must not be overwritten without preserving prior state in Project_History.

## 6. API Specifications

Minimum required read endpoints:

- GET /projects
- GET /projects/{project_id}
- GET /people
- GET /search
- GET /version
- GET /capabilities

Behavior requirements:

- Deterministic pagination.
- Stable project_id references.
- Structured filtering (status, year, tag, collaborator).
- Clear error codes.
- Documented JSON schema.
- Read-only operation for initial release.

## 7. Integration Contract

The backend must publish an Agent Integration Contract with:

- Allowed operations.
- Prohibited behaviors.
- Provenance obligations.
- Versioning requirements.
- Security and visibility rules.

The agent layer must treat this backend as authoritative.

## 8. Deliverables

1. Implemented relational schema.
2. Working ingestion pipeline for at least two data sources.
3. Duplicate detection and normalization module.
4. Documented REST API.
5. Integration contract document.
6. Technical documentation.
7. Demonstration dataset and reproducible build instructions.

## 9. Milestone Plan (12 to 14 Weeks)

1. Weeks 1 to 2: source audit and schema proposal, review and approval.
2. Weeks 3 to 4: database implementation and data dictionary completion.
3. Weeks 5 to 7: ingestion connector development and extraction logging.
4. Weeks 8 to 9: resolution and duplicate handling module.
5. Weeks 10 to 11: API implementation and documentation.
6. Weeks 12 to 13: integration testing with external agent collaborator.
7. Week 14: final documentation and demonstration.

## 10. Out of Scope

- Conversational or agentic frontend development.
- User-facing curation workflow implementation.
- Manual legacy backfill beyond validation.
- Large-scale ontology engineering.

## 11. Success Criteria

1. Database reliably reflects current project state.
2. New projects are automatically detected and ingested.
3. Retired projects remain preserved and labeled.
4. External agent queries are deterministic.
5. Schema and API documentation are complete and versioned.

## 12. Governance and Maintenance

- Schema versioning policy defined.
- API versioning policy documented.
- Update schedule defined.
- Backup strategy documented.

This backend is intended as the long-term canonical CHI research data layer and must remain clear, maintainable, and extensible.

## Reconciliation Notes for CHIIDS Current Planning

The original SoW uses project status values active, paused, retired.
Current planning docs also track broader maturity progression (idea, sketch, proposal, active, completed, archived).

To reconcile both:

1. Retain status as the operational state field for API filtering and lifecycle control.
2. Introduce maturity_level as a planning and portfolio field in schema extensions.
3. Keep both fields explicit in the data dictionary to avoid semantic overlap.

Additional alignment with ongoing planning:

- Include provenance requirements for AI-assisted extraction runs.
- Preserve deterministic behavior for ingestion and conflict resolution.
- Keep API read-only by default for early integration stability.