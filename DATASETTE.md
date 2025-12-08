# Datasette Deployment for CHIIDS

[Datasette](https://datasette.io/) is a zero-configuration tool that turns any SQLite database into a searchable, filterable web interface.

## Local Testing

1. Install Datasette:
```bash
pip3 install datasette
```

2. Run locally:
```bash
python3 -m datasette database/chiids.db
```

3. Open **http://localhost:8001** in your browser

See [USAGE.md](USAGE.md) for complete search, filter, and export instructions.

## Deploy to Vercel (Recommended for Public Access)

The database file is stored in the repository, so deployment is simple:

1. Make sure you're authenticated with Vercel:
```bash
pip3 install datasette
datasette auth token
# (Follow Vercel sign-up/login prompts)
```

2. Deploy directly from the repo:
```bash
datasette publish vercel database/chiids.db \
  --project chiids-explorer \
  --install datasette-csv
```

3. **Vercel creates a live URL** (e.g., `https://chiids-explorer.vercel.app`)
   - Database is automatically published from your local file
   - Anyone with the URL can search and explore
   - No authentication or backend server needed

4. Update your README with the public URL:
```markdown
🌐 **Explore the Database Online:** [chiids-explorer.vercel.app](https://chiids-explorer.vercel.app)
```

### How Database Updates Work

When you update `database/seed_data.sql`:
1. **Regenerate local database:** `rm database/chiids.db && sqlite3 database/chiids.db < database/schema.sql < database/seed_data.sql`
2. **Redeploy to Vercel:** `datasette publish vercel database/chiids.db --project chiids-explorer`

The published instance reflects your latest data.

### Why Vercel?

- **Free tier** for small datasets (CHIIDS is tiny)
- **HTTPS by default**
- **Automatic CORS** for API access
- **Instant redeploy** on database changes
- **No server management**

## Deploy to Heroku (Alternative)

```bash
datasette publish heroku database/chiids.db --project chiids-childs
```

Similar to Vercel but requires Heroku account. Vercel is simpler for SQLite.

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
