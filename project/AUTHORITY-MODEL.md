# Repository Authority Model

**Canonical Reference** — This document defines the authority tiers for META-CHIIDS repository organization.

For detailed explanation, examples, and promotion workflows, see **[docs/architecture/repository_structure.md](../docs/architecture/repository_structure.md)**.

---

## Three-Tier Authority Model

1. **Control Plane** (`project/`): Canonical, generative materials that define how CHIIDS operates
2. **Deliverables** (`docs/`): Published outputs intended for stakeholders and collaborators  
3. **Drafts** (`project/_scratch/`): Non-authoritative experiments and discussion artifacts

---

## Directory Definitions

### `project/` (Control Plane)

**Purpose:** Define and govern META-CHIIDS operations

**Contents:**
- `ROADMAP.md` – Canonical operational roadmap (priorities, milestones, timelines)
- `GLOSSARY.md` – Authoritative vocabulary and term definitions
- `GOVERNANCE.md` – Decision-making processes and governance rules
- `AUTHORITY-MODEL.md` – This file; the repository authority model
- `README.md` – Index to project/ directory and key documents
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

## Promotion Criteria

**From `_scratch/` to `project/`:**  
Only if it becomes a controlling rule, operational template, or reference that automation depends on.

**From `_scratch/` to `docs/`:**  
Only if it becomes a published report, human-facing guide, or curated deliverable.

---

## Related Documents

- **[docs/architecture/repository_structure.md](../docs/architecture/repository_structure.md)** — Detailed explanation, examples, and workflows
- **[project/README.md](README.md)** — Control plane directory index
- **[project/_scratch/README.md](_scratch/README.md)** — Non-authoritative drafts guidance
