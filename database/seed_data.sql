-- CHIIDS SQLite Seed Data
-- Initial CHI meta-projects, dependencies, and tags
-- Version: 1.0
-- Last Updated: December 2025

-- ============================================================================
-- INSERT TAGS
-- ============================================================================

INSERT INTO tags (tag_name, category, description) VALUES
-- Domain Tags
('Theory', 'domain', 'Theoretical framework and foundational research'),
('Engineering', 'domain', 'Systems design and technical implementation'),
('Creative', 'domain', 'Artistic and creative expression'),
('AI/HumanCollaboration', 'domain', 'Collaborative AI and partnership models'),
('Performance', 'domain', 'Performance art and presentation'),
('Research', 'domain', 'Academic research and investigation'),

-- Methodology Tags
('WorldBuilding', 'methodology', 'Fictional universe and world design'),
('Sensor-Driven', 'methodology', 'Environmental sensing and response'),
('Performance-Based', 'methodology', 'Performance as research methodology'),
('Modular', 'methodology', 'Modular design and component architecture'),
('Immersive', 'methodology', 'Immersive and embodied experience'),

-- Integration Tags
('GitHub', 'platform', 'Version control and project coordination'),
('WorldAnvil', 'platform', 'World-building and collaborative narrative'),
('Zotero', 'platform', 'Academic reference management'),
('OpenLab', 'platform', 'Public engagement and forum discussion'),
('GoogleDrive', 'platform', 'Collaborative documentation'),

-- Framework Tags
('BBS-Core', 'framework', 'Core Balanced Blended Space framework'),
('BBS-Testbed', 'framework', 'Testing environment for BBS theory');

-- ============================================================================
-- INSERT PROJECTS: CORE META-PROJECTS
-- ============================================================================

-- Root: Balanced Blended Space (BBS)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Balanced Blended Space',
    'balanced-blended-space',
    'Universal theoretical framework for combinative reality, mediation pathways, and multi-agent collaboration.',
    'The Balanced Blended Space (BBS) is CHI''s core theoretical framework that models reality as a blended space where physical, digital, and conceptual entities interact through mediation pathways. BBS forms the foundation for all CHI research and creative work. It is grounded in Hegel''s dialectic and extended through contemporary systems theory, providing a unified language for understanding combinative reality across disciplines.',
    'meta-project',
    'active',
    NULL,
    'Theory',
    'chi@example.org',
    'bbs'
);

-- BRPS: Blended Reality Performance System
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Blended Reality Performance System',
    'blended-reality-performance-system',
    'Modular engineering framework and testbed for BBS theory, implementing physical + digital + conceptual performance.',
    'BRPS is CHI''s primary engineering testbed for validating BBS theory through performance-based research. It provides modular components (stages, sensors, displays, interaction systems) that can be configured to test different mediation pathways and multi-agent scenarios. BRPS is the backbone for all CHI performance research and artistic work.',
    'meta-project',
    'active',
    1,
    'Engineering',
    'chi@example.org',
    'brps'
);

-- BSP: Blended Shadow Puppet
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Blended Shadow Puppet',
    'blended-shadow-puppet',
    'Flagship artistic testbed combining traditional shadow puppetry with digital and physical blending, including world-building.',
    'Blended Shadow Puppet (BSP) is CHI''s flagship artistic and research project that uses contemporary shadow puppet performance as a creative lens for exploring BBS theory. It integrates traditional puppet arts with digital projection, sensor-driven interaction, and collaborative narrative world-building. BSP demonstrates how BBS principles manifest in live performance and serves as both creative work and research methodology.',
    'meta-project',
    'active',
    2,
    'Creative',
    'chi@example.org',
    'bsp'
);

-- CAI: Collaborative AI
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Collaborative AI',
    'collaborative-ai',
    'Research and models for human-AI partnership, co-creation, and mediation systems.',
    'Collaborative AI (CAI) explores how large language models and AI systems can serve as genuine collaborators in human research and creative work. CAI develops models for effective human-AI mediation pathways, documenting both the technical implementations and the human collaboration patterns that emerge. All CHI projects can integrate CAI workflows for enhanced creativity and productivity.',
    'meta-project',
    'active',
    1,
    'AI/HumanCollaboration',
    'chi@example.org',
    'cai'
);

-- UNESCO World-Building
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'UNESCO World-Building',
    'unesco-world-building',
    'International research partnership exploring cultural transformation through collaborative fictional world-building.',
    'This project partners with UNESCO to use world-building as a methodology for understanding cultural transformation. It leverages BSP''s world-building infrastructure to explore how communities can collectively reimagine and redesign their cultural narratives. The project combines performance, technology, and cultural studies to create spaces for creative agency and intercultural dialogue.',
    'meta-project',
    'active',
    3,
    'Research',
    'chi@example.org',
    'unesco'
);

-- BABS: Bio-Aware Blended Spaces
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Bio-Aware Blended Spaces',
    'bio-aware-blended-spaces',
    'Integration of biometric sensing and biological awareness into blended performance systems.',
    'BABS extends BRPS with sophisticated biometric sensing (heart rate, movement, respiration, neural signals) to create bio-aware environments that respond to human embodiment. The project explores how biological information can become a mediation pathway in the blended space, creating systems that are sensitive to human physiology and emotional state.',
    'meta-project',
    'active',
    2,
    'Performance',
    'chi@example.org',
    'babs'
);

-- AI-Integrated Performance Systems (sub-project of BRPS - the intelligence layer)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'AI-Integrated Performance Systems',
    'ai-integrated-performance',
    'The intelligence and adaptive systems layer of BRPS: AI integration across music, media, visuals, and virtual environments.',
    'AI-Perf is BRPS''s intelligence subsystem that adds adaptive AI capabilities to the performance infrastructure. Includes Virtual Orchestra (AI-composed and performed music), Immersive Audio (spatial audio), AI Media Control (dynamic media synchronization), AI Blended Unreal Puppet (virtual character environments), Robotics Integration (robotic performers as mediation pathways), and other specialized performance AI systems. These systems explore how AI can be a genuine collaborator in real-time performance creation and response, making BRPS environments responsive and adaptive.',
    'sub-project',
    'active',
    2,
    'Performance',
    'chi@example.org',
    NULL
);

-- Virtual Orchestra (sub-project of AI-Integrated Performance)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Virtual Orchestra',
    'virtual-orchestra',
    'AI-composed and performed music generation for live performance environments.',
    'AI systems that compose music in real-time, respond to performer and audience inputs, and adapt to the evolving emotional and narrative arc of a performance. Virtual Orchestra explores generative music as a mediation pathway in the blended space.',
    'sub-project',
    'active',
    7,
    'Performance',
    'chi@example.org',
    NULL
);

-- Immersive Audio (sub-project of AI-Integrated Performance)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Immersive Audio',
    'immersive-audio',
    'Spatial audio design and AI-driven sound field manipulation for performance spaces.',
    'Advanced spatial audio techniques (ambisonics, binaural rendering, real-time convolution) combined with AI systems that dynamically adjust sound fields based on performer movement, gesture, and audience response. Creates immersive sonic environments as part of the blended performance.',
    'sub-project',
    'active',
    7,
    'Performance',
    'chi@example.org',
    NULL
);

-- AI Media Control (sub-project of AI-Integrated Performance)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'AI Media Control',
    'ai-media-control',
    'Intelligent media synchronization and dynamic visual control in performance environments.',
    'AI systems that control projection mapping, lighting, video synchronization, and visual effects in real-time based on performer input, audio analysis, and pre-programmed narrative structures. Enables seamless integration of media elements as responsive agents in the blended space rather than static backgrounds.',
    'sub-project',
    'active',
    7,
    'Performance',
    'chi@example.org',
    NULL
);

-- AI Blended Unreal Puppet Environment (sub-project of AI-Integrated Performance)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'AI Blended Unreal Puppet Environment',
    'ai-blended-unreal-puppet',
    'Virtual and hybrid puppet environments using AI-driven character behavior and environmental response.',
    'Integration with Unreal Engine to create virtual puppet environments where AI characters respond intelligently to physical performers. Enables hybrid performances where physical puppets, digital puppets, and AI-driven avatars share the same performance space as equals in the mediation system. Extends BSP world-building into immersive 3D/VR contexts.',
    'sub-project',
    'active',
    7,
    'Performance',
    'chi@example.org',
    NULL
);

-- Robotics Integration (sub-project of AI-Integrated Performance)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Robotics Integration',
    'robotics-integration',
    'Robotic performers and AI-controlled physical systems in live performance.',
    'Robotic agents that perform alongside human and puppet performers, responding to narrative cues and environmental conditions. Explores robots as mediation pathways in the blended space—embodied AI that shares physical presence with human and artistic elements.',
    'sub-project',
    'active',
    7,
    'Performance',
    'chi@example.org',
    NULL
);

-- CHIIDS: CHI Integrated Digital System (Infrastructure)
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'CHIIDS',
    'chiids',
    'Infrastructure and coordination system for all CHI meta-projects.',
    'CHIIDS (CHI Integrated Digital System) is the digital backbone that coordinates all CHI research and creative initiatives. It provides proposal management, student researcher coordination, team repository tracking, external system integration (GitHub, OpenLab, WorldAnvil, Zotero), and long-term archival. CHIIDS enables CHI to scale from individual projects to a complex ecosystem of interdependent initiatives.',
    'infrastructure',
    'active',
    NULL,
    'Research',
    'chi@example.org',
    NULL
);

-- Personalized LLMs
INSERT INTO projects 
(name, slug, description, long_description, type, status, primary_parent_id, domain, lead_contact, zotero_group_id)
VALUES 
(
    'Personalized LLMs',
    'personalized-llms',
    'Research on customized language models for individual collaboration and creativity.',
    'This sub-project within CAI explores how language models can be fine-tuned and adapted to individual users'' collaborative styles, research domains, and creative preferences. The goal is to develop LLMs that function as personal AI research and creative partners.',
    'sub-project',
    'active',
    4,
    'AI/HumanCollaboration',
    'chi@example.org',
    NULL
);

-- ============================================================================
-- INSERT SECONDARY DEPENDENCIES
-- ============================================================================

-- UNESCO depends on BSP and BBS
INSERT INTO dependencies (project_id, depends_on_id, relationship_type, description) VALUES
(5, 3, 'secondary', 'Uses BSP world-building infrastructure'),
(5, 1, 'secondary', 'Grounded in BBS theoretical framework');

-- BABS depends on BRPS and CAI
INSERT INTO dependencies (project_id, depends_on_id, relationship_type, description) VALUES
(6, 2, 'secondary', 'Extends BRPS performance capabilities'),
(6, 4, 'secondary', 'Integrates CAI for adaptive response');

-- AI-Integrated Performance depends on CAI (secondary dependency for its AI collaboration features)
-- Note: Primary parent is BRPS (defined in projects INSERT)
INSERT INTO dependencies (project_id, depends_on_id, relationship_type, description) VALUES
(7, 4, 'secondary', 'Core integration of CAI systems and collaborative AI models');

-- CHIIDS depends on all active projects (for ecosystem support)
INSERT INTO dependencies (project_id, depends_on_id, relationship_type, description) VALUES
(8, 1, 'secondary', 'Coordinates BBS research'),
(8, 2, 'secondary', 'Manages BRPS infrastructure'),
(8, 3, 'secondary', 'Tracks BSP productions'),
(8, 4, 'secondary', 'Supports CAI workflows'),
(8, 5, 'secondary', 'Manages UNESCO partnership'),
(8, 6, 'secondary', 'Monitors BABS integration'),
(8, 7, 'secondary', 'Coordinates performance systems');

-- Personalized LLMs as sub-project of CAI
-- (primary_parent relationship already defined in INSERT statement)

-- ============================================================================
-- INSERT PROJECT TAGS
-- ============================================================================

-- BBS Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'balanced-blended-space'), tag_id FROM tags WHERE tag_name IN ('Theory', 'BBS-Core', 'Zotero');

-- BRPS Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'blended-reality-performance-system'), tag_id FROM tags WHERE tag_name IN ('Engineering', 'BBS-Testbed', 'Modular', 'GitHub');

-- BSP Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'blended-shadow-puppet'), tag_id FROM tags WHERE tag_name IN ('Creative', 'WorldBuilding', 'Performance-Based', 'Immersive', 'WorldAnvil', 'GitHub');

-- CAI Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'collaborative-ai'), tag_id FROM tags WHERE tag_name IN ('AI/HumanCollaboration', 'Zotero', 'GitHub');

-- UNESCO Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'unesco-world-building'), tag_id FROM tags WHERE tag_name IN ('Research', 'WorldBuilding', 'WorldAnvil');

-- BABS Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'bio-aware-blended-spaces'), tag_id FROM tags WHERE tag_name IN ('Performance', 'Sensor-Driven', 'Modular');

-- AI-Integrated Performance Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'ai-integrated-performance'), tag_id FROM tags WHERE tag_name IN ('Performance', 'Immersive', 'AI/HumanCollaboration');

-- Virtual Orchestra Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'virtual-orchestra'), tag_id FROM tags WHERE tag_name IN ('Performance', 'AI/HumanCollaboration', 'Immersive');

-- Immersive Audio Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'immersive-audio'), tag_id FROM tags WHERE tag_name IN ('Performance', 'Immersive');

-- AI Media Control Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'ai-media-control'), tag_id FROM tags WHERE tag_name IN ('Performance', 'AI/HumanCollaboration');

-- AI Blended Unreal Puppet Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'ai-blended-unreal-puppet'), tag_id FROM tags WHERE tag_name IN ('Creative', 'Immersive', 'WorldBuilding', 'Performance');

-- Robotics Integration Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'robotics-integration'), tag_id FROM tags WHERE tag_name IN ('Performance', 'AI/HumanCollaboration');

-- CHIIDS Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'chiids'), tag_id FROM tags WHERE tag_name IN ('GitHub', 'OpenLab', 'WorldAnvil', 'Zotero', 'GoogleDrive');

-- Personalized LLMs Tags
INSERT INTO project_tags (project_id, tag_id) 
SELECT (SELECT project_id FROM projects WHERE slug = 'personalized-llms'), tag_id FROM tags WHERE tag_name IN ('AI/HumanCollaboration', 'Zotero');

-- ============================================================================
-- SET DEFAULTS FOR NEW FIELDS (Migration 002 compatibility)
-- ============================================================================

-- Ensure priority and maturity_level set for all existing projects
UPDATE projects SET priority = COALESCE(priority, 3);
UPDATE projects SET maturity_level = COALESCE(maturity_level, 'prototype');

-- Optional example proposal and linkage (kept minimal)
-- INSERT INTO proposals (title, slug, summary, status, link_url, storage_hint)
-- VALUES ('BSP Pilot Proposal', 'bsp-pilot-proposal', 'Initial pilot proposal for Blended Shadow Puppet enhancements.', 'accepted', NULL, 'repo');
-- INSERT INTO project_proposals (project_id, proposal_id, relationship)
-- SELECT (SELECT project_id FROM projects WHERE slug = 'blended-shadow-puppet'), proposal_id, 'originates'
-- FROM proposals WHERE slug = 'bsp-pilot-proposal';

-- ============================================================================
-- VERIFY DATA
-- ============================================================================

-- View all projects (for verification)
-- SELECT * FROM projects;

-- View project hierarchy
-- SELECT * FROM project_hierarchy;

-- View projects with dependencies
-- SELECT * FROM projects_with_dependencies;

-- View active projects
-- SELECT * FROM active_projects;
