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

## Quick Links

### Core Documentation
- **[Part 1: Operational Management](docs/architecture/part_1_operational_management.md)** — Layer 0 framework, META-* Project Class pattern, naming conventions
- **[Architecture Overview](docs/architecture/)** — Five-part architecture (operational, data, engagement, integration, archival)
- **[ROADMAP](project/ROADMAP.md)** — CHIIDS development status, bootstrap milestones, P0 blockers
- **[GLOSSARY](project/GLOSSARY.md)** — Canonical glossary with alphabetical index and cross-references
- **[INTEGRATION-PATHS.md](docs/reference/integration_paths.md)** — How CHIIDS connects to GitHub, OpenLab, WorldAnvil, Zotero
- **[WORLDANVIL-WORKFLOW.md](docs/reference/worldanvil_workflow.md)** — Detailed guide for Blended Shadow Puppet world-building

### Templates
- **[META-* Project Class Templates](templates/meta_project_class/)** — Standardized scaffolds (README, ROADMAP, MILESTONES, GLOSSARY, GOVERNANCE) for all META-* repos
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

## Layer 0 Framework Examples

CHIIDS (this repository) defines the **structural framework** for organizing CHI meta-projects. Actual meta-projects (Layer 1) live in the **[CHI-CityTech organization](https://github.com/CHI-CityTech)**, where each follows the META-* Project Class pattern.

**Example Meta-Projects:**
- **Balanced Blended Space (BBS)** — Theory: Universal framework for combinative reality
- **Blended Reality Performance System (BRPS)** — Engineering: Modular test environment for BBS
- **Collaborative AI (CAI)** — AI/Human Collaboration: Partnership models for co-creation

*For the complete list of CHI meta-projects, see the [CHI-CityTech organization](https://github.com/CHI-CityTech).*

---

## Getting Started

### For Faculty/PIs
1. Read **[Part 1: Operational Management](docs/architecture/part_1_operational_management.md)** — understand Layer 0 and the operational layers
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
1. Review **[part_1_operational_management.md](docs/architecture/part_1_operational_management.md)** for the coordination layer role
2. Use **[PROJECT_CARD_TEMPLATE.md](templates/PROJECT_CARD_TEMPLATE.md)** for each active project per semester
3. Link proposals from META-CHIIDS to team repositories
4. Maintain semester rosters and milestone tracking

### For System Integration
1. Read **[integration_paths.md](docs/reference/integration_paths.md)** for GitHub, OpenLab, WorldAnvil, Zotero guidance
2. For world-building workflows, see **[worldanvil_workflow.md](docs/reference/worldanvil_workflow.md)**

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

CHIIDS connects to:
- **GitHub** — Version control, issues, automation
- **StudentResearch** — Research coordination
- **OpenLab** — Public engagement
- **WorldAnvil** — World-building
- **Zotero** — Academic references
- **Specialized tools** — ArcGIS, Airtable, Overleaf, etc.

See **[integration_paths.md](docs/reference/integration_paths.md)** for full integration guidance.

---

## Explore the Meta-Project Database

The CHIIDS ecosystem is stored in a SQLite database (`database/chiids.db`) with queryable projects, dependencies, and tags.

### Quick Start

**Web UI (Recommended for Local Use):**
1. **Local Web Interface:** Run `python3 -m datasette database/chiids.db` → Open http://localhost:8001
2. **How to Use:** See [Usage Guide](docs/usage.md) for search, filter, and export instructions
3. **Cloud Hosting:** See [Datasette Integration](docs/integrations/datasette.md) for deployment to Railway, Render, or Heroku

**CLI (Quick Queries - Works Everywhere):**

**🎨 React Web App (New!):**
1. **Navigate to frontend:** `cd frontend`
2. **Install dependencies:** `npm install`
3. **Start the app:** `npm run dev`
4. **Open browser:** http://localhost:5173

The React app provides:
- **Project Discovery** — Browse all CHIIDS projects as interactive cards
- **Search & Filter** — Filter by domain, type, status
- **Project Details** — Click to see full information and dependencies
- **Modern UI** — Responsive design built with React + TailwindCSS

See [frontend/README.md](frontend/README.md) for architecture and customization.

**Important:** The React app queries the Datasette API at `http://localhost:8001`. Make sure Datasette is running in a separate terminal before starting the frontend!

```bash
python3 scripts/chiids_cli.py list-projects
python3 scripts/chiids_cli.py hierarchy
python3 scripts/chiids_cli.py dependencies --slug ai-integrated-performance
python3 scripts/chiids_cli.py project --slug blended-reality-performance-system
```

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

### Cloud Deployment (Public Access)

**Option 1: Railway (Recommended for Datasette)**
Railway natively supports Python ASGI apps. See [Datasette Integration](docs/integrations/datasette.md) for step-by-step deployment.

**Option 2: Render.com**
Similar to Railway; also supports Python web services well.

**Option 3: Heroku**
Free tier discontinued, but still available on paid plans.

**Local Alternative (Works Great):**
```bash
python3 -m datasette database/chiids.db
# Open http://localhost:8001 in your browser
```

See [Datasette Integration](docs/integrations/datasette.md) for detailed deployment instructions.

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

- **Layer 0 Framework:** [Part 1: Operational Management](docs/architecture/part_1_operational_management.md)
- **Architecture Overview:** [docs/architecture/](docs/architecture/)
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
