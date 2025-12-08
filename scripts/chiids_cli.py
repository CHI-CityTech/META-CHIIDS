#!/usr/bin/env python3
"""Lightweight CLI for querying the CHIIDS SQLite database.

Usage examples:
    python scripts/chiids_cli.py list-projects
    python scripts/chiids_cli.py hierarchy
    python scripts/chiids_cli.py dependencies --slug ai-integrated-performance
    python scripts/chiids_cli.py domains
    python scripts/chiids_cli.py tags
    python scripts/chiids_cli.py project --slug blended-reality-performance-system

The CLI defaults to database/chiids.db. Override with --db if needed.
"""

import argparse
import sqlite3
import sys
from typing import List, Tuple

DEFAULT_DB_PATH = "database/chiids.db"


def get_connection(db_path: str) -> sqlite3.Connection:
    try:
        conn = sqlite3.connect(db_path)
        conn.row_factory = sqlite3.Row
        return conn
    except sqlite3.Error as exc:
        sys.stderr.write(f"[error] could not open database {db_path}: {exc}\n")
        sys.exit(1)


def print_rows(rows: List[sqlite3.Row], headers: List[str]) -> None:
    if not rows:
        print("(no results)")
        return
    widths = [len(h) for h in headers]
    for row in rows:
        for i, h in enumerate(headers):
            widths[i] = max(widths[i], len(str(row[h]) if row[h] is not None else ""))
    def fmt_line(values: Tuple[str, ...]) -> str:
        return " | ".join(str(v if v is not None else "").ljust(widths[i]) for i, v in enumerate(values))
    print(fmt_line(tuple(headers)))
    print("-+-".join("-" * w for w in widths))
    for row in rows:
        print(fmt_line(tuple(row[h] for h in headers)))


def cmd_list_projects(conn: sqlite3.Connection) -> None:
    rows = conn.execute(
        "SELECT name, type, domain, status FROM projects ORDER BY name"
    ).fetchall()
    print_rows(rows, ["name", "type", "domain", "status"])


def cmd_hierarchy(conn: sqlite3.Connection) -> None:
    rows = conn.execute(
        "SELECT name, parent_name, type, status FROM project_hierarchy ORDER BY COALESCE(parent_name, 'ZZZ'), name"
    ).fetchall()
    print_rows(rows, ["name", "parent_name", "type", "status"])


def cmd_dependencies(conn: sqlite3.Connection, slug: str) -> None:
    rows = conn.execute(
        """
        SELECT p.name AS project, dp.name AS depends_on, d.relationship_type AS type, d.description
        FROM dependencies d
        JOIN projects p ON d.project_id = p.project_id
        JOIN projects dp ON d.depends_on_id = dp.project_id
        WHERE (? IS NULL OR p.slug = ?)
        ORDER BY p.name, dp.name
        """,
        (slug, slug),
    ).fetchall()
    print_rows(rows, ["project", "depends_on", "type", "description"])


def cmd_domains(conn: sqlite3.Connection) -> None:
    rows = conn.execute(
        "SELECT domain, COUNT(*) AS count FROM projects GROUP BY domain ORDER BY domain"
    ).fetchall()
    print_rows(rows, ["domain", "count"])


def cmd_tags(conn: sqlite3.Connection) -> None:
    rows = conn.execute(
        """
        SELECT t.tag_name, t.category, COUNT(pt.project_tag_id) AS usage_count
        FROM tags t
        LEFT JOIN project_tags pt ON t.tag_id = pt.tag_id
        GROUP BY t.tag_id
        ORDER BY t.tag_name
        """
    ).fetchall()
    print_rows(rows, ["tag_name", "category", "usage_count"])


def cmd_project(conn: sqlite3.Connection, slug: str) -> None:
    proj = conn.execute(
        "SELECT * FROM projects WHERE slug = ?",
        (slug,),
    ).fetchone()
    if not proj:
        print(f"No project found for slug '{slug}'")
        return
    print("Project:")
    for key in proj.keys():
        print(f"  {key}: {proj[key] if proj[key] is not None else ''}")
    print("\nSecondary dependencies:")
    deps = conn.execute(
        """
        SELECT dp.name AS depends_on, d.relationship_type, d.description
        FROM dependencies d
        JOIN projects dp ON d.depends_on_id = dp.project_id
        WHERE d.project_id = (SELECT project_id FROM projects WHERE slug = ?)
        ORDER BY dp.name
        """,
        (slug,),
    ).fetchall()
    print_rows(deps, ["depends_on", "relationship_type", "description"])


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Query the CHIIDS SQLite database")
    parser.add_argument(
        "--db",
        default=DEFAULT_DB_PATH,
        help=f"Path to SQLite database (default: {DEFAULT_DB_PATH})",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    subparsers.add_parser("list-projects", help="List all projects")
    subparsers.add_parser("hierarchy", help="Show project hierarchy with parents")

    deps = subparsers.add_parser("dependencies", help="Show dependencies (optionally for a project slug)")
    deps.add_argument("--slug", help="Project slug to filter (optional)")

    subparsers.add_parser("domains", help="Count projects by domain")
    subparsers.add_parser("tags", help="Tag usage summary")

    proj = subparsers.add_parser("project", help="Show full details for a project slug")
    proj.add_argument("--slug", required=True, help="Project slug (e.g., blended-reality-performance-system)")

    return parser


def main() -> None:
    parser = build_parser()
    args = parser.parse_args()
    conn = get_connection(args.db)

    if args.command == "list-projects":
        cmd_list_projects(conn)
    elif args.command == "hierarchy":
        cmd_hierarchy(conn)
    elif args.command == "dependencies":
        cmd_dependencies(conn, args.slug)
    elif args.command == "domains":
        cmd_domains(conn)
    elif args.command == "tags":
        cmd_tags(conn)
    elif args.command == "project":
        cmd_project(conn, args.slug)
    else:
        parser.error("Unknown command")


if __name__ == "__main__":
    main()
