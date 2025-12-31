# Database

Structure and guidance for the CHIIDS SQLite database.

## Layout
- **chiids.db** — primary SQLite database
- **schema/** — schema definitions (e.g., schema.sql)
- **migrations/** — incremental migration scripts
- **snapshots/** — optional backups/exports
- **seed_data.sql** — starter data (currently at repository root of database/)

## Local Usage
```bash
# Explore with Datasette
pip install -r api/requirements.txt
python3 -m datasette database/chiids.db
# open http://localhost:8001

# Interactive SQL
sqlite3 database/chiids.db
```

## Notes
- Keep schema changes in `schema/` and add migration files under `migrations/`.
- Store large snapshot exports under `snapshots/` to avoid root clutter.
- If you relocate seed_data.sql into snapshots/ or elsewhere, update docs accordingly.
