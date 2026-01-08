-- CHIIDS SQLite Database Schema
-- Relational ontology for CHI meta-projects and their dependencies
-- Version: 1.0
-- Last Updated: December 2025

-- ============================================================================
-- CORE TABLES
-- ============================================================================

-- Projects: Core meta-project records
CREATE TABLE IF NOT EXISTS projects (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,  -- URL-safe identifier (e.g., 'blended-shadow-puppet')
    description TEXT,
    long_description TEXT,  -- Full description for ecosystem.md
    type TEXT NOT NULL DEFAULT 'meta-project',  -- 'meta-project', 'sub-project', 'initiative', 'infrastructure'
    status TEXT NOT NULL DEFAULT 'active',  -- 'active', 'inactive', 'planned', 'archived'
    primary_parent_id INTEGER,  -- Parent project (NULL if root)
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    domain TEXT,  -- e.g., 'Theory', 'Engineering', 'Creative', 'AI/Human Collaboration'
    lead_contact TEXT,  -- PI/faculty contact email
    repository_url TEXT,  -- Link to main repository
    zotero_group_id TEXT,  -- Zotero group identifier if applicable
    priority INTEGER DEFAULT 3,  -- 1 (highest) to 5 (lowest)
    maturity_level TEXT DEFAULT 'prototype', -- idea, proposal, prototype, pilot, production, archived
    FOREIGN KEY (primary_parent_id) REFERENCES projects(project_id)
);

-- Dependencies: Relationships between projects
CREATE TABLE IF NOT EXISTS dependencies (
    dependency_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    depends_on_id INTEGER NOT NULL,
    relationship_type TEXT NOT NULL DEFAULT 'secondary',  -- 'primary_parent' (redundant with projects.primary_parent_id), 'secondary', 'extends', 'integrates_with'
    description TEXT,  -- Why this dependency exists
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (depends_on_id) REFERENCES projects(project_id),
    UNIQUE (project_id, depends_on_id, relationship_type)
);

-- Tags: Domain and keyword tagging
CREATE TABLE IF NOT EXISTS tags (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag_name TEXT NOT NULL UNIQUE,
    category TEXT,  -- 'domain', 'methodology', 'platform', 'external_system', etc.
    description TEXT
);

-- Project_Tags: Many-to-many relationship between projects and tags
CREATE TABLE IF NOT EXISTS project_tags (
    project_tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id),
    UNIQUE (project_id, tag_id)
);

-- ============================================================================
-- OPTIONAL EXTENDED TABLES
-- ============================================================================

-- BBS_Syntax: Optional tracking of Balanced Blended Space syntax mapping
CREATE TABLE IF NOT EXISTS bbs_syntax (
    mapping_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    source_entity TEXT,  -- Input/source in BBS space
    vector_transformation TEXT,  -- Mediation pathway or transformation rule
    destination_entity TEXT,  -- Output/destination
    description TEXT,
    reference_url TEXT,  -- Link to proposal or documentation
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Project_Activity: Historical tracking of semester activity
CREATE TABLE IF NOT EXISTS project_activity (
    activity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    semester TEXT NOT NULL,  -- e.g., 'Fall2024', 'Spring2025'
    team_repo_url TEXT,  -- Link to semester team repository
    student_names TEXT,  -- Comma-separated list of students (or JSON array if expanded)
    goals TEXT,  -- Semester-specific goals
    status TEXT DEFAULT 'active',  -- 'active', 'paused', 'completed', 'archived'
    github_issue_url TEXT,  -- Primary coordination issue in StudentResearch
    project_card_url TEXT,  -- Link to project card in StudentResearch
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    UNIQUE (project_id, semester)
);

-- Proposals: Ideas and formal proposals linked to projects
CREATE TABLE IF NOT EXISTS proposals (
    proposal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    summary TEXT,
    status TEXT NOT NULL DEFAULT 'draft',  -- idea, draft, submitted, accepted, rejected, archived
    submitted_by TEXT,
    link_url TEXT,
    storage_hint TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Project_Proposals: Many-to-many linkage
CREATE TABLE IF NOT EXISTS project_proposals (
    project_proposal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    proposal_id INTEGER NOT NULL,
    relationship TEXT DEFAULT 'related',  -- originates, implements, relates
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (proposal_id) REFERENCES proposals(proposal_id),
    UNIQUE (project_id, proposal_id)
);

-- ============================================================================
-- INDEXES FOR PERFORMANCE
-- ============================================================================

CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_type ON projects(type);
CREATE INDEX idx_projects_primary_parent ON projects(primary_parent_id);
CREATE INDEX idx_dependencies_project ON dependencies(project_id);
CREATE INDEX idx_dependencies_depends_on ON dependencies(depends_on_id);
CREATE INDEX idx_project_tags_project ON project_tags(project_id);
CREATE INDEX idx_project_tags_tag ON project_tags(tag_id);
CREATE INDEX idx_project_activity_semester ON project_activity(semester);
CREATE INDEX IF NOT EXISTS idx_proposals_status ON proposals(status);
CREATE INDEX IF NOT EXISTS idx_project_proposals_project ON project_proposals(project_id);
CREATE INDEX IF NOT EXISTS idx_project_proposals_proposal ON project_proposals(proposal_id);

-- ============================================================================
-- VIEWS FOR COMMON QUERIES
-- ============================================================================

-- View: All projects with their primary parent name
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

-- View: Projects with secondary dependencies
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

-- View: Active projects only
CREATE VIEW active_projects AS
SELECT * FROM projects WHERE status = 'active';

-- View: Project tags summary
CREATE VIEW project_tags_summary AS
SELECT 
    p.project_id,
    p.name,
    GROUP_CONCAT(t.tag_name, ', ') AS tags
FROM projects p
LEFT JOIN project_tags pt ON p.project_id = pt.project_id
LEFT JOIN tags t ON pt.tag_id = t.tag_id
GROUP BY p.project_id;
