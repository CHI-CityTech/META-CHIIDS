"""Datasette ASGI app for Vercel serverless deployment"""
import os
from pathlib import Path
from datasette.app import Datasette

# Path to the database file (relative to this file)
db_path = Path(__file__).parent.parent / "database" / "chiids.db"

# Create Datasette instance
ds = Datasette(
    [str(db_path)],
    metadata={
        "title": "CHIIDS Meta-Project Explorer",
        "description": "Discover CHI projects, dependencies, and expertise domains",
    }
)

# ASGI app for Vercel
app = ds.app()
