project_class: true
layer: 1
meta_project: CHIIDS
canonical: true
---

# META-CHIIDS Glossary (Canonical)

Single glossary for the META-CHIIDS project and framework. Use this file as the source of truth; other references should point here.

---

## Quick Reference (Alphabetical)

[A](#a) · [C](#c) · [D](#d) · [G](#g) · [I](#i) · [L](#l) · [M](#m) · [O](#o) · [P](#p) · [R](#r) · [S](#s) · [T](#t)

### A
- [API](#api-application-programming-interface) `[Integration]`

### C
- [CHIIDS](#chiids-chi-integrated-digital-system) `[Layer 0]`

### D
- [Datasette](#datasette) `[Data]`
- [Domain](#domain) `[Organization]`

### G
- [GitHub Actions](#github-actions) `[Integration]`

### I
- [Integration Path](#integration-path) `[Integration]`

### L
- [Layer 0](#layer-0-structural-framework) `[Layer 0]`
- [Layer 1](#layer-1-meta-project-layer) `[Layers]`
- [Layer 2](#layer-2-research-coordination-layer) `[Layers]`
- [Layer 3](#layer-3-execution-layer) `[Layers]`

### M
- [META-* Project Class](#meta--project-class) `[Layer 0]`
- [Meta-Project](#meta-project) `[Organization]`
- [Metadata](#metadata) `[Data]`
- [Milestone](#milestone) `[Workflow]`

### O
- [Ontology](#ontology) `[Layer 0]`

### P
- [Part 1-5](#part-1-5-architecture-documentation) `[Documentation]`
- [Primary Parent](#primary-parent) `[Organization]`
- [Project Card](#project-card) `[Workflow]`
- [Projection System](#projection-system) `[Layer 0]`
- [/project/ Directory](#project-directory) `[Documentation]`

### R
- [Relational Structure](#relational-structure) `[Data]`

### S
- [Schema](#schema) `[Layer 0]`
- [Secondary Dependency](#secondary-dependency) `[Organization]`
- [Self-Referential](#self-referential) `[Layers]`
- [Semester](#semester) `[Workflow]`
- [SQLite Database](#sqlite-database) `[Data]`

### T
- [Tag](#tag) `[Organization]`
- [Team Repository](#team-repository) `[Workflow]`

---

## Layer 0: Structural Framework

### CHIIDS (CHI Integrated Digital System)
The structural framework (Layer 0) that defines how CHI research projects are organized, related, and coordinated. CHIIDS provides the schema, ontology, and architectural principles that all meta-projects conform to.

*See also: [Layer 0](#layer-0-structural-framework), [Schema](#schema), [Ontology](#ontology)*

### Layer 0 (Structural Framework)
The foundational definitional layer that specifies the schema, ontology, relationships, and organizational rules for the entire CHI ecosystem. Located in the META-CHIIDS repository. Agnostic to specific project content—defines the structure that projects conform to.

*See also: [CHIIDS](#chiids-chi-integrated-digital-system), [Projection System](#projection-system), [Layer 1](#layer-1-meta-project-layer)*

### Projection System
The conceptual model for understanding Layer 0: like a Mercator projection defines how to display geographic data (but is agnostic to which planet's data is displayed), Layer 0 defines how to organize research projects (but is agnostic to which specific projects use that organization).

*See also: [Layer 0](#layer-0-structural-framework), [Schema](#schema)*

### Schema
The relational database structure (SQLite) that defines how projects, relationships, dependencies, and metadata are stored and queried. See [database/schema.sql](../database/schema.sql).

*See also: [SQLite Database](#sqlite-database), [Ontology](#ontology), [Relational Structure](#relational-structure)*

### Ontology
The formal specification of how projects relate to each other: primary parents, secondary dependencies, tags, domains, and cross-project connections. The ontology defines the vocabulary and rules for describing project relationships.

*See also: [Primary Parent](#primary-parent), [Secondary Dependency](#secondary-dependency), [Tag](#tag), [Domain](#domain)*

### META-* Project Class
The standardized directory structure and organizational pattern that all Layer 1 meta-projects follow. Includes required `/project/` directory with README, roadmap, and milestones. Like a class in object-oriented programming—defines the structure that all meta-project instances inherit.

*See also: [/project/ Directory](#project-directory), [Layer 1](#layer-1-meta-project-layer), [Meta-Project](#meta-project)*

---

## Operational Layers (Territory)

### Layer 1 (Meta-Project Layer)
The canonical list of CHI meta-projects, located in the [CHI-CityTech organization](https://github.com/CHI-CityTech). Each meta-project conforms to the Layer 0 schema and follows the META-* Project Class pattern. Layer 1 contains the actual projects that instantiate the Layer 0 structure.

**Examples:** Balanced Blended Space (BBS), Blended Reality Performance System (BRPS), Blended Shadow Puppet (BSP), Collaborative AI (CAI), CHIIDS (self-referential)

*See also: [Layer 0](#layer-0-structural-framework), [META-* Project Class](#meta--project-class), [Meta-Project](#meta-project)*

### Layer 2 (Research Coordination Layer)
The semester-based coordination hub located in the StudentResearch repository. Links active projects to team assignments, tracks milestones, and coordinates semester work. Persistent but updated each term.

*See also: [Project Card](#project-card), [Semester](#semester), [Milestone](#milestone)*

### Layer 3 (Execution Layer)
The distributed set of individual team repositories where actual code, assets, and deliverables are created. Each active project has its own repo for hands-on work.

*See also: [Team Repository](#team-repository), [Layer 2](#layer-2-research-coordination-layer)*

### Self-Referential
CHIIDS's unique property: it is both the Layer 0 framework definition AND a Layer 1 meta-project. CHIIDS experiences its own Layer 2 coordination and Layer 3 execution while simultaneously defining the structure that all layers follow.

*See also: [CHIIDS](#chiids-chi-integrated-digital-system), [Layer 0](#layer-0-structural-framework), [Layer 1](#layer-1-meta-project-layer)*

---

## Project Organization

### Meta-Project
A top-level strategic initiative in Layer 1 that organizes multiple sub-projects, research activities, and creative work. Meta-projects are permanent, define research directions, and conform to the Layer 0 schema.

*See also: [Layer 1](#layer-1-meta-project-layer), [META-* Project Class](#meta--project-class), [Primary Parent](#primary-parent)*

### Primary Parent
The single meta-project designated as a project's organizational home. Used for hierarchy clarity. Stored in the database schema as a required relationship.

*See also: [Meta-Project](#meta-project), [Secondary Dependency](#secondary-dependency), [Ontology](#ontology)*

### Secondary Dependency
Additional meta-projects that a project relies upon, informs, or connects with. Unlike primary parent (singular), projects may have multiple secondary dependencies. Reflects combinative, interdisciplinary nature of CHI research.

*See also: [Primary Parent](#primary-parent), [Relational Structure](#relational-structure)*

### Tag
A label applied to projects for categorization and filtering. Projects can have multiple tags (domain tags, status tags, semester tags). Tags enable many-to-many relationships and cross-cutting organization.

### Domain
A thematic or disciplinary categorization (e.g., Theory, Engineering, Performance, AI, UNESCO Research). Used to organize projects by subject area.

---

## Data & Infrastructure

### SQLite Database
The relational database that stores project metadata, relationships, dependencies, and tags. Enables programmatic querying and automation. Located in [database/schema.sql](../database/schema.sql) with seed data in [database/seed_data.sql](../database/seed_data.sql).

### Datasette
The API layer that exposes the SQLite database as a JSON API for consumption by the frontend and external systems. Provides read-only public access to project data.

### Relational Structure
The way projects are connected through primary parent, secondary dependencies, tags, and domains. Allows querying like "show all projects that depend on CAI" or "list all Engineering domain projects."

### Metadata
Structured information about projects stored in the database: name, description, status, creation date, team assignments, repository links, etc. Distinct from project content (which lives in individual repos).

---

## Workflow & Coordination

### Semester
An academic term (Fall, Spring, Summer) used to organize coordination work in Layer 2. Semesters provide temporal indexing for active projects and team assignments. Work persists across semesters; the semester tag identifies when work happened.

### Project Card
A coordination document in StudentResearch (Layer 2) that links a meta-project to active semester work. Contains team roster, repository links, milestones, and tracking issues. Created fresh each semester for active projects.

### Team Repository
An individual GitHub repository in Layer 3 where a specific team's execution work happens. Contains code, assets, documentation, and deliverables. Each project has its own repo.

### Milestone
A collection of related tasks or issues that represent progress toward a project goal. Often semester-aligned or feature-aligned. Used for tracking and planning.

---

## Integration & Automation

### GitHub Actions
Automated workflows that synchronize data between layers, validate schema consistency, generate reports, and update visualizations. Keeps CHIIDS components in sync without manual intervention.

### Integration Path
A documented procedure for connecting CHIIDS to external systems (GitHub, CUNY Academic Works, Zenodo, WorldAnvil, Zotero). See [Part 4: External Integration](../docs/architecture/part_4_external_integration.md) for details.

### API (Application Programming Interface)
A programmatic interface for accessing CHIIDS data. Datasette provides a JSON API for querying the project database. Used by the frontend and external tools.

---

## Documentation Structure

### Part 1-5 (Architecture Documentation)
The five-part architecture specification:
- **Part 1:** Operational Management (Layer 0 + Layers 1-3)
- **Part 2:** Data Infrastructure (database, API, frontend, backups)
- **Part 3:** Public Engagement (publishing, website, journal, social media)
- **Part 4:** External Integration (GitHub, CUNY, Zenodo, WorldAnvil, Zotero)
- **Part 5:** Archival & Preservation (storage, backup, recovery, compliance)

### /project/ Directory
The standardized directory in every META-* repository containing meta-project management documents (README, roadmap, milestones). Part of the META-* Project Class pattern.

---

## For More Information

- **Architecture Overview:** See [Part 1: Operational Management](../docs/architecture/part_1_operational_management.md)
- **Layer 0 Framework Details:** See [docs/architecture/](../docs/architecture/)
- **META-* Project Class Pattern:** See Part 1, "META-* Project Class Pattern" section
- **Database Schema:** See [database/schema.sql](../database/schema.sql)
- **CHIIDS as Meta-Project:** See [project/README.md](./README.md)
