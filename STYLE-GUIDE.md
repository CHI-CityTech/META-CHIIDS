# META-CHIIDS Style Guide

## File Naming Convention

All documentation files in this repository follow a consistent naming pattern:

**Standard:** `lowercase_with_underscores.md`

### Examples
- ✅ `architecture.md`
- ✅ `chiids_roadmap.md`
- ✅ `project_hierarchy.md`
- ✅ `integration_paths.md`
- ✅ `worldanvil_workflow.md`

### Exceptions
- `README.md` — Always uppercase (GitHub/GitLab convention)
- `LICENSE.md` — Always uppercase (standard convention)
- `CONTRIBUTING.md` — Always uppercase (standard convention)

### Rationale
- Lowercase is easier to type and remember
- Underscores are clearer than hyphens in file browsers
- Consistent with Python/academic conventions used in this project
- Reduces confusion across case-sensitive (Unix) and case-insensitive (Windows) systems

## Internal Links

When linking to documentation files, use **relative paths** without the `.md` extension where possible:
```markdown
See [architecture](architecture) for system design.
Check [chiids_roadmap](chiids_roadmap) for timeline.
```

If using full paths:
```markdown
[Architecture Overview](docs/architecture/architecture.md)
```

## Code Comments & Documentation

- Use **sentence case** for headings (capitalize first word only, unless it's a proper noun)
- Use **active voice** when possible
- Keep line length to ~100 characters for readability

## Git Commits

Format: `<type>: <description>`

Examples:
- `docs: rename files to lowercase_with_underscores convention`
- `feat: add infrastructure platform evaluation`
- `fix: update internal links after file rename`

---

**Last updated:** January 2026  
**Maintained by:** Dr. David B. Smith
