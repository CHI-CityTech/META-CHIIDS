-- Migration 002: Add priority, maturity_level to projects; proposals support
-- Date: 2026-01-08

PRAGMA foreign_keys = ON;

-- 1) Add new columns to projects
-- Note: SQLite ALTER TABLE ADD COLUMN does not support CHECK constraints; enforce via app logic.
ALTER TABLE projects ADD COLUMN priority INTEGER DEFAULT 3;          -- 1 (highest) to 5 (lowest)
ALTER TABLE projects ADD COLUMN maturity_level TEXT DEFAULT 'prototype'; -- idea, proposal, prototype, pilot, production, archived

-- 2) Proposals table
CREATE TABLE IF NOT EXISTS proposals (
    proposal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    summary TEXT,
    status TEXT NOT NULL DEFAULT 'draft',        -- idea, draft, submitted, accepted, rejected, archived
    submitted_by TEXT,                           -- name/email or identifier
    link_url TEXT,                               -- canonical URL to proposal doc/card
    storage_hint TEXT,                           -- repo, drive, zotero, other
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_proposals_status ON proposals(status);

-- 3) Junction: project_proposals
CREATE TABLE IF NOT EXISTS project_proposals (
    project_proposal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    proposal_id INTEGER NOT NULL,
    relationship TEXT DEFAULT 'related',         -- originates, implements, relates
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (proposal_id) REFERENCES proposals(proposal_id),
    UNIQUE (project_id, proposal_id)
);

CREATE INDEX IF NOT EXISTS idx_project_proposals_project ON project_proposals(project_id);
CREATE INDEX IF NOT EXISTS idx_project_proposals_proposal ON project_proposals(proposal_id);
