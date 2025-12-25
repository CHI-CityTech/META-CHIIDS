# CHIIDS Architecture Documentation

## Purpose of This Folder

This folder contains the **normative architectural specifications** for **CHIIDS (CHI Integrated Digital System)**.

Documents in this directory define **how the system is structured**, **where authority resides**, and **how canonical truth is derived**. They are not snapshots, tutorials, or implementation notes.

If there is ever a conflict between documentation elsewhere in the repository and documents in this folder, **the documents in this folder take precedence**.

---

## Scope of “Architecture” in CHIIDS

In CHIIDS, *architecture* refers to:

- system layering and responsibility boundaries  
- canonical vs. derived data  
- authority and governance of structure  
- interpretation of dynamic GitHub state  
- preservation of continuity across semesters  

It does **not** refer to:

- UI or presentation design  
- code style or implementation details  
- semester-specific workflows  
- individual project behavior  

---

## Documents in This Folder

### `ARCHITECTURE.md`  
**System-Level Architecture**

Defines:

- the three-layer CHIIDS model  
  - Meta-Project Layer  
  - Semester Coordination Layer  
  - Execution Layer  
- where canonical proposals live  
- the role of StudentResearch  
- how execution repositories accumulate work over time  
- automation and data flow across layers  

This document answers:

> *How is CHIIDS structured as a system?*

---

### `meta-project-registry.md`  
**Canonical Meta-Project Ontology & Derivation Rules**

Defines:

- the canonical list of **meta-project topics**  
- allowed **dependency types** between topics  
- conceptual parent–child relationships  
- what is canonical vs. what is derived  
- how GitHub repository metadata is ingested and interpreted  
- why no static project list is maintained  

This document answers:

> *How does CHIIDS determine the CHI ecosystem given that projects are dynamic?*

---

## Relationship Between the Documents

These documents are **complementary**, not redundant:

- `ARCHITECTURE.md` defines **system structure and data flow**
- `meta-project-registry.md` defines **ontological authority and derivation logic**

Neither document should duplicate the other.

Changes to:

- system layering or responsibilities → belong in `ARCHITECTURE.md`  
- meta-project topics or dependency rules → belong in `meta-project-registry.md`  

---

## Governance and Change Policy

Documents in this folder are **deliberately slow-changing**.

Any modification should:

- be intentional  
- be reviewed for downstream impact  
- preserve historical continuity  

Architectural rules **must not** be changed implicitly through:

- GitHub repository topics alone  
- semester-specific documentation  
- ad hoc scripts or automation  

---

## How to Use This Folder

- **New collaborators**: read this folder to understand how CHIIDS works  
- **Developers**: treat these documents as system constraints  
- **AI collaborators**: use these documents as canonical context  
- **Grant writers / reviewers**: this folder defines structural rigor  

---

## Summary

> This folder defines the authoritative architecture of CHIIDS, separating stable structural rules from dynamic project state and ensuring that the CHI ecosystem can evolve without losing coherence.
