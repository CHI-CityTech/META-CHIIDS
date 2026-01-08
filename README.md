# CHIIDS: CHI Integrated Digital System

<img src="assets/ChatGPT_CHIIDS_Logo.png" alt="CHIIDS Logo" width="100" align="right" style="margin-left: 15px; margin-bottom: 15px;"/>

The digital nervous system for the Center for Holistic Integration (CHI) and the Balanced Blended Space (BBS) framework.

CHIIDS is a distributed, three-layer digital ecosystem designed to support the entire lifecycle of CHI's meta-projects: from theoretical proposal through active research to long-term archival.

**[Original Proposal v1.0](https://docs.google.com/document/d/1X0aqvqdeZxtAF902jXT1ZbHkHBc3ir7pMu6n1M7OTQ4/edit?usp=sharing)** | **[Repository Authority Model](project/README.md#directory-authority-model)** | **[Getting Started](#getting-started)**

---

## What is CHIIDS?

CHIIDS integrates research coordination, project management, collaborative AI workflows, and knowledge archiving across all CHI initiatives.

**Core Philosophy:** Integration over Creation — orchestrate existing systems rather than build redundant tools.

The system operates across four layers:

- **Layer 0 (Structural Framework)** — Schema, ontology, and organizational rules (this repository)
- **Layer 1 (Meta-Projects)** — Permanent projects conforming to Layer 0 structure
- **Layer 2 (Coordination)** — Semester-based research assignments and tracking
- **Layer 3 (Execution)** — Individual team repositories where work happens

See **[Part 1: Operational Management](docs/architecture/part_1_operational_management.md)** for the complete Layer 0 framework description.

---

## At a Glance

- Purpose: A unified system for coordinating CHI research, collaboration, and long-term knowledge stewardship.
- Audience: Faculty, researchers, students, and partners who want to understand CHI's meta-projects and how they connect.
- Authority: See the Repository Authority Model in [project/README.md](project/README.md#directory-authority-model).
- Foundations: The original engineering specification lives in [project/architecture/chiids_original_spec.md](project/architecture/chiids_original_spec.md).

## Core Components

- Project Management: Define meta-projects, relationships, and governance across CHI.
- Communications: Coordinate semester work and cross-team collaboration.
- Storage: Preserve artifacts, decisions, and research outputs over time.
- Integration: Connect external platforms (GitHub, Zotero, WorldAnvil, OpenLab) into one coherent system.

---

## Key Principles

CHIIDS is guided by CHI's core philosophy of _Holistic Integration_ and the _Balanced Blended Space (BBS)_ framework:

- **Scalability**: Accommodate growing participants, projects, and datasets
- **Interoperability**: Seamless integration with existing platforms; no redundant systems
- **User-Friendliness**: Accessible across academic and professional disciplines
- **Data Security & Privacy**: Strong protocols for integrity and confidentiality
- **Adaptability**: Flexible to support multiple interaction models
- **Task Automation**: Routine processes increase efficiency
- **Integration over Creation**: Orchestrate existing tools; focus on innovation

---

## Layer 0 Framework Examples

CHIIDS (this repository) defines the **structural framework** for organizing CHI meta-projects. Actual meta-projects (Layer 1) live in the **[CHI-CityTech organization](https://github.com/CHI-CityTech)**, where each follows the META-* Project Class pattern.

**Example Meta-Projects:**
- **Balanced Blended Space (BBS)** — Theory: Universal framework for combinative reality
- **Blended Reality Performance System (BRPS)** — Engineering: Modular test environment for BBS
- **Collaborative AI (CAI)** — AI/Human Collaboration: Partnership models for co-creation

*For the complete list of CHI meta-projects, see the [CHI-CityTech organization](https://github.com/CHI-CityTech).*

---

## How It Works

- Layers: CHIIDS spans four layers — Structural Framework (Layer 0), Meta-Projects (Layer 1), Coordination (Layer 2), and Execution (Layer 3).
- Governance: Layer 0 defines how projects, data, and collaboration are organized; Layers 1–3 apply those rules in practice.
- Principle: Integration over Creation — we connect existing tools to avoid redundancy and focus on meaningful outcomes.

## Where to Explore

- Meta-Projects: Browse the [CHI-CityTech organization](https://github.com/CHI-CityTech) to see active initiatives.
- Semester Coordination: Visit [StudentResearch](https://github.com/CHI-CityTech/StudentResearch) for current assignments and milestones.
- Architecture: Read the [Architecture Overview](docs/architecture/) and [Part 1: Operational Management](docs/architecture/part_1_operational_management.md).
- Roadmap & Terms: See [project/ROADMAP.md](project/ROADMAP.md) and [project/GLOSSARY.md](project/GLOSSARY.md).

---

## Repository Structure

```
META-CHIIDS/ (this repository)
│
├── README.md                          # Main entry point (you are here)
├── ABSTRACT.md                        # One-page abstract for citations
├── LICENSE                            # MIT License
│
├── docs/
│   ├── ARCHITECTURE.md                # Three-layer system design
│   ├── ECOSYSTEM.md                   # Current meta-projects
│   ├── GLOSSARY.md                    # Key definitions
│   ├── INTEGRATION-PATHS.md           # External system integration
│   └── WORLDANVIL-WORKFLOW.md         # World-building workflow
│
├── database/
│   ├── schema.sql                     # SQLite relational schema
│   ├── seed_data.sql                  # Initial meta-projects
│   └── migrations/
│       └── 001_initial_schema.sql
│
├── templates/
│   ├── PROJECT_PROPOSAL_TEMPLATE.md   # For new project proposals
│   └── PROJECT_CARD_TEMPLATE.md       # For StudentResearch cards
│
├── assets/
│   ├── ChatGPT_CHIIDS_Logo.png
│   └── CHIIDS_V1.jpg                  # System map
│
└── .github/
    └── workflows/
        └── build_meta_project_reports.yml
```

---

## System Components

### Layer 0: Structural Framework (Permanent)
**Location:** This repository  
**Contains:** Schema, ontology, META-* Project Class pattern, architectural documentation  
**Purpose:** Define the structure that all CHI projects conform to  
**Key:** Agnostic to specific project content; defines the organizational framework

### Layer 1: Meta-Projects (Permanent)
**Location:** [CHI-CityTech organization](https://github.com/CHI-CityTech)  
**Contains:** Project definitions, proposals, dependencies, roadmaps  
**Purpose:** Instantiate the Layer 0 structure with actual CHI initiatives  
**Key:** Each meta-project follows the META-* Project Class pattern

### Layer 2: Research Coordination (Semester-Updated)
**Location:** StudentResearch repository  
**Contains:** Project Cards, student assignments, team memberships, milestones  
**Purpose:** Connect meta-projects to semester work  
**Key:** Persistent but refreshed each term

### Layer 3: Execution (Distributed)
**Location:** Individual team repositories  
**Contains:** Code, assets, research logs, deliverables  
**Purpose:** Where actual research and development happens  
**Key:** Multiple repos, ongoing work

---

## System Integration

CHIIDS integrates with GitHub, StudentResearch, OpenLab, WorldAnvil, Zotero, and more — bringing existing platforms into one coherent workflow. See **[integration_paths.md](docs/reference/integration_paths.md)** for details.

---

## Explore the System

- Interactive App: See the [frontend](frontend/README.md) for a modern React UI to browse projects and dependencies.
- Data Access: Use the local Datasette UI or API when developing; engineering details are documented under [docs/architecture/](docs/architecture/).
- Organization: Browse active meta-projects at the [CHI-CityTech organization](https://github.com/CHI-CityTech).

---

## The CHIIDS System Map

![CHIIDS V1 System Map showing the four core components - Project Management, Communications, Storage, and Integration with External Systems - and their interconnected subsystems and data flows within the Center for Holistic Integration's digital ecosystem](assets/CHIIDS_V1.jpg)

*Visual representation of the CHIIDS integrated system architecture and component relationships*

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## For More Information

- **Authority Model:** See [project/README.md](project/README.md#directory-authority-model)
- **Original Specification:** [project/architecture/chiids_original_spec.md](project/architecture/chiids_original_spec.md)
- **Architecture Overview:** [docs/architecture/](docs/architecture/)
- **Layer 0 Framework:** [Part 1: Operational Management](docs/architecture/part_1_operational_management.md)
- **Development Roadmap:** [project/ROADMAP.md](project/ROADMAP.md)
- **Key Terms:** [project/GLOSSARY.md](project/GLOSSARY.md)
- **External Integration:** [integration_paths.md](docs/reference/integration_paths.md)
- **World-Building:** [worldanvil_workflow.md](docs/reference/worldanvil_workflow.md)
- **META-* Templates:** [templates/meta_project_class/](templates/meta_project_class/)
- **Create a Proposal:** [PROJECT_PROPOSAL_TEMPLATE.md](templates/PROJECT_PROPOSAL_TEMPLATE.md)
- **Coordinate Research:** [PROJECT_CARD_TEMPLATE.md](templates/PROJECT_CARD_TEMPLATE.md)

**Questions?** Open an issue in this repository or contact CHI administration.

---

*CHIIDS: The digital backbone of the Balanced Blended Space framework at the Center for Holistic Integration.*
