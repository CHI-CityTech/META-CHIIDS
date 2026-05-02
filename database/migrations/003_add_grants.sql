-- Migration 003: Add grants table and grant_projects junction
-- Tracks CHI grant lifecycle from solicitation through award/close
-- Version: 1.0
-- Date: 2026-04-18

-- ============================================================================
-- GRANTS TABLE
-- ============================================================================

CREATE TABLE IF NOT EXISTS grants (
    grant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    chi_grant_id TEXT NOT NULL UNIQUE,       -- e.g., CHI-2025-001
    proposal_id TEXT UNIQUE,                  -- e.g., CHI-PROP-2025-001
    chiids_proposal_slug TEXT,                -- maps to proposals.slug in CHIIDS
    short_title TEXT NOT NULL,               -- Brief human-readable label
    full_title TEXT,                         -- Official title on the application
    sponsor TEXT NOT NULL,                   -- Funding organization name
    sponsor_program TEXT,                    -- Specific program or funding call within sponsor
    pi TEXT,                                 -- Principal Investigator name
    co_pis TEXT,                             -- Comma-separated co-PI names
    status TEXT NOT NULL DEFAULT 'tracking', -- tracking | evaluating | pursuing | submitted | awarded | rejected | deferred | closed
    submission_date TEXT,                    -- YYYY-MM-DD
    decision_date TEXT,                      -- YYYY-MM-DD
    award_amount REAL,                       -- Dollar amount if awarded
    project_start_date TEXT,                 -- YYYY-MM-DD
    project_end_date TEXT,                   -- YYYY-MM-DD
    solicitation_folder TEXT,                -- Relative path: solicitations/YYYY-sponsor-short-title/
    proposal_folder TEXT,                    -- Relative path: proposals/YYYY-sponsor-short-title/
    award_folder TEXT,                       -- Relative path: awards/YYYY-sponsor-short-title/
    notes TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_updated TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- GRANT_PROJECTS: Links grants to CHI meta-projects in CHIIDS
-- ============================================================================

CREATE TABLE IF NOT EXISTS grant_projects (
    grant_project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    grant_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    relationship TEXT DEFAULT 'supports',    -- supports | funds | enabled_by
    notes TEXT,
    created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (grant_id) REFERENCES grants(grant_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    UNIQUE (grant_id, project_id)
);

-- ============================================================================
-- SEED DATA: Known grants as of 2026-04-18
-- ============================================================================

INSERT OR IGNORE INTO grants (
    chi_grant_id, proposal_id, chiids_proposal_slug, short_title, full_title, sponsor, sponsor_program,
    pi, status, submission_date, decision_date, award_amount,
    proposal_folder, award_folder
) VALUES (
    'CHI-2025-001',
    'CHI-PROP-2025-001',
    'proposal-oaa-ai-innovation-2025',
    'Integrated AI Ethics and Immersive Blended Learning Initiative',
    'Integrated AI Ethics and Immersive Blended Learning Initiative',
    'CUNY Office of Academic Affairs',
    'AI Innovation Fund',
    'Dr David B Smith',
    'awarded',
    '2025-12-01',
    '2026-01-16',
    25000,
    'proposals/2025-cuny-oaa-ai-innovation/',
    'awards/2025-cuny-oaa-ai-innovation/'
);

INSERT OR IGNORE INTO grants (
    chi_grant_id, proposal_id, chiids_proposal_slug, short_title, full_title, sponsor, sponsor_program,
    pi, status, submission_date, decision_date, award_amount,
    award_folder, notes
) VALUES (
    'CHI-2025-002',
    'CHI-PROP-2025-002',
    'proposal-avmi-gvsc-2025',
    'AVMI-GVSC Modeling and Simulation Ecosystem',
    'Modeling and Simulation Eco-System for Mobility Design in Multi-Domain Operations (GVSC Congressional Funding)',
    'US Army GVSC (via Worcester Polytechnic Institute pass-through)',
    'AVMI-GVSC10-2024',
    'David Smith',
    'awarded',
    '2025-10-07',
    '2025-10-07',
    50000,
    'awards/2025-avmi-gvsc-mobility-ecosystem/',
    'CUNY subcontract action is $50,000; broader CUNY team Year-1 budget is approximately $225,000; anticipated 4-5 year lifecycle; next-year funding approved; RF CUNY disbursement is pending and expected soon per latest correspondence; direct funding includes ATMOS system ($11,587.99 from Sweetwater quote 11113938 dated 2025-10-08) and the system is already in the lab; current-cycle CUNY undergraduate stipend line item is $2,250 (15 x 150 hours); graduate support is WPI-side.'
);

INSERT OR IGNORE INTO grants (
    chi_grant_id, proposal_id, chiids_proposal_slug, short_title, full_title, sponsor, sponsor_program,
    pi, co_pis, status, submission_date, decision_date, award_amount,
    proposal_folder, award_folder, notes
) VALUES (
    'CHI-2025-003',
    'CHI-PROP-2025-003',
    'proposal-cuny-irg-bsp-cai-2025',
    'CUNY IRG 2025 - Blended Shadow Puppetry and Collaborative AI',
    'Holistic Integration as Convergent Innovation: Blended Shadow Puppetry, Gamelan, and Collaborative AI',
    'CUNY Interdisciplinary Research Grant (IRG)',
    'Interdisciplinary Research Grant for Convergent Innovation',
    'Dr David B Smith',
    'Ann Delilkan; Michael Lipsky; Christopher Swift',
    'rejected',
    '2025-10-06',
    '2025-11-20',
    NULL,
    'proposals/2025-cuny-irg-bsp-cai/',
    NULL,
    'Proposal was not funded in the 2025 IRG cycle. Rejection message noted high competition and an approximately 10% funding rate; reviewer feedback requested stronger methodological specificity, technical grounding, and measurable evaluation design.'
);
