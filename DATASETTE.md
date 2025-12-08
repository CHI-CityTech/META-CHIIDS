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

## Deploy to Railway (Recommended for Public Access)

Railway natively supports Python ASGI applications and is ideal for Datasette:

1. **Create Railway account** at [railway.app](https://railway.app)

2. **Create a new project** and select "Deploy from GitHub"

3. **Connect your GitHub repo** (META-CHIIDS)

4. **Set environment variable**:
   ```
   PORT=8000
   ```

5. **Railway auto-detects** `requirements.txt` and deploys
   - Database file (`database/chiids.db`) is included
   - Datasette starts automatically
   - Get a live URL instantly

6. **Access your database**:
   ```
   https://YOUR-RAILWAY-PROJECT.up.railway.app
   ```

### Updating Database

1. Update `database/seed_data.sql` and push to GitHub
2. Regenerate locally: `rm database/chiids.db && sqlite3 database/chiids.db < database/schema.sql < database/seed_data.sql`
3. Commit and push: Railway auto-redeploys on every push

---

## Alternative: Deploy to Render.com

Render also supports Python web services:

1. Go to [render.com](https://render.com)
2. Create new "Web Service"
3. Connect GitHub repo
4. Use `python3 -m datasette database/chiids.db --host 0.0.0.0 --port 8000` as start command
5. Deploy and get a public URL

---

## Deploy to Vercel (Legacy - Has Issues)

⚠️ **Note:** Datasette on Vercel's serverless functions has compatibility issues with ASGI initialization. Railway or Render are recommended instead.

The original `datasette publish vercel` command is deprecated and no longer works reliably.

If you still want to try:
```bash
datasette publish vercel database/chiids.db --project chiids
---

## Local Alternative (Recommended for Development)

```bash
pip3 install datasette
python3 -m datasette database/chiids.db
# Open http://localhost:8001 in your browser
```

Perfect for:
- Development and testing
- Sharing with teammates on the same network
- Custom plugin development
- Learning Datasette

---

## Features

Once deployed (locally or cloud), users can:
- **Search** projects by name, description, keywords
- **Filter** by domain (Engineering, Artistic, Infrastructure, Foundational)
- **Filter** by type (meta-project, sub-project)
- **Filter** by status (active, inactive, planned, archived)
- **Explore** dependencies and related projects
- **View** full project details and metadata
- **Export** results as JSON or CSV (built-in)

---

See https://datasette.io/ for full documentation.
