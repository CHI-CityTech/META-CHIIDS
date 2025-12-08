# Database Initialization & Testing Guide

## Quick Start

### 1. Initialize the Database

Run these commands from the repository root to create and populate the SQLite database:

```bash
# Create database and load schema
sqlite3 database/chiids.db < database/schema.sql

# Populate with seed data
sqlite3 database/chiids.db < database/seed_data.sql
```

This creates `database/chiids.db` with all tables, views, indexes, and initial meta-project data.

### 2. Verify the Database

Check that data was loaded correctly:

```bash
# Count total projects
sqlite3 database/chiids.db "SELECT COUNT(*) as total_projects FROM projects;"

# List all active projects
sqlite3 database/chiids.db "SELECT name, type, status FROM projects WHERE status = 'active' ORDER BY name;"

# View project hierarchy
sqlite3 database/chiids.db "SELECT name, parent_name, type FROM project_hierarchy ORDER BY name;"
```

### 3. Test Key Queries

#### All Projects with Dependencies
```bash
sqlite3 database/chiids.db "SELECT p.name, COUNT(d.dependency_id) as dependency_count FROM projects p LEFT JOIN dependencies d ON p.project_id = d.project_id GROUP BY p.project_id ORDER BY p.name;"
```

#### BRPS and Its Children
```bash
sqlite3 database/chiids.db "SELECT name, type FROM projects WHERE primary_parent_id = (SELECT project_id FROM projects WHERE slug = 'blended-reality-performance-system') ORDER BY name;"
```

#### AI-Perf Dependencies
```bash
sqlite3 database/chiids.db "SELECT p.name, dp.name as dependency FROM dependencies d JOIN projects p ON d.project_id = p.project_id JOIN projects dp ON d.depends_on_id = dp.project_id WHERE p.slug = 'ai-integrated-performance';"
```

#### All Tags Used
```bash
sqlite3 database/chiids.db "SELECT tag_name, category, COUNT(pt.project_tag_id) as usage_count FROM tags t LEFT JOIN project_tags pt ON t.tag_id = pt.tag_id GROUP BY t.tag_id ORDER BY tag_name;"
```

#### Projects by Domain
```bash
sqlite3 database/chiids.db "SELECT domain, COUNT(*) as count FROM projects WHERE status = 'active' GROUP BY domain ORDER BY domain;"
```

### 4. Interactive Mode

For more extensive testing, open SQLite in interactive mode:

```bash
sqlite3 database/chiids.db
```

Then run queries interactively. Exit with `.quit`

---

## File Structure

```
database/
├── chiids.db                 # ← Created after running schema.sql and seed_data.sql
├── schema.sql                # Relational schema (run first)
├── seed_data.sql             # Initial meta-projects (run second)
└── migrations/
    └── 001_initial_schema.sql   # Versioned migration file
```

---

## Important Notes

- **Do NOT commit `chiids.db` to git** — It's a binary database file that changes with each query
- **Always keep `schema.sql` and `seed_data.sql` in git** — These are the source of truth
- **Reinitialize when needed** — If you want to reset the database: `rm database/chiids.db` then rerun the initialization commands

---

## Common Issues

**"database is locked"** — Another process is accessing the database. Close other connections.

**"table already exists"** — The database file already exists. Delete it and reinitialize: `rm database/chiids.db`

**No data after running seed_data.sql** — Make sure you ran both commands in order (schema.sql first, then seed_data.sql)

---

## Next Steps

Once database is verified:
1. Create Python CLI tool for querying
2. Set up GitHub Action for semester sync
3. Add database initialization to README setup instructions

---

## Optional: Python CLI for Quick Queries

A lightweight helper is available at `scripts/chiids_cli.py` (no extra deps beyond Python + sqlite3).

Examples:

```bash
python scripts/chiids_cli.py list-projects
python scripts/chiids_cli.py hierarchy
python scripts/chiids_cli.py dependencies --slug ai-integrated-performance
python scripts/chiids_cli.py project --slug blended-reality-performance-system
python scripts/chiids_cli.py tags
```

Use `--db` to point to a different SQLite file if needed.
