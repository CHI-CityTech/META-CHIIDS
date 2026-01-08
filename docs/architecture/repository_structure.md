# Repository Structure and Authority Guide

**Comprehensive Guide** — This document provides detailed explanation, examples, and workflows for the META-CHIIDS Repository Authority Model.

For the canonical authority rules, see **[project/AUTHORITY-MODEL.md](../../project/AUTHORITY-MODEL.md)**.

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

This separation aligns with CHIIDS's philosophical commitment to preserving project integrity and making governance transparent.

---

## Directory Authority Details

### `project/` (Control Plane)

**Purpose:** Define and govern META-CHIIDS operations

**Contents:**
- `AUTHORITY-MODEL.md` – Canonical authority rules (this document's source)
- `ROADMAP.md` – Operational roadmap (priorities, milestones, timelines)
- `GLOSSARY.md` – Authoritative vocabulary and term definitions
- `GOVERNANCE.md` – Decision-making processes and governance rules
- `README.md` – Directory index and navigation
- `architecture/` – System-defining architectural specifications
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

**See:** [project/_scratch/README.md](../../project/_scratch/README.md) for promotion rules and detailed guidance.

---

## Promotion Workflows

### From `_scratch/` to `project/`

Promote a `_scratch/` file to `project/` **only if** it becomes:
- A controlling rule (e.g., data extraction rules, governance policy)
- An operational template or contract (e.g., schema specification)
- A reference that automation or tooling depends on

**Promotion process:**
1. Rename or move the file to `project/` (removing `_scratch/` path)
2. Add a one-line note at the top: `Promoted from project/_scratch/ after review.`
3. Update `project/README.md` to document the new file
4. Commit with message: `Promote [filename] from _scratch/ to project/ — now authoritative`

### From `_scratch/` to `docs/`

Promote a `_scratch/` file to `docs/` **only if** it becomes:
- A published report or research summary
- A human-facing guide intended for readers
- A curated deliverable reflecting team consensus

**Promotion process:**
1. Rename or move the file to appropriate `docs/` subdirectory
2. Add a one-line note at the top: `Promoted from project/_scratch/ after review.`
3. Ensure it's written for external readers (not internal discussion)
4. Commit with message: `Publish [filename] to docs/ — ready for readers`

---

## Examples: Promotion Decisions

### Example 1: A Data Extraction Rule
**Scenario:** You've designed a rule for how to parse GitHub READMEs and extract project metadata.

- **Current state:** Documented in `project/_scratch/data_extraction_rules.md` (for discussion)
- **When it's finalized:** Promote to `project/DATA_EXTRACTION_RULES.md` (ingestion agents will read it)
- **How to promote:** Move file, add "Promoted from…" note, update project/README.md, commit

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

### Example 4: Meeting Notes
**Scenario:** You have notes from a planning meeting discussing future features.

- **Current state:** In `project/_scratch/planning_meeting_2026_01.md`
- **Extract decisions:** Pull out action items → add to `project/ROADMAP.md`
- **Extract vocabulary:** Add new terms → update `project/GLOSSARY.md`
- **Keep notes in `_scratch/`:** Retain for historical context, but they're not authoritative

---

## Common Questions

### Q: When should I create a new file in `project/` vs `docs/`?

**Use `project/` when:**
- Automation or tooling will read this file
- It defines a rule, policy, or constraint
- It's a template that others must follow
- It controls how work is done

**Use `docs/` when:**
- The file is meant for human readers (not automation)
- It's a report, guide, or explanation
- It documents what was done (not what should be done)
- It's intended for external audiences

### Q: Can files move from `docs/` back to `project/`?

Rarely. This would happen if a deliverable document becomes a controlling input. Example: A published style guide (`docs/style_guide.md`) that automation starts enforcing would become `project/STYLE_RULES.md`.

### Q: What if I'm not sure where a file belongs?

Start in `project/_scratch/`. You can always promote later once the file's purpose is clear.

### Q: Do files in `_scratch/` need to follow any structure?

No strict requirements, but:
- Use descriptive filenames
- Add a banner if it's non-authoritative: `> **Non-Authoritative Draft** — For discussion only.`
- Link to related authoritative files if they exist

---

## Related Documents

- **[project/AUTHORITY-MODEL.md](../../project/AUTHORITY-MODEL.md)** — Canonical authority rules
- **[project/README.md](../../project/README.md)** — Control plane directory index
- **[project/_scratch/README.md](../../project/_scratch/README.md)** — Non-authoritative drafts guidance
- **[docs/architecture/](.)** — All architecture documentation
