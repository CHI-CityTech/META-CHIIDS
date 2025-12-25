# CHIIDS — Canonical Meta-Project Derivation & Registry Model

## Purpose of This Document

This document defines **how CHI maintains a canonical, yet dynamic, representation of its meta-project ecosystem**. It formalizes the relationship between:

- **CHI’s meta-project philosophy** (human-defined, stable)
- **GitHub organizational reality** (dynamic, operational)
- **CHIIDS** as the system of record that reconciles the two

This document is **normative**. It does not describe a snapshot of projects; it defines the *mechanism* by which the authoritative view is derived.

---

## Foundational Principle (Authoritative)

> **CHI does not maintain a static list of projects.**  
> **CHI maintains a canonical list of meta-project *topics* and dependency rules.**  
> **The current ecosystem is dynamically derived from the CHI GitHub organization and interpreted through CHIIDS.**

This principle ensures scalability, historical integrity, and resistance to documentation drift.

---

## Roles and Responsibilities

### CHI (Center for Holistic Integration)

CHI defines:
- what constitutes a *meta-project*
- what constitutes a *dependency*
- how long-lived projects persist beyond semesters
- how infrastructure and coordination are treated as first-class projects

CHI does **not** enumerate active projects.

---

### GitHub Organization (CHI-CityTech)

GitHub provides:
- the authoritative list of **existing repositories**
- repository-level **declarative metadata** (topics, archived status)
- evidence of activity, dormancy, or retirement

GitHub is the **source of operational truth**, not conceptual truth.

---

### CHIIDS (CHI Integrated Digital System)

CHIIDS is the **canonical structural registry**. It:

- stores the **canonical list of meta-project topics**
- stores **allowed dependency rules between topics**
- ingests GitHub repository metadata
- validates and normalizes that metadata
- derives live views of the ecosystem
- preserves historical snapshots

CHIIDS does not create projects; it **interprets** them.

---

## Canonical vs. Derived Data

### Canonical (Stored Directly in CHIIDS)

These change rarely and deliberately:

- Meta-project topics (e.g., BBS, BRPS, CAI, BSP)
- Topic descriptions and roles
- Allowed dependency types
- Topic-to-topic dependency rules

This constitutes the **conceptual backbone** of CHI.

---

### Derived (Computed from GitHub + Canonical Rules)

These change continuously:

- Which repositories exist
- Which repositories claim affiliation with which topics
- Which projects are active, dormant, or retired
- Which meta-projects are emphasized in a given period

These are **never hard-coded in documentation**.

---

## Canonical Database Model (Conceptual)

### MetaProjectTopics

A stable registry of CHI-recognized meta-project domains.

Fields include:
- topic_id (stable identifier)
- topic_name (e.g., BBS, BRPS)
- description
- is_root (boolean)
- status (active, deprecated)
- defined_by (CHI)

---

### MetaProjectDependencies

Defines allowed conceptual relationships between topics.

Fields include:
- parent_topic_id
- child_topic_id
- dependency_type (e.g., derives-from, supports, implements)
- rationale

These rules express statements such as:
- "BRPS derives from BBS"
- "BABS depends on BRPS and CAI"

---

## GitHub Metadata Ingestion Model

### Required Repository Metadata

Each repository in the CHI organization must declare:

1. **CHI affiliation** (implicit via organization)
2. **Repository role**
   - meta-project
   - infrastructure
   - coordination
   - execution
3. **Primary meta-project topic** (exactly one)
4. **Optional secondary topics** (dependencies, support roles, status)

These are expressed via **standardized GitHub Topics**.

---

## Derivation Pipeline (Normative)

1. Query GitHub API for all repositories in CHI-CityTech
2. Extract repository topics and archived status
3. Map topics to canonical MetaProjectTopics
4. Validate declared relationships against MetaProjectDependencies
5. Infer implicit relationships
6. Store a timestamped snapshot
7. Generate derived views (lists, graphs, reports)

At no point is a static project list manually maintained.

---

## Documentation Policy

- Organization-level documentation (in `.github`) **describes rules**, not state
- CHIIDS documentation **defines canonical structure and derivation mechanisms**
- Any published project list must be explicitly labeled as **derived** and **time-bound**

---

## Canonical Statement (Freeze This)

> **The authoritative representation of CHI’s meta-project ecosystem is derived dynamically from the CHI GitHub organization and interpreted through canonical topic and dependency rules stored in CHIIDS. No static list of projects is maintained.**

---

## Implications

This model:
- supports growth without refactoring
- preserves historical truth
- prevents documentation rot
- enables multiple simultaneous views (semester, grant, research)
- provides a stable substrate for AI-assisted reasoning

CHIIDS is therefore the **only correct home** for this document.