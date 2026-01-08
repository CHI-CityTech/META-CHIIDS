# CHIIDS Local Development Setup

This guide explains how to run CHIIDS locally with the full stack: SQLite database, Datasette API, and React frontend.

## Prerequisites

- Python 3.12+
- Node.js 18+
- Git

## Quick Start

### 1. Start Datasette API

From the project root:

```bash
python3 -m datasette database/chiids.db --port 8001 --cors
```

- **Port 8001**: Frontend expects API on this port
- **--cors**: Required for frontend to access API from different port
- Access Datasette UI: http://localhost:8001

### 2. Start React Frontend

In a separate terminal:

```bash
cd frontend
npm install  # First time only
npm run dev
```

- Vite will automatically find an available port (usually 5173, 5177, etc.)
- Check terminal output for the exact URL
- Access frontend: http://localhost:5177 (or whichever port Vite chose)

## Architecture

```
SQLite Database (database/chiids.db)
    ↓
Datasette API (http://localhost:8001)
    ↓ JSON API calls with CORS
React Frontend (http://localhost:5177)
```

## Key Files

- **Database**: `database/chiids.db` - SQLite database with projects, dependencies, tags
- **Schema**: `database/schema/schema.sql` - Database structure definition
- **Seed Data**: `database/seed_data.sql` - Initial project data
- **API Service**: `frontend/src/services/api.js` - Frontend API client
- **Datasette Config**: `api/datasette.py` - Datasette ASGI app for deployment

## API Usage

The frontend uses Datasette's JSON API with `?_shape=objects` parameter:

```javascript
// Get all projects as objects (not arrays)
GET http://localhost:8001/chiids/projects.json?_shape=objects

// Get project by slug
GET http://localhost:8001/chiids/projects.json?_shape=objects&slug=balanced-blended-space

// Get dependencies
GET http://localhost:8001/chiids/dependencies.json?_shape=objects
```

## Troubleshooting

### Frontend shows "0 of 0 projects"

- Ensure Datasette is running with `--cors` flag
- Check browser console for CORS errors
- Verify API is accessible: `curl http://localhost:8001/chiids/projects.json`

### Port conflicts

- Datasette: Change with `--port XXXX`
- Frontend: Vite auto-increments to next available port
- Check terminal output for actual URLs

### Database changes not showing

- Restart Datasette after modifying `chiids.db`
- Datasette caches schema; restart picks up changes

## Current Status (Jan 2026)

- ✅ Database schema defined and populated with 14 seed projects
- ✅ Datasette API running locally
- ✅ React frontend connected and displaying projects
- ⚠️ Full project data ingestion pending (ROADMAP P0)
- ⚠️ Public deployment pending (ROADMAP P0)

## Next Steps

See [project/ROADMAP.md](project/ROADMAP.md) for:
- P0: Database population with all CHI projects
- P0: Public Datasette deployment (Vercel/Fly.io/Railway)
- P1: Frontend deployment
- P2: Automated data ingestion agent

## Related Documentation

- [Frontend README](frontend/README.md) - React app details
- [Database README](database/README.md) - Schema and migrations
- [ROADMAP](project/ROADMAP.md) - Development timeline
- [Part 2: Data Infrastructure](docs/architecture/part_2_data_infrastructure.md) - Technical architecture
