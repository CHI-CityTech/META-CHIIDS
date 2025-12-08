# Datasette Deployment for CHIIDS

[Datasette](https://datasette.io/) is a zero-configuration tool that turns any SQLite database into a searchable, filterable web interface.

## Local Testing

1. Install Datasette:
```bash
pip install datasette
```

2. Run locally:
```bash
cd /Users/davidsmith/Dropbox\ \(Personal\)/GitHub/META-CHIIDS
datasette database/chiids.db --port 8001
```

3. Open http://localhost:8001 in your browser. You can:
   - Browse all tables
   - Click on rows to inspect
   - Use the search box to filter by text
   - Click column headers to sort
   - Use facets (checkboxes) to filter by domain, type, status, etc.

## Deploy to Vercel (Recommended)

Datasette can be deployed serverlessly to Vercel for free:

1. Install the Datasette CLI:
```bash
pip install datasette
```

2. Create a `datasette.yml` config file in the repo root (see below)

3. Deploy:
```bash
datasette publish vercel database/chiids.db --project chiids
```

This creates a live URL where anyone can search the projects.

## Deploy to Heroku (Alternative)

```bash
datasette publish heroku database/chiids.db --project chiids
```

## Configuration

Create `datasette.yml` in the repo root to customize the UI:

```yaml
title: CHIIDS Meta-Project Explorer
description: Discover CHI projects by domain, expertise, and dependencies

databases:
  chiids:
    tables:
      projects:
        sortable_columns:
          - name
          - domain
          - type
          - status
        searchable: true
        facet_columns:
          - domain
          - type
          - status
      dependencies:
        searchable: true
        facet_columns:
          - relationship_type
      tags:
        searchable: true

allow_facet:
  - domain
  - type
  - status

plugins:
  datasette-json-html:
    enabled: true
```

## Features

Once deployed, users can:
- **Search** projects by name, description, keywords
- **Filter** by domain (Theory, Engineering, Creative, etc.)
- **Filter** by type (meta-project, sub-project, infrastructure)
- **Filter** by status (active, inactive, planned, archived)
- **Explore** dependencies and related projects
- **View** full project details and metadata
- **Export** results as JSON, CSV, or other formats (built-in)

## Next Steps

1. Test locally: `datasette database/chiids.db`
2. Create `datasette.yml` config (optional but recommended)
3. Deploy to Vercel or Heroku when ready
4. Link the public URL in README and GitHub Pages

---

See https://datasette.io/ for full documentation and advanced features.
