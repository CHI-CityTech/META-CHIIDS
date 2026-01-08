# Project Class: Authoritative META-CHIIDS Control Plane

Welcome to the control plane for META-CHIIDS. This document explains the **Repository Authority Model** — how we organize authoritative materials, deliverables, and working drafts across the repository.

The authority model ensures clarity about what's official, what's published, and what's in-progress. It aligns with CHIIDS's philosophical commitment to preserving project integrity and making governance transparent.

---

## Why We Need an Authority Model

A meta-project repository serves multiple audiences:
- **Contributors** need to know which files control workflows and automation
- **Readers** need to distinguish polished deliverables from rough drafts
- **Governance** requires clear versioning and review for authoritative decisions

The authority model creates three tiers:
1. **Control Plane** (`project/`): Generative, canonical materials that define how CHIIDS operates
2. **Deliverables** (`docs/`): Published outputs intended for stakeholders and collaborators
3. **Drafts** (`project/_scratch/`): Non-authoritative experiments and discussion artifacts

---

## Directory Authority Model

### `project/` (Control Plane)

**Purpose:** Define and govern META-CHIIDS operations

**Contents:**
- `ROADMAP.md` – Canonical operational roadmap (priorities, milestones, timelines)
- `GLOSSARY.md` – Authoritative vocabulary and term definitions
- `GOVERNANCE.md` – Decision-making processes and governance rules
- `README.md` – This file; describes project class structure and authority model
- Template files – Required formats for proposal and project submissions
- `_scratch/` – Non-authoritative drafts and experiments

**Authority:** These files are inputs to:
- CI/CD automation (e.g., ingestion agents that read rules from here)
- Team workflows (they define how we operate)
- Schema and contract specifications (they are the "source of truth" for expectations)

---

### `docs/` (Deliverables & Outputs)

**Purpose:** Publish human-facing deliverables, reports, and curated summaries

**Contents:**
- Architecture documentation (parts 1–5)
- Integration guides and reference material
- Published reports and research summaries
- Ecosystem and project hierarchy documentation
- API documentation and usage guides

**Authority:** These files are **outputs** of project activity and planning. They are:
- Intended for readers inside and outside the organization
- Derived from `project/` control-plane decisions
- Occasionally updated to reflect implementation experiences

---

### `project/_scratch/` (Non-Authoritative Drafts)

**Purpose:** Hold temporary artifacts, experiments, and AI-collaboration materials

**Contents:**
- Rough drafts and brainstorms
- AI-generated briefings and discussion documents
- Analysis notes prepared for stakeholder feedback
- Experimental proposals and POCs
- Any file explicitly marked "for discussion only"

**Authority:** **NONE.** Files here are:
- Explicitly non-authoritative
- Retained for reference and traceability
- Eligible for promotion (to `project/` if they become rules; to `docs/` if they become deliverables)

**See:** [_scratch/README.md](_scratch/README.md) for promotion rules and detailed guidance.

---

## Quick Reference: Where Does It Go?

| Question | → | Location |
|----------|---|----------|
| Is it a rule, workflow, or template that tools use? | → | `project/` |
| Is it an operational decision or priority? | → | `project/ROADMAP.md` or `project/GOVERNANCE.md` |
| Is it a human-facing report or deliverable? | → | `docs/` |
| Is it a draft, experiment, or discussion artifact? | → | `project/_scratch/` |
| Do I need feedback before it's authoritative? | → | `project/_scratch/` (then promote) |

---

## Promotion Rules

### From `_scratch/` to `project/`

Promote a `_scratch/` file to `project/` **only if** it becomes:
- A controlling rule (e.g., data extraction rules, governance policy)
- An operational template or contract (e.g., schema specification)
- A reference that automation or tooling depends on

**Promotion process:**
1. Rename or move the file to `project/` (removing `_scratch/` path)
2. Add a one-line note: `Promoted from project/_scratch/ after review.`
3. Update this `README.md` to document the new file
4. Commit with message: `Promote [filename] from _scratch/ to project/ — now authoritative`

### From `_scratch/` to `docs/`

Promote a `_scratch/` file to `docs/` **only if** it becomes:
- A published report or research summary
- A human-facing guide intended for readers
- A curated deliverable reflecting team consensus

**Promotion process:**
1. Rename or move the file to appropriate `docs/` subdirectory
2. Add a one-line note: `Promoted from project/_scratch/ after review.`
3. Ensure it's written for external readers (not internal discussion)
4. Commit with message: `Publish [filename] to docs/ — ready for readers`

---

## Key Files in This Directory

| File | Purpose | Authority |
|------|---------|-----------|
| `ROADMAP.md` | Operational priorities, timeline, milestones | ✅ Canonical |
| `GLOSSARY.md` | Vocabulary and term definitions | ✅ Canonical |
| `GOVERNANCE.md` | Decision-making rules and approval processes | ✅ Canonical |
| `README.md` | This file; authority model and structure | ✅ Canonical |
| `_scratch/` | Non-authoritative drafts and experiments | ❌ Non-binding |

---

## Examples: Promotion Decisions

### Example 1: A Data Extraction Rule
**Scenario:** You've designed a rule for how to parse GitHub READMEs and extract project metadata.

- **Current state:** Documented in `project/_scratch/data_extraction_rules.md` (for discussion)
- **When it's finalized:** Promote to `project/DATA_EXTRACTION_RULES.md` (ingestion agents will read it)
- **How to promote:** Move file, add "Promoted from…" note, commit

### Example 2: An Architecture Diagram Analysis
**Scenario:** You've created a detailed analysis comparing old and new CHIIDS architectures.

- **Current state:** In `project/_scratch/DIAGRAM-ANALYSIS-FOR-CHATGPT.md` (discussion artifact)
- **If it becomes a deliverable:** Move to `docs/architecture/` and rewrite for readers
- **If it becomes a rule:** Promote to `project/ARCHITECTURE-RULES.md`
- **If it remains discussion:** Keep in `_scratch/` indefinitely (useful for context)

### Example 3: A Proposal Briefing
**Scenario:** You have a comprehensive briefing document for AI agents to generate proposals.

- **Current state:** In `project/_scratch/PROPOSAL_BRIEFING.md` (input for agents, not authoritative)
- **Never promote to `project/`:** This briefing is for agent input, not a control rule
- **Possibly promote to `docs/`:** If you want to publish it for readers to understand proposal generation
- **Keep in `_scratch/`:** If it's useful as context but not a deliverable

---

## CHIIDS Meta-Project Overview

**CHIIDS (CHI Integrated Digital System)** is a meta-project that defines the structural framework for organizing all CHI research. It is self-referential: both the framework-maker and a meta-project following its own structure.

**Purpose:**
- **Structural Framework:** Database schema, ontology, and architectural principles
- **Integration Infrastructure:** APIs, workflows, and platform connections
- **Coordination System:** The "digital nervous system" connecting meta-projects, coordination, and execution

**Status:** Bootstrap (P0 - Critical Path)

See [ROADMAP.md](ROADMAP.md) for development priorities and milestones.
