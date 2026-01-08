# Deployment

Configs for deploying CHIIDS services.

- **datasette.yml** — Datasette process config (local or hosted)
- **vercel.json** — Vercel config to deploy the Datasette ASGI app

## Quick Start (local Datasette)
```bash
pip install -r api/requirements.txt
python3 -m datasette database/chiids.db
# open http://localhost:8001
```

## Vercel
- Entry: `api/datasette.py` (ASGI app)
- Config: `deployment/vercel.json`
- Set any secrets/environment (if external DB) in Vercel dashboard

## Other Hosts (Railway / Render)
Start command:
```bash
uvicorn api.datasette:app --host 0.0.0.0 --port $PORT
```

For integration details, see [docs/integrations/datasette.md](../docs/integrations/datasette.md).
