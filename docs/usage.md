# Using the CHIIDS Database

This guide explains how to explore, search, and export meta-project data from the Datasette interface.

## Local Access

### Start Datasette
```bash
python3 -m datasette database/chiids.db
```
Then open **http://localhost:8001** in your browser.

### Alternative: Python CLI
For command-line queries without a browser:
```bash
python3 scripts/chiids_cli.py list-projects
python3 scripts/chiids_cli.py hierarchy
python3 scripts/chiids_cli.py dependencies ai-perf
python3 scripts/chiids_cli.py project bbs
```

## Datasette Web Interface

### 📊 Main Views

**Tables Tab** — Browse all available tables:
- **projects** — All meta-projects and sub-projects (slug, name, domain, type, status, parent)
- **dependencies** — Project relationships (primary and secondary)
- **tags** — Categorical tags for classification
- **project_tags** — Mapping of projects to tags
- **project_activity** — Historical events and milestones

### 🔍 Searching

1. **Full-Text Search** (top of page)
   - Search across all text fields simultaneously
   - Example: Type "AI-Perf" to find all mentions

2. **Table-Level Search** (within a table)
   - Filter a specific table's columns
   - Example: In `projects` table, search for "BRPS" in the name column

3. **Faceted Filters** (right sidebar)
   - Click facet values to filter results
   - Multi-select supported
   - Common facets:
     - **Domain** (Engineering, Artistic, Infrastructure, Foundational)
     - **Type** (meta-project, sub-project, framework)
     - **Status** (active, planned, archived)

### 📋 Example Searches

**Find all Engineering projects:**
- Navigate to `projects` table → Click "Engineering" under Domain facet

**Find all active projects with "AI" in the name:**
- Use Full-Text Search: Type "AI"
- Filter by Status = "active"

**See BRPS dependencies:**
- Navigate to `dependencies` table
- Filter by `source_project_slug` = "brps"
- Shows all projects that BRPS depends on

**Explore a specific project (e.g., BBS):**
- Click "projects" table → Find BBS row
- Click the row to see full details (all columns, formatted nicely)
- From project detail, related dependencies and tags are visible

### 📥 Exporting Data

Datasette offers multiple export formats for every query result:

1. **CSV Export**
   - Click "CSV" button at bottom-right of any table
   - Download spreadsheet-ready data
   - Use case: Import into Excel for custom analysis

2. **JSON Export**
   - Click "JSON" button at bottom-right
   - Get structured data for programmatic use
   - Use case: Feed into custom dashboards or analysis pipelines

3. **Custom Query Export**
   - Advanced: Use "Execute arbitrary SQL" if you know SQL
   - Click "execute" to run, then export results as CSV/JSON

### 🔗 Sharing Results

Each search/filter state is captured in the URL. Share the URL to send someone directly to:
- A specific filtered table view
- A project detail page
- A dependency search result

Example: `http://localhost:8001/database/projects?domain=Engineering&status=active`

## Interpreting Results

### Projects Table Columns

- **slug** — URL-friendly identifier (lowercase, dash-separated)
- **name** — Human-readable project name
- **domain** — Primary discipline (Engineering, Artistic, Infrastructure, Foundational)
- **type** — meta-project or sub-project
- **status** — active, planned, archived, inactive
- **primary_parent_id** — Parent project ID (NULL for root projects like BBS)

### Dependencies Table

- **source_project_slug** — Project that has a dependency
- **target_project_slug** — Project being depended on
- **dependency_type** — primary, secondary, optional
- **description** — Why the dependency exists

### Understanding the Hierarchy

**Root Project (BBS):**
- primary_parent_id = NULL
- All other projects trace back to BBS through the dependency graph

**Sub-projects (e.g., AI-Perf components):**
- Have a primary_parent_id (e.g., AI-Perf's parent is BRPS)
- May also have secondary_dependencies

**Example Interpretation:**
- BABS has primary_parent_id = NULL (independent meta-project)
- BABS has secondary_dependency on CAI (requires CAI's capabilities)
- In the dependency graph, BABS and BRPS are peers; both require CAI support

## Advanced Usage

### Custom SQL Queries

1. Click "Execute arbitrary SQL" at bottom of database page
2. Write queries like:
   ```sql
   SELECT p.name, COUNT(d.id) as dependency_count
   FROM projects p
   LEFT JOIN dependencies d ON p.slug = d.source_project_slug
   GROUP BY p.slug
   ORDER BY dependency_count DESC;
   ```
3. Export results as CSV/JSON

### Database Schema

See `database/schema.sql` for complete table definitions, including:
- All columns and data types
- Foreign key relationships
- Indexes for performance
- View definitions for pre-computed queries

## Cloud Access

See [DATASETTE.md](DATASETTE.md) for deploying Datasette to the cloud (Vercel, Heroku) so others can access the database remotely.
