---
project_class: true
layer: 1
meta_project: CHIIDS
---

# CHIIDS Meta-Project Governance

## Decision-Making

- Roles: Maintainers (approve and merge), Contributors (propose changes), Reviewers (perform PR review)
- Approvals: At least one maintainer approval required for merges; sensitive changes (schema/ontology) require two approvals
- Reviews: Use PR review with checklist for schema integrity, migration safety, and documentation updates

## Contribution Guidelines

- Propose: Open an issue with scope, impact, and migration notes; link to ROADMAP item or MILESTONE when relevant
- Implement: Branch from `refactor/repo-structure` (until merged), keep changes small and tested, include doc updates
- Submit: Open PR with summary, test notes, and backward-compatibility statement; request a maintainer review

## Meetings & Cadence

- Weekly sync: Review blockers, upcoming milestones, and deployment status (Datasette/public registry)
- Monthly planning: Update ROADMAP phases and MILESTONES dates; assign owners for P0/P1 items
- Ad hoc: Schema-breaking proposals get a dedicated review session before implementation

## Repository Placement Decisions

### Grant Solicitations and Grant Development

- `CHI-Grants` is the operational home for grant solicitations, sponsor guidance, deadlines, budget drafts, application checklists, and shared grant-writing materials
- `META-CHIIDS` is the canonical registry for proposal metadata, project linkages, and lifecycle status
- Individual project repositories may link to a solicitation or proposal, but they are not the authoritative home for cross-project grant materials
- Create a standalone project repository only when a solicitation results in an active funded project that needs its own execution space for code, assets, documentation, or team workflow

### Review Expectations

- New grant opportunities affecting multiple projects should be recorded in `CHI-Grants` and linked from the relevant CHIIDS proposal or project record
- Promotion from grant opportunity to active project should update CHIIDS lifecycle tracking before substantial execution work begins in a project repository
