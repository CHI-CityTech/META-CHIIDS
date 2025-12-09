"""Simple HTTP server wrapper for Datasette on Vercel"""
from pathlib import Path
from datasette.app import Datasette

# Database path relative to this file
db_path = str(Path(__file__).parent.parent / "database" / "chiids.db")

# Create and export the ASGI app
app = Datasette(
    [db_path],
    metadata={
        "title": "CHIIDS Meta-Project Explorer",
        "description": "Discover CHI projects, dependencies, and expertise domains",
    }
).app()
