---
project_class: true
layer: 1
meta_project: CHIIDS
---

# CHIIDS Meta-Project

## Overview

**CHIIDS (CHI Integrated Digital System)** is a meta-project that defines the structural framework (Layer 0) for organizing all CHI research. CHIIDS is self-referential: it is both the framework-maker and a meta-project that follows its own organizational structure.

## Purpose

CHIIDS provides:
- **Structural Framework (Layer 0):** Database schema, ontology, and architectural principles that all CHI projects conform to
- **Integration Infrastructure:** APIs, workflows, and connections between internal CHI systems and external platforms
- **Coordination System:** The "digital nervous system" that connects meta-projects, semester coordination, and execution work

## Relationship to Other Meta-Projects

- **Primary Parent:** None (CHIIDS is foundational)
- **Dependencies:** All meta-projects depend on CHIIDS for structural organization
- **Domain:** Infrastructure, Systems Architecture, Data Management

## Project Structure

This repository is organized according to the META-* Project Class pattern:

- `/project/` — Meta-project management (this directory)
  - `README.md` — About CHIIDS as a meta-project
  - `roadmap.md` — Development roadmap and priorities
  - `milestones.md` — Sprint planning and release schedule
  
- `/docs/` — Framework definition deliverables
  - `architecture/` — Layer 0 architectural specifications (Parts 1-5)
  - `reference/` — Supporting documentation
  
- `/database/` — Schema and data structure definitions
  - `schema.sql` — Relational database structure
  - `seed_data.sql` — Initial data
  
- `/api/`, `/frontend/` — Implementation code
- `/templates/` — Reusable templates for other projects

## Team & Ownership

- **Project Lead:** [To be assigned]
- **Data Science Lead:** [To be assigned]
- **Student Teams:** See `/project/milestones.md` for current assignments

## Key Documents

- **Development Roadmap:** [ROADMAP.md](ROADMAP.md)
- **Current Sprint:** [MILESTONES.md](MILESTONES.md)
- **Architecture:** [docs/architecture/](../docs/architecture/)
- **Database Schema:** [database/schema.sql](../database/schema.sql)

## Status

**Current Phase:** Bootstrap (P0 - Critical Path)

See [roadmap.md](roadmap.md) for detailed status and priorities.
