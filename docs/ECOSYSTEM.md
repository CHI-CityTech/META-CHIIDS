# CHIIDS Ecosystem: Meta-Projects & Dependencies

Complete overview of CHI's meta-project ecosystem, including primary hierarchy and secondary dependencies.

---

## Ecosystem Overview

The CHIIDS ecosystem consists of **9 meta-projects/major initiatives**, organized in a **multi-parent dependency graph** where projects can have:
- **Primary Parent**: Immediate structural parent (defines project type and lineage)
- **Secondary Dependencies**: Other projects that provide essential capabilities or frameworks

This structure supports scalability and interdisciplinary collaboration while maintaining clear conceptual hierarchies.

---

## Hierarchy & Dependencies

### **Tier 1: Foundational Frameworks** (Roots of the ecosystem)

#### **Balanced Blended Space (BBS)**
- **Type:** Meta-project (foundational theory)
- **Domain:** Theory
- **Primary Parent:** None (root)
- **Secondary Dependencies:** None
- **Description:** Universal theoretical framework for combinative reality, mediation pathways, and multi-agent collaboration. Grounded in Hegel's dialectic and contemporary systems theory.
- **Key Concepts:** Blended space, mediation pathways, combinative reality, multi-agent systems
- **Role in Ecosystem:** Provides theoretical foundation for all other CHI projects
- **Zotero Group:** [BBS References](https://www.zotero.org/)

---

#### **Collaborative AI (CAI)**
- **Type:** Meta-project
- **Domain:** AI/Human Collaboration
- **Primary Parent:** BBS (extends BBS theory to human-AI collaboration)
- **Secondary Dependencies:** None
- **Description:** Research and models for human-AI partnership, co-creation, and mediation systems. Explores how LLMs and AI systems can serve as genuine collaborators in research and creative work.
- **Key Subprojects:**
  - **Personalized LLMs** — Custom language models for individual collaboration styles
- **Role in Ecosystem:** Enables AI-enhanced collaboration across all performance and research projects
- **Zotero Group:** [CAI References](https://www.zotero.org/)

---

### **Tier 2: Engineering & Performance Testbeds**

#### **Blended Reality Performance System (BRPS)**
- **Type:** Meta-project
- **Domain:** Engineering
- **Primary Parent:** BBS
- **Secondary Dependencies:** None
- **Description:** Modular engineering framework and testbed for BBS theory. Provides configurable physical + digital + conceptual performance infrastructure.
- **Key Components:**
  - **AI-Integrated Performance Systems (AI-Perf)** — Intelligence/adaptive layer of BRPS
    - Virtual Orchestra — AI-composed music generation
    - Immersive Audio — Spatial audio and sound field manipulation
    - AI Media Control — Dynamic projection, lighting, visual effects
    - AI Blended Unreal Puppet — Virtual/hybrid puppet environments with Unreal Engine
    - Robotics Integration — Robotic performers as mediation pathways
  - Physical stages, sensors, displays, interaction systems
- **Secondary Dependencies:**
  - **Collaborative AI (CAI)** — AI-Perf requires CAI models for intelligent adaptation
- **Role in Ecosystem:** Primary engineering testbed for validating BBS theory through performance research
- **Repository:** [CHI-CityTech/BRPS](https://github.com/CHI-CityTech/) (team repos vary by semester)

---

#### **Bio-Aware Blended Spaces (BABS)**
- **Type:** Meta-project
- **Domain:** Performance/Biometrics
- **Primary Parent:** BRPS (extends with biometric sensing)
- **Secondary Dependencies:**
  - **Collaborative AI (CAI)** — For adaptive bio-responsive systems
- **Description:** Integration of biometric sensing (heart rate, movement, respiration, neural signals) into blended performance systems. Explores how biological information becomes a mediation pathway.
- **Key Features:** Bio-aware environments, physiological response systems, emotional state sensing
- **Role in Ecosystem:** Demonstrates how human embodiment can be a mediation pathway in the blended space
- **Status:** Active research

---

### **Tier 3: Artistic & Cultural Research**

#### **Blended Shadow Puppet (BSP)**
- **Type:** Meta-project
- **Domain:** Creative/Performance
- **Primary Parent:** BRPS (uses BRPS as artistic testbed)
- **Secondary Dependencies:**
  - **Balanced Blended Space (BBS)** — Theoretical grounding
- **Description:** Flagship artistic project using contemporary shadow puppet performance as a creative lens for exploring BBS theory. Integrates traditional puppet arts with digital projection, sensor-driven interaction, and collaborative narrative world-building.
- **Key Features:**
  - World-building via WorldAnvil
  - Live performance integration
  - Student-led artistic research
  - International partnerships
- **Related Initiative:**
  - **UNESCO World-Building** — International partnership exploring cultural transformation through world-building methodology
- **Role in Ecosystem:** Demonstrates BBS and BRPS in live artistic context; serves as creative research methodology
- **External Integrations:** WorldAnvil (world-building), GitHub (version control), Discord (team coordination)
- **Repository:** [CHI-CityTech/BSP Team Repos](https://github.com/CHI-CityTech/)

---

#### **UNESCO World-Building**
- **Type:** Meta-project
- **Domain:** Research/Cultural Studies
- **Primary Parent:** BSP (builds on BSP infrastructure)
- **Secondary Dependencies:**
  - **Balanced Blended Space (BBS)** — Theoretical framework for cultural mediation
- **Description:** International research partnership with UNESCO exploring cultural transformation through collaborative fictional world-building. Uses performance and technology to create spaces for creative agency and intercultural dialogue.
- **Key Methods:** Community co-creation, narrative design, cultural reimagining
- **Role in Ecosystem:** Applies BBS and BSP methodologies to international cultural research
- **Status:** Active partnership

---

### **Tier 4: Infrastructure & Coordination**

#### **CHIIDS: CHI Integrated Digital System**
- **Type:** Infrastructure
- **Domain:** Research Coordination & Digital Ecosystem
- **Primary Parent:** None (root infrastructure)
- **Secondary Dependencies:** All active meta-projects (supports the entire ecosystem)
- **Description:** The digital backbone coordinating all CHI research and creative initiatives. Provides proposal management, student researcher coordination, team repository tracking, external system integration, and long-term archival.
- **Three Layers:**
  1. **Meta-Project Layer** (this repo) — Permanent proposals, ontology, dependencies, documentation
  2. **Research Coordination Layer** — StudentResearch hub with semester-updated project cards and assignments
  3. **Execution Layer** — Individual team repositories where actual work happens
- **Key Functions:**
  - Project proposal management
  - Semester coordination through StudentResearch
  - GitHub Actions automation
  - External system orchestration
  - Historical archival
- **Role in Ecosystem:** Makes CHI scalable, transparent, and coherent across distributed teams
- **Repository:** [CHI-CityTech/META-CHIIDS](https://github.com/CHI-CityTech/META-CHIIDS) (this repo)

---

## Dependency Graph

```
                        BBS (root)
                       /    \    \
                      /      \    \
                    BRPS      CAI   \
                    / \        |  \  \
                   /   \       |   \  \
              AI-Perf  BABS <- CAI  \  \
              (sub)    (sec)       \  \
                                    \  \
                                   BSP  UNESCO
                                   /
                              (uses BRPS)
```

### Primary Parent Relationships (→)
- BBS → (root)
- CAI → BBS
- BRPS → BBS
- BABS → BRPS
- BSP → BRPS
- UNESCO → BSP
- AI-Perf → BRPS (as intelligence layer)
- Personalized LLMs → CAI
- CHIIDS → (root infrastructure)

### Secondary Dependencies (⟷)
- BRPS ⟷ CAI (through AI-Perf)
- BABS ⟷ CAI
- BSP ⟷ BBS
- UNESCO ⟷ BBS
- AI-Perf ⟷ CAI

---

## Integration Matrix

| Meta-Project | GitHub | WorldAnvil | Zotero | OpenLab | StudentResearch | Discourse |
|--|--|--|--|--|--|--|
| BBS | ✓ | - | ✓ | ✓ | Ref | ✓ |
| BRPS | ✓ | - | ✓ | ✓ | Active | ✓ |
| BSP | ✓ | ✓ | ✓ | ✓ | Active | ✓ |
| CAI | ✓ | - | ✓ | ✓ | Active | ✓ |
| UNESCO | ✓ | ✓ | ✓ | ✓ | Active | - |
| BABS | ✓ | - | - | - | Active | - |
| AI-Perf | ✓ | - | - | - | Active | - |
| CHIIDS | ✓ | - | - | - | Hub | ✓ |

---

## Project Lifecycle & Roles

### For Faculty / Project Leads
1. **Propose** new projects using [PROJECT_PROPOSAL_TEMPLATE.md](../templates/PROJECT_PROPOSAL_TEMPLATE.md)
2. **Define** primary parent and secondary dependencies in proposal
3. **Submit** to CHIIDS for ontology registration
4. **Coordinate** semester activities through StudentResearch

### For Student Researchers
1. **Find** your project in [StudentResearch](https://github.com/CHI-CityTech/StudentResearch)
2. **Review** the Project Card connecting to:
   - The meta-project proposal (from this repo)
   - Your team's execution repository
3. **Work** in your team repo; track progress in GitHub issues
4. **Document** AI usage and research decisions

### For System Integrators
1. **Query** the SQLite database for:
   - Project hierarchy and dependencies
   - Semester activity and student rosters
   - Related external resources (Zotero, WorldAnvil, etc.)
2. **Automate** semester reports via GitHub Actions
3. **Sync** StudentResearch project cards with CHIIDS metadata

---

## Getting Started by Project

### **BBS Researchers**
→ Read [GLOSSARY.md](GLOSSARY.md) | [ARCHITECTURE.md](ARCHITECTURE.md) | Join [Zotero BBS Group](https://www.zotero.org/)

### **BRPS Engineers**
→ Review BRPS proposal | Join relevant semester team | Explore [StudentResearch](https://github.com/CHI-CityTech/StudentResearch)

### **BSP Artists & World-Builders**
→ Check [WORLDANVIL-WORKFLOW.md](WORLDANVIL-WORKFLOW.md) | Review BSP proposal | Access WorldAnvil world repo

### **CAI Collaborators**
→ Explore CAI proposal | Review [INTEGRATION-PATHS.md](INTEGRATION-PATHS.md) for AI workflows | Join [Zotero CAI Group](https://www.zotero.org/)

### **UNESCO Partners**
→ Read UNESCO proposal | Connect via [StudentResearch](https://github.com/CHI-CityTech/StudentResearch) | Join cultural research forums

### **CHIIDS Administrators**
→ Review [ARCHITECTURE.md](ARCHITECTURE.md) | Access SQLite database in `/database/` | Set up GitHub Actions from `.github/workflows/`

---

## Querying the Ecosystem

All projects and dependencies are stored in SQLite at `/database/chiids.db`. Example queries:

**All active projects:**
```sql
SELECT * FROM active_projects;
```

**Project hierarchy (with parent names):**
```sql
SELECT * FROM project_hierarchy WHERE status = 'active';
```

**Secondary dependencies for a project:**
```sql
SELECT p.name, d.depends_on_id, dp.name AS dependency_name
FROM dependencies d
JOIN projects p ON d.project_id = p.project_id
JOIN projects dp ON d.depends_on_id = dp.project_id
WHERE p.slug = 'blended-reality-performance-system'
  AND d.relationship_type = 'secondary';
```

**All projects tagged with 'Performance':**
```sql
SELECT DISTINCT p.name
FROM projects p
JOIN project_tags pt ON p.project_id = pt.project_id
JOIN tags t ON pt.tag_id = t.tag_id
WHERE t.tag_name = 'Performance';
```

---

## Future Expansion

The ecosystem is designed to scale. New projects can be added by:
1. Creating a new proposal in `/database/proposals/[project_name]/`
2. Registering in the SQLite database with parent and dependencies
3. Creating a team repository under CHI-CityTech organization
4. Adding project card to StudentResearch for active semesters
5. Linking external resources (Zotero, WorldAnvil, etc.)

See [PROJECT_PROPOSAL_TEMPLATE.md](../templates/PROJECT_PROPOSAL_TEMPLATE.md) for detailed submission process.

---

**Last Updated:** December 2025  
**Maintained by:** CHI Administration  
**Questions?** Open an issue in [META-CHIIDS](https://github.com/CHI-CityTech/META-CHIIDS)
