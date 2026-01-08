# CHIIDS Data Layer: Storage + Integration Architecture

## Overview

The CHIIDS Data Layer implements the **Storage** and **Integration** cornerstones of the broader CHIIDS system. It consists of three integrated components:

1. **Database (SQLite)** — Persistent storage of meta-project ontology
2. **API (Datasette)** — Public query interface and integration point
3. **Frontend (React/Vite)** — User-facing interface for exploring and managing data

This document maps these components to the CHIIDS architectural framework described in the [original specification](../../project/architecture/chiids_original_spec.md) and explains how they work together.

---

## Component Architecture

```
┌─────────────────────────────────────────────────────────┐
│         CHIIDS Data Layer Components                     │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────┐      ┌──────────────┐                 │
│  │   Frontend   │◄─────►│   Datasette  │                 │
│  │ (React/Vite)│      │     API       │                 │
│  └──────────────┘      └──────────────┘                 │
│                              ▲                           │
│                              │ SQL queries               │
│                              ▼                           │
│                      ┌──────────────┐                    │
│                      │  SQLite DB   │                    │
│                      │              │                    │
│                      │  - projects  │                    │
│                      │  - proposals │                    │
│                      │  - tags      │                    │
│                      │  - deps      │                    │
│                      └──────────────┘                    │
└─────────────────────────────────────────────────────────┘
```

---

## Storage Cornerstone: SQLite Database

### Purpose

The SQLite database stores the **canonical meta-project ontology**—the authoritative source of truth for what CHI projects exist, how they relate, and what stages they're in. This implements the Storage cornerstone of the original CHIIDS specification.

### Schema Overview

#### Core Tables

**`projects`** — Meta-project definitions  
- `project_id`: Unique identifier
- `name`, `slug`: Project identity
- `description`, `long_description`: Project purpose and scope
- `type`: Classification (meta-project, framework, tool, etc.)
- `status`: Current state (active, archived, proposed, paused)
- `priority`: Implementation priority (1-5 scale)
- `maturity_level`: Development stage (idea → prototype → pilot → production)
- `domain`: Research area (e.g., "creative-tech", "ai-collaboration")
- `primary_parent_id`: Hierarchical parent project (for sub-projects)
- `repository_url`: GitHub repository link
- `zotero_group_id`: Research library integration
- Timestamps: `created_date`, `last_updated`

**`proposals`** — Project proposals and new ideas  
- `proposal_id`: Unique identifier
- `title`, `slug`: Proposal identity
- `summary`: Brief description
- `status`: Proposal workflow state (idea → draft → submitted → accepted/rejected)
- `submitted_by`: Proposer identification
- `link_url`: Canonical location (GitHub, Google Drive, etc.)
- `storage_hint`: Where to find full proposal details

**`project_proposals`** — Links between projects and proposals  
- `project_id`: Foreign key to projects
- `proposal_id`: Foreign key to proposals
- `relationship`: Relationship type (originates, implements, relates)
- Enables tracking which proposals led to which projects

#### Relationship Tables

**`dependencies`** — Project relationships  
- Maps `project_id` → `depends_on_id`
- `relationship_type`: Primary or secondary dependency
- Captures the dependency graph of meta-projects

**`project_tags`** — Flexible categorization  
- Maps projects to tags
- Allows classification by domain, keyword, framework, etc.

**`project_activity`** — Semester-level tracking and three-layer integration  
- `activity_id`: Unique identifier
- `project_id`: Link to canonical project (Layer 1)
- `semester`: Semester identifier (e.g., "2026-01-spring")
- `team_repo_url`: Link to execution team repository (Layer 3)
- `student_names`: Team members
- `goals`: Semester goals for the project
- `status`: Activity status (active, completed, paused)
- `github_issue_url`: Link to StudentResearch issue
- `project_card_url`: Link to StudentResearch project card
- **Critical role**: Bridges canonical projects (Meta-Project Layer) with semester activity (Research Coordination Layer) and team repositories (Execution Layer)

This table is **essential for integration** because it:
- Links permanent project definitions to temporary semester activity
- Connects StudentResearch coordination (Layer 2) to actual team work (Layer 3)
- Maintains historical record of project evolution across semesters
- Enables querying "Which teams worked on BSP in Spring 2026?"
- Supports analysis of project participation patterns over time

**`bbs_syntax`** — Balanced Blended Space mappings  
- Tracks how projects implement BBS transformations
- Documents source → destination entity mappings
- Supports research on BBS framework instantiation

### Data Integrity

- **Foreign keys** enforced: Projects maintain referential integrity
- **Unique constraints**: Prevent duplicate projects, tags, dependencies
- **Timestamps**: All records tracked with creation and update times
- **Status tracking**: All workflow entities have explicit status fields

### Mapping to CHIIDS Specification

The schema implements **Section 2: System Components and Data Types** from the original specification:

| Spec Data Type | Database Tables | Purpose |
|---|---|---|
| Project Management Data | `projects`, `project_activity` | Define projects and track semester activity |
| Meta-Project Definitions | `projects`, `dependencies` | Document meta-projects and relationships |
| Proposal Data | `proposals`, `project_proposals` | Manage project proposals and ideas |
| Domain Classification | `projects.domain`, `project_tags` | Organize by research area and keywords |
| Version/Status Tracking | `projects.status`, `maturity_level` | Monitor project lifecycle |
| Collaboration Data | `project_activity` | Track team assignments |

---

## Integration Cornerstone: Datasette API

### Purpose

Datasette provides a **public, queryable API** that exposes the database to external systems. This implements the Integration cornerstone—enabling smooth interactions with different platforms while maintaining project integrity.

### API Endpoints

**Base URL:** `http://localhost:8001/chiids`

**Available endpoints:**

```
GET /projects.json           — List all projects with pagination
GET /proposals.json          — List all proposals
GET /dependencies.json       — List project relationships
GET /tags.json               — List all tags
GET /project_activity.json   — List semester activity records
```

**Query Parameters:**

- `_shape=objects`: Return rows as objects (default)
- `_search=<term>`: Full-text search on multiple fields
- `<field>=<value>`: Filter by field value (e.g., `status=active`, `domain=ai`)
- `_sort=<field>`: Sort by field
- `_limit=<n>`: Pagination limit

**Example queries:**

```bash
# All active projects
curl "http://localhost:8001/chiids/projects.json?status=active"

# Search for BBS-related projects
curl "http://localhost:8001/chiids/projects.json?_search=BBS"

# Projects in the 'creative-tech' domain
curl "http://localhost:8001/chiids/projects.json?domain=creative-tech"

# Proposals pending review
curl "http://localhost:8001/chiids/proposals.json?status=submitted"
```

### Security & Access

- **Read-only**: Datasette instance exposes only SELECT queries
- **CORS headers**: Configured to allow cross-origin requests from frontend
- **No authentication**: Public read access (appropriate for meta-project discovery)
- **Future**: Production deployment will include API key authentication if needed

### Integration Use Cases

1. **Meta-Project Explorer**: React frontend queries API to display searchable project list
2. **External Tools**: Third-party systems can query the API for project data
3. **StudentResearch**: Links back to active projects and proposals
4. **CHI-CityTech Meta-Projects**: Can query related projects and dependencies
5. **Data Export**: JSON responses support research analysis and reporting
6. **Project Activity Integration**: Query semester activity to see which teams worked on which projects

---

## Project Activities: Bridging the Three-Layer System

### Why Project Activities Matter

The `project_activity` table is **critical to CHIIDS integration** because it bridges all three layers:

```
Meta-Project Layer (Permanent)      Research Coordination Layer        Execution Layer (Semester)
                                    (Semester-Updated)
    
┌──────────────────┐          ┌─────────────────────┐          ┌──────────────────┐
│   projects       │◄─────────┤  project_activity   │─────────►│  team_repo_url   │
│                  │          │                     │          │                  │
│ - name           │          │ - project_id        │          │ team-bsp-spring  │
│ - description    │          │ - semester          │          │ team-bbs-spring  │
│ - dependencies   │          │ - team_repo_url     │          │ etc.             │
│ - status         │          │ - student_names     │          │                  │
│ - maturity_level │          │ - goals             │          │  (actual code,   │
│                  │          │ - github_issue_url  │          │   assets,        │
│                  │          │ - project_card_url  │          │   deliverables)  │
└──────────────────┘          └─────────────────────┘          └──────────────────┘
                                        ▲
                                        │
                                        ▼
                              StudentResearch Repo
                            (coordination hub)
                            - GitHub Projects board
                            - team rosters
                            - semester milestones
```

### Storage of Project Activities

The Data Layer stores project activities to:

- **Preserve history**: Every semester's work is recorded permanently (not deleted after semester ends)
- **Track evolution**: See how projects evolve across multiple semesters
- **Maintain context**: Connect team work back to canonical project definitions
- **Enable analysis**: Query "Which semesters has project X been active?" or "How many students worked on the BBS project?"

**Key storage attributes:**

| Field | Purpose |
|---|---|
| `semester` | Timestamp for when activity occurred (preserved permanently) |
| `project_id` | FK to canonical project (integrates with Meta-Project Layer) |
| `team_repo_url` | Direct link to execution work (integrates with Layer 3) |
| `student_names` | Captures who participated (for credits, attribution) |
| `goals` | Records what was planned (vs. what was accomplished) |
| `github_issue_url` | Links to StudentResearch coordination (Layer 2) |
| `created_date`, `last_updated` | Audit trail of when activity record was created/modified |

### Integration of Project Activities

The Data Layer integrates project activities through:

1. **API Queries**: Query project activity across semesters
   ```bash
   # All semesters a project has been active
   curl "http://localhost:8001/chiids/project_activity.json?project_id=1"
   
   # All teams working in a semester
   curl "http://localhost:8001/chiids/project_activity.json?semester=2026-01-spring"
   
   # Find teams for a specific project
   curl "http://localhost:8001/chiids/project_activity.json?project_id=3&semester=2026-01-spring"
   ```

2. **Frontend Display**: Project detail pages show activity history
   - Current semester status and team
   - Historical participation across all semesters
   - Links to team repositories and GitHub issues

3. **External Integration**: StudentResearch can query CHIIDS to:
   - Validate that project exists in Meta-Project Layer
   - Link semester activity to canonical definitions
   - Export project participation for reports

4. **Historical Analysis**: Researchers can query to understand:
   - Project maturity over time (prototype → production)
   - Student participation patterns
   - Project dependency evolution
   - Which meta-projects are actively developed

### Example: Querying Project Activity

**Scenario:** "I want to see all work done on the Balanced Blended Space (BBS) project"

```javascript
// Frontend code:
const projects = await api.getProjects({ search: "Balanced Blended Space" });
const bbsProject = projects[0]; // Get BBS project record

// Query all activity for BBS across all semesters
const activities = await fetch(
  `http://localhost:8001/chiids/project_activity.json?project_id=${bbsProject.project_id}`
);

// Results show:
// - Spring 2025: team-bbs-2025sp in StudentResearch
// - Fall 2025: team-bbs-2025fa in StudentResearch
// - Spring 2026: team-bbs-2026sp (current)
// Each linked to actual GitHub team repos
```

---

## Presentation Layer: React Frontend


### Purpose

The React frontend provides a **user-friendly interface** for exploring, filtering, and viewing detailed project information. It consumes the Datasette API and implements the **Communications** cornerstone (facilitating accessible information flow).

### Components

**`ProjectList`** — Paginated project discovery  
- Search across all project fields
- Filter by status, domain, type, priority
- Display project cards with key metadata
- Sort by creation date, priority, maturity level

**`ProjectCard`** — Compact project summary  
- Project name, domain, and description
- Status badge and maturity level indicator
- Priority indicator
- Link to detailed view

**`ProjectDetail`** — Full project information  
- Complete project description
- Hierarchical structure (parent/child projects)
- Dependencies and related projects
- Project activity history (semester participation)
- Links to GitHub repository and Zotero library

**`FilterBar`** — Advanced filtering controls  
- Search text input (real-time filtering)
- Domain dropdown
- Status checkbox filter
- Type filter
- Priority range selector

### API Integration

Frontend uses service abstraction (`api.js`) to query Datasette:

```javascript
// Get all projects with filters
const projects = await api.getProjects({
  search: "BBS",
  domain: "creative-tech",
  status: "active"
});

// Get single project by slug
const project = await api.getProjectBySlug("balanced-blended-space");

// Get tags
const tags = await api.getTags();
```

---

## Data Flow

### Project Discovery Workflow

```
1. User opens Meta-Project Explorer
   ↓
2. Frontend calls API: GET /projects.json?_shape=objects
   ↓
3. Datasette queries SQLite database
   ↓
4. API returns JSON array of project records
   ↓
5. Frontend renders ProjectList with cards
   ↓
6. User applies filters (e.g., status=active, domain=ai)
   ↓
7. Frontend calls API with filter parameters
   ↓
8. Filtered results displayed
```

### Project Detail Workflow

```
1. User clicks on project card
   ↓
2. Frontend routes to /project/<slug>
   ↓
3. Frontend calls API: GET /projects.json?slug=<slug>
   ↓
4. API returns single project record
   ↓
5. Frontend queries related data:
   - Dependencies: GET /dependencies.json?project_id=<id>
   - Activity: GET /project_activity.json?project_id=<id>
   - Proposals: GET /project_proposals.json?project_id=<id>
   ↓
6. Frontend renders ProjectDetail page
```

---

## CHIIDS Cornerstone Mapping

### Storage Cornerstone

The Data Layer implements Storage through:

- **SQLite Database**: Persistent, structured storage of project metadata
- **Schema Design**: Reflects information architecture from original CHIIDS spec
- **Archival Data**: `project_activity` table maintains historical semester records
- **Version Control**: Timestamps and status fields track data evolution
- **Media Storage**: Foreign keys support linking to external media (GitHub, Zotero)

### Integration Cornerstone

The Data Layer implements Integration through:

- **Datasette API**: Public query interface for external systems
- **JSON Format**: Standard format for tool interoperability
- **Query Flexibility**: Full-text search and field-based filtering
- **CORS Support**: Cross-origin requests from third-party applications
- **Low Coupling**: API abstracts database schema; can evolve independently

### Communications Cornerstone

The Data Layer supports Communications through:

- **Frontend UI**: Accessible interface for browsing and searching projects
- **Search Capability**: Find projects by text, domain, status
- **Filtering**: Narrow results to relevant projects
- **Detail Pages**: Comprehensive project information for collaboration
- **Links to External**: GitHub repositories, proposals, research libraries

---

## Development & Deployment

### Local Development

```bash
# Install Datasette
pip install datasette

# Start API server (port 8001)
datasette database/chiids.db --port 8001

# Start frontend (port 5173)
cd frontend && npm run dev

# Frontend will query http://localhost:8001/chiids
```

### Production Deployment

- **Database**: SQLite suitable for read-heavy workloads; migration to PostgreSQL if needed
- **API**: Datasette can be hosted on Fly.io, Heroku, or container platform
- **Frontend**: Build as static site; deploy to Vercel, Netlify, or container
- **CORS**: Configure to allow requests from production frontend domain
- **Authentication**: Add API keys if needed for write operations (future)

---

## Future Enhancements

1. **Write Operations**: Support creating/updating projects through API
2. **Authentication**: API key or OAuth for write access
3. **Dependency Visualization**: Interactive graph showing project relationships
4. **Historical Analysis**: Query proposals over time; track evolution
5. **Integration Webhooks**: Trigger actions when projects change
6. **Full-Text Search**: Advanced search with boolean operators
7. **Data Sync**: Synchronize with StudentResearch for activity tracking
8. **Export**: CSV, JSON export of project data and analysis

---

## Related Documents

- [Original CHIIDS Engineering Specification](../../project/architecture/chiids_original_spec.md) — Full system architecture with four cornerstones
- [ARCHITECTURE.md](ARCHITECTURE.md) — GitHub repository structure (three layers)
- [database/INITIALIZATION.md](../../database/INITIALIZATION.md) — Database setup instructions
- [database/README.md](../../database/README.md) — Database documentation
