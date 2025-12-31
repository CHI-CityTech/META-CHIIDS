# CHIIDS API

Datasette ASGI application for deploying the CHIIDS meta-project database.

## Overview

This directory contains a lightweight Python wrapper that exposes the CHIIDS SQLite database via Datasette's JSON API and web interface. It's designed for serverless deployment platforms like Vercel.

## Files

- **`datasette.py`** — ASGI app that serves `database/chiids.db` via Datasette
- **`requirements.txt`** — Python dependencies (Datasette)

## Local Development

Run Datasette locally from the repository root:

```bash
# Install dependencies
pip install -r api/requirements.txt

# Start server
python3 -m datasette database/chiids.db

# Or use the ASGI app directly
uvicorn api.datasette:app --reload
```

Visit http://localhost:8001 to explore projects via web UI or query the JSON API.

## Deployment

### Vercel

The repository includes [`vercel.json`](../deployment/vercel.json) for automatic deployment:

1. Connect the repository to Vercel
2. Vercel auto-detects the Python app
3. Database is bundled with each deployment

See [Datasette Integration Guide](../docs/integrations/datasette.md) for detailed deployment instructions.

### Railway / Render

Both platforms support Python ASGI apps. Set the start command:

```bash
uvicorn api.datasette:app --host 0.0.0.0 --port $PORT
```

## API Endpoints

Datasette automatically generates a JSON API for all tables:

- **Projects:** `/database/projects.json`
- **Dependencies:** `/database/project_dependencies.json`
- **Domains:** `/database/domains.json`
- **Project Types:** `/database/project_types.json`
- **Statuses:** `/database/statuses.json`

Query parameters support filtering, sorting, and pagination. See [Datasette JSON API docs](https://docs.datasette.io/en/stable/json_api.html).

## Frontend Integration

The [React frontend](../frontend) consumes this API. Ensure the API is running locally at `http://localhost:8001` before starting the frontend dev server.

---

For full deployment and integration guidance, see [`docs/integrations/datasette.md`](../docs/integrations/datasette.md).

## Related Docs
- Deployment configs: [`deployment/`](../deployment)
- Datasette integration guide: [`docs/integrations/datasette.md`](../docs/integrations/datasette.md)
