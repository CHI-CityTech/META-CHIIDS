# CHIIDS Glossary: Key Terms and Definitions

## Core Concepts

### Balanced Blended Space (BBS)
The universal theoretical framework developed by CHI that describes how physical, virtual, and conceptual realities interact symmetrically. BBS provides the foundation for all CHI meta-projects and the syntax for describing mediation pathways. Also serves as the core philosophy for how CHIIDS itself is organized.

### Blended Reality Performance System (BRPS)
The primary engineering test environment for BBS, integrating automation, AI, puppetry, projection, immersive audio, and robotics into a configurable modular platform. BRPS serves as both a research instrument and a creative production environment.

### Blended Shadow Puppet (BSP)
The flagship artistic meta-project that operationalizes BBS and BRPS within a fictional narrative universe rooted in UNESCO cultural transformation research. Encompasses shadow puppet theatre, AI-driven puppet systems, game design, world-building, and multi-disciplinary creative work.

### Collaborative AI (CAI)
The research ecosystem and philosophy that treats artificial intelligence as a collaborative partner rather than a tool. CAI emphasizes human–AI co-creation, shared decision-making, and cognitive–computational symmetry.

### CHIIDS (CHI Integrated Digital System)
The digital nervous system for all CHI projects, providing the infrastructure, ontology, and workflows that coordinate research, documentation, team collaboration, and public engagement.

---

## Organizational Structures

### Meta-Project
A top-level project that organizes, spawns, or integrates multiple sub-projects, research activities, and creative pipelines. Meta-projects are permanent and strategic; they define research directions and establish cross-disciplinary connections.

**Examples:** BBS, BRPS, BSP, CAI, UNESCO World-Building, CHIIDS

### Sub-Project
A research or production component that exists within a meta-project. Sub-projects may be ongoing or time-limited, but are always connected to a larger meta-project.

**Examples:** AI Puppet Control (under BRPS), Personalized LLMs (under CAI), Lumbra (under BSP)

### Primary Parent
The single meta-project assigned to a project for organizational clarity. The choice is often arbitrary but declared; it indicates which domain "owns" the project for administrative purposes.

### Secondary Dependency
A meta-project (other than the primary parent) that a project relies upon, informs, or influences. Unlike primary parents, projects may have multiple secondary dependencies, reflecting their combinative nature in BBS.

**Example:** BABS (Bio-Aware Blended Spaces) has BRPS as primary parent but depends on CAI for intelligent behavior.

---

## CHIIDS Architecture & Data

### Meta-Project Layer (Layer 1)
The permanent, canonical foundation of CHIIDS, stored in the META-CHIIDS repository. Contains all project proposals, the SQLite ontology database, and long-term documentation. Does not change by semester; instead, it grows as new projects are added.

### Research Coordination Layer (Layer 2)
The semester-updated operational layer, stored in StudentResearch. Contains project cards, student assignments, team memberships, and semester-specific milestones. Persistent across semesters but refreshed each term.

### Execution Layer (Layer 3)
The distributed set of team repositories where actual research and development work happens. Each active project has its own repo; students commit code, assets, and documentation directly here.

### Proposal
A canonical, versioned document describing a CHI meta-project: its goals, scope, relationships to other projects, team structure, and alignment with BBS principles. Proposals live permanently in META-CHIIDS and are the authoritative source of project definition.

### Project Card
A summary document in StudentResearch that links a proposal to active semester work. Project Cards list assigned students, team repository links, semester milestones, and tracking issues. Unlike proposals, cards are created fresh each semester for active projects.

### SQLite Database (Ontology Engine)
The relational database stored in META-CHIIDS that indexes all projects, their relationships, dependencies, tags, and metadata. Allows querying and automation; does not store full proposal text but rather pointers and relationships.

### GitHub Actions
Automated workflows that keep CHIIDS layers synchronized, auto-generate reports and visualizations, validate schema consistency, and notify teams of important updates.

---

## Workflow & Collaboration

### Semester
An academic term (Fall, Spring, Summer) during which StudentResearch is updated with active projects, student assignments, and milestones. Semesters do not reset CHIIDS or team repos; they add a time-based index to ongoing work.

### Team Repository
An independent GitHub repository owned by a research or production team, where code, assets, documentation, and actual project work are stored. Each project should have its own repo.

### GitHub Issue
A tracked task, discussion, or piece of work within a GitHub repository. Issues can be associated with milestones, projects, and labels for organization and automation.

### GitHub Project Board
A Kanban-style board for organizing issues and work across a repository, with columns for different workflow stages (e.g., To Do, In Progress, Done).

### Milestone
A collection of related issues and pull requests that collectively represent a significant step toward a project goal. Milestones are often semester-aligned or narrative-arc-aligned.

### AI Usage Documentation
Records of how AI tools were used in a project's research, planning, or execution. Required transparency practice in CHI to support the Collaborative AI philosophy.

---

## External System Integration

### OpenLab
A community engagement platform used for public-facing project announcements, blog posts, newsletters, and knowledge archiving. Projects may use OpenLab for visibility with audiences outside GitHub/CHI.

### WorldAnvil
A specialized world-building platform used for the Blended Shadow Puppet universe. WorldAnvil serves as the "live" repository for approved narrative content, with GitHub serving as the proposal and review space.

### Zotero
A collaborative bibliographic and reference management tool. CHI maintains group libraries for BBS, BRPS, BSP, CAI, UNESCO, SEID, and QuantumMusic projects. All significant research is cited through Zotero.

### Discord
An informal real-time communication platform used for quick discussions, announcements, and team coordination outside of formal GitHub workflows.

---

## BBS & Mediation Concepts

### Mediation Pathway
In BBS, the route by which a signal, idea, or intent flows from a source through one or more vectors to a destination. Mediation pathways can be physical, virtual, cognitive, or computational.

### SVD (Source–Vector–Destination)
The formal syntax notation for representing mediation pathways in BBS. Every communication, action, or transformation can be described as: Source → Vector(s) → Destination.

### Cognition–Computation Symmetry
The BBS principle that cognitive (human) and computational (AI) agents are equally valid participants in the system. No hierarchy; instead, complementary strengths and shared decision-making.

### Combinative Reality
The state in which physical, virtual, and conceptual realities coexist and interact symmetrically. BBS enables combinative reality; BRPS tests it; BSP and other projects instantiate it.

---

## Tagging & Organization

### Domain Tags
Labels that categorize projects by their primary domain or framework. Common tags: BBS, BRPS, BSP, CAI, UNESCO, AVMI, SEID, QuantumMusic, CHIIDS.

### Semester Tags
Labels used to organize work by academic term (e.g., Fall2025, Spring2026).

### Status Labels
Indicators of project phase: draft, active, completed, archived, paused.

---

## Roles & Responsibilities

### Faculty / Principal Investigator (PI)
Defines meta-projects, maintains proposals, establishes dependencies, approves new project instantiations. Overall stewards of CHIIDS and BBS framework.

### Student Researcher
Assigned to a team project, works directly in their team's repository, documents AI usage, updates project milestones, and reports progress via StudentResearch and GitHub Issues.

### Team Lead / Project Manager
Coordinates a specific project's team, manages StudentResearch project cards, ensures milestone tracking, facilitates communication between students and faculty.

### AI Collaborator
Assists in writing, analysis, synthesis, planning, and documentation. Treated as a team member; all AI contributions are documented and reviewed by humans.

---

## For More Information

- **Three-Layer Architecture:** See `architecture.md`
- **Current Ecosystem State:** See `ecosystem.md`
- **Integration with External Systems:** See `integration_paths.md`
- **WorldAnvil Detailed Workflow:** See `WORLDANVIL-WORKFLOW.md`
- **Database Schema:** See `/database/schema.sql`

