# CHIIDS: CHI Integrated Digital System

<img src="assets/ChatGPT_CHIIDS_Logo.png" alt="CHIIDS Logo" width="100" align="right" style="margin-left: 15px; margin-bottom: 15px;"/>

The digital nervous system for the Center for Holistic Integration (CHI) and the Balanced Blended Space (BBS) framework.

CHIIDS is a distributed, three-layer digital ecosystem designed to support the entire lifecycle of CHI's meta-projects: from theoretical proposal through active research to long-term archival.

**[Original Proposal v1.0](https://docs.google.com/document/d/1X0aqvqdeZxtAF902jXT1ZbHkHBc3ir7pMu6n1M7OTQ4/edit?usp=sharing)** | **[Abstract](ABSTRACT.md)** | **[Getting Started](#getting-started)**

---

## What is CHIIDS?

CHIIDS integrates research coordination, project management, collaborative AI workflows, and knowledge archiving across all CHI initiatives (BBS, BRPS, BSP, CAI, UNESCO World-Building, and more).

**Core Philosophy:** Integration over Creation — orchestrate existing systems rather than build redundant tools.

The system is built on three interacting layers:

1. **Meta-Project Layer** — Permanent project proposals, ontology, and dependencies
2. **Research Coordination** — Semester-updated student assignments and project tracking  
3. **Execution** — Individual team repositories where actual work happens

See **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** for the full three-layer system description.

---

## Quick Links

### Core Documentation
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** — The three-layer system design and how layers connect
- **[ECOSYSTEM.md](docs/ECOSYSTEM.md)** — Current state of all CHI meta-projects (coming soon)
- **[GLOSSARY.md](docs/GLOSSARY.md)** — Definitions of key terms (BBS, BRPS, BSP, CAI, meta-project, etc.)
- **[INTEGRATION-PATHS.md](docs/INTEGRATION-PATHS.md)** — How CHIIDS connects to GitHub, OpenLab, WorldAnvil, Zotero, and other systems
- **[WORLDANVIL-WORKFLOW.md](docs/WORLDANVIL-WORKFLOW.md)** — Detailed guide for Blended Shadow Puppet world-building

### Templates
- **[PROJECT_PROPOSAL_TEMPLATE.md](templates/PROJECT_PROPOSAL_TEMPLATE.md)** — How to create a new CHI meta-project proposal
- **[PROJECT_CARD_TEMPLATE.md](templates/PROJECT_CARD_TEMPLATE.md)** — How StudentResearch tracks semester activity

### Database (In Development)
- **[schema.sql](database/schema.sql)** — Relational database schema for meta-project ontology
- **[seed_data.sql](database/seed_data.sql)** — Initial meta-projects and dependencies
- **[migrations/](database/migrations/)** — Schema evolution over time

### External Links
- **[StudentResearch](https://github.com/CHI-CityTech/StudentResearch)** — Semester-updated project coordination hub
- **[CHI-CityTech Organization](https://github.com/CHI-CityTech)** — All CHI team repositories
- **[CHI Zotero Groups](https://www.zotero.org/)** — BBS, BRPS, BSP, CAI, UNESCO, SEID, QuantumMusic

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

## CHI Meta-Projects Supported

| Meta-Project | Domain | Role |
|--|--|--|
| **Balanced Blended Space (BBS)** | Theory | Universal framework for combinative reality |
| **Blended Reality Performance System (BRPS)** | Engineering | Modular test environment for BBS |
| **Blended Shadow Puppet (BSP)** | Creative | Flagship artistic testbed; world-building |
| **Collaborative AI (CAI)** | AI/Human Collaboration | Partnership models for co-creation |
| **UNESCO World-Building** | Research | Cultural transformation → fictional universe |
| **Bio-Aware Blended Spaces (BABS)** | Systems | Sensor-driven intelligent environments |
| **AI-Integrated Performance** | Production | Virtual Orchestra, immersive audio, robotics |

See **[ECOSYSTEM.md](docs/ECOSYSTEM.md)** for comprehensive descriptions.

---

## Getting Started

### For Faculty/PIs
1. Read **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** — understand the three-layer system
2. Use **[PROJECT_PROPOSAL_TEMPLATE.md](templates/PROJECT_PROPOSAL_TEMPLATE.md)** to propose new projects
3. Store proposals in `/database/proposals/[project_name]/`
4. Update SQLite metadata with project information

### For Student Researchers
1. Find your project in **[StudentResearch](https://github.com/CHI-CityTech/StudentResearch)**
2. Read your semester's Project Card for goals and milestones
3. Work in your **team's dedicated repository** (not in StudentResearch)
4. Update GitHub issues and milestones to track progress
5. Document AI usage in your team repo README

### For StudentResearch Managers
1. Review **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** for the coordination layer role
2. Use **[PROJECT_CARD_TEMPLATE.md](templates/PROJECT_CARD_TEMPLATE.md)** for each active project per semester
3. Link proposals from META-CHIIDS to team repositories
4. Maintain semester rosters and milestone tracking

### For System Integration
1. Read **[INTEGRATION-PATHS.md](docs/INTEGRATION-PATHS.md)** for GitHub, OpenLab, WorldAnvil, Zotero guidance
2. For world-building workflows, see **[WORLDANVIL-WORKFLOW.md](docs/WORLDANVIL-WORKFLOW.md)**

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

### Meta-Project Layer (Permanent)
**Location:** This repository  
**Contains:** Proposals, SQLite ontology, dependencies, long-term documentation  
**Purpose:** Define what each CHI project is and how they relate  
**Key:** Does not change by semester

### Research Coordination Layer (Semester-Updated)
**Location:** StudentResearch repository  
**Contains:** Project Cards, student assignments, team memberships, milestones  
**Purpose:** Connect abstract projects to actual semester work  
**Key:** Persistent but refreshed each term

### Execution Layer (Distributed)
**Location:** Individual team repositories  
**Contains:** Code, assets, research logs, deliverables  
**Purpose:** Where actual research and development happens  
**Key:** Multiple repos, ongoing work

---

## System Integration

CHIIDS connects to:
- **GitHub** — Version control, issues, automation
- **StudentResearch** — Research coordination
- **OpenLab** — Public engagement
- **WorldAnvil** — World-building
- **Zotero** — Academic references
- **Specialized tools** — ArcGIS, Airtable, Overleaf, etc.

See **[INTEGRATION-PATHS.md](docs/INTEGRATION-PATHS.md)** for full integration guidance.

---

## Explore the Meta-Project Database

The CHIIDS ecosystem is stored in a SQLite database (`database/chiids.db`) with queryable projects, dependencies, and tags.

### Quick Start

**CLI (no dependencies):**
```bash
python3 scripts/chiids_cli.py list-projects
python3 scripts/chiids_cli.py hierarchy
python3 scripts/chiids_cli.py dependencies --slug ai-integrated-performance
python3 scripts/chiids_cli.py project --slug blended-reality-performance-system
```

**VS Code GUI:**
1. Install the SQLite extension (alexcvzz)
2. `Cmd+Shift+P` → "SQLite: Open Database" → `database/chiids.db`
3. Browse tables in the Explorer sidebar

**Interactive SQL:**
```bash
sqlite3 database/chiids.db
```
See [database/INITIALIZATION.md](database/INITIALIZATION.md) for example queries.

### On GitHub Pages

Auto-generated project hierarchy and dependency graphs are published to the CHI-CityTech wiki. See [links in the organization](https://github.com/CHI-CityTech).

---

## The CHIIDS System Map

![CHIIDS V1 System Map showing the four core components - Project Management, Communications, Storage, and Integration with External Systems - and their interconnected subsystems and data flows within the Center for Holistic Integration's digital ecosystem](assets/CHIIDS_V1.jpg)

*Visual representation of the CHIIDS integrated system architecture and component relationships*

---

## License

MIT License. See [LICENSE](LICENSE) for details.

---

## For More Information

- **Architecture & Design:** [ARCHITECTURE.md](docs/ARCHITECTURE.md)
- **Current Ecosystem:** [ECOSYSTEM.md](docs/ECOSYSTEM.md)
- **Key Terms:** [GLOSSARY.md](docs/GLOSSARY.md)
- **External Integration:** [INTEGRATION-PATHS.md](docs/INTEGRATION-PATHS.md)
- **World-Building:** [WORLDANVIL-WORKFLOW.md](docs/WORLDANVIL-WORKFLOW.md)
- **Create a Proposal:** [PROJECT_PROPOSAL_TEMPLATE.md](templates/PROJECT_PROPOSAL_TEMPLATE.md)
- **Coordinate Research:** [PROJECT_CARD_TEMPLATE.md](templates/PROJECT_CARD_TEMPLATE.md)

**Questions?** Open an issue in this repository or contact CHI administration.

---

*CHIIDS: The digital backbone of the Balanced Blended Space framework at the Center for Holistic Integration.*
