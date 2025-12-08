-- CHIIDS Database Migration: Initial Schema
-- Migration ID: 001_initial_schema.sql
-- Version: 1.0
-- Created: December 2025
-- Description: Create core tables for CHIIDS meta-project ontology

-- This migration file is part of the CHIIDS versioning system.
-- To apply this migration, execute:
--   sqlite3 chiids.db < database/schema.sql
--   sqlite3 chiids.db < database/seed_data.sql
--
-- Or use a database migration tool that supports SQLite.

-- ===========================================================================
-- Migration: CREATE INITIAL SCHEMA
-- ===========================================================================

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    long_description TEXT,
    type TEXT NOT NULL DEFAULT 'meta-project',
    status TEXT NOT NULL DEFAULT 'active',
    primary_parent_id INTEGER,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    domain TEXT,
    lead_contact TEXT,
    repository_url TEXT,
    zotero_group_id TEXT,
    FOREIGN KEY (primary_parent_id) REFERENCES projects(project_id)
);

-- Create dependencies table
CREATE TABLE IF NOT EXISTS dependencies (
    dependency_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    depends_on_id INTEGER NOT NULL,
    relationship_type TEXT NOT NULL DEFAULT 'secondary',
    description TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (depends_on_id) REFERENCES projects(project_id),
    UNIQUE (project_id, depends_on_id, relationship_type)
);

-- Create tags table
CREATE TABLE IF NOT EXISTS tags (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag_name TEXT NOT NULL UNIQUE,
    category TEXT,
    description TEXT
);

-- Create project_tags junction table
CREATE TABLE IF NOT EXISTS project_tags (
    project_tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id),
    UNIQUE (project_id, tag_id)
);

-- Create optional BBS syntax tracking table
CREATE TABLE IF NOT EXISTS bbs_syntax (
    mapping_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    source_entity TEXT,
    vector_transformation TEXT,
    destination_entity TEXT,
    description TEXT,
    reference_url TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Create project activity tracking table
CREATE TABLE IF NOT EXISTS project_activity (
    activity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    semester TEXT NOT NULL,
    team_repo_url TEXT,
    student_names TEXT,
    goals TEXT,
    status TEXT DEFAULT 'active',
    github_issue_url TEXT,
    project_card_url TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    UNIQUE (project_id, semester)
);

-- Create indexes
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_type ON projects(type);
CREATE INDEX idx_projects_primary_parent ON projects(primary_parent_id);
CREATE INDEX idx_dependencies_project ON dependencies(project_id);
CREATE INDEX idx_dependencies_depends_on ON dependencies(depends_on_id);
CREATE INDEX idx_project_tags_project ON project_tags(project_id);
CREATE INDEX idx_project_tags_tag ON project_tags(tag_id);
CREATE INDEX idx_project_activity_semester ON project_activity(semester);

-- Create views
CREATE VIEW project_hierarchy AS
SELECT 
    p.project_id,
    p.name,
    p.slug,
    p.type,
    p.status,
    p.description,
    pp.name AS parent_name,
    pp.project_id AS parent_id
FROM projects p
LEFT JOIN projects pp ON p.primary_parent_id = pp.project_id;

CREATE VIEW projects_with_dependencies AS
SELECT 
    p.project_id,
    p.name,
    p.slug,
    GROUP_CONCAT(d.depends_on_id, ',') AS secondary_dependencies,
    COUNT(d.dependency_id) AS dependency_count
FROM projects p
LEFT JOIN dependencies d ON p.project_id = d.project_id AND d.relationship_type = 'secondary'
GROUP BY p.project_id;

CREATE VIEW active_projects AS
SELECT * FROM projects WHERE status = 'active';

CREATE VIEW project_tags_summary AS
SELECT 
    p.project_id,
    p.name,
    GROUP_CONCAT(t.tag_name, ', ') AS tags
FROM projects p
LEFT JOIN project_tags pt ON p.project_id = pt.project_id
LEFT JOIN tags t ON pt.tag_id = t.tag_id
GROUP BY p.project_id;

-- ===========================================================================
-- Migration Status: COMPLETE
-- ===========================================================================
-- This migration successfully creates the CHIIDS initial schema.
-- Next step: Load seed_data.sql to populate initial projects.
