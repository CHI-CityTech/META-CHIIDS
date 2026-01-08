# CHIIDS Frontend Explorer

A modern React frontend for exploring the CHIIDS meta-project database. Query the local Datasette API to discover projects, filter by domain/type/status, and view project details and dependencies.

## Prerequisites

- Node.js 18+ installed
- Backend Datasette running on `http://localhost:8001`
  - Start with: `python3 -m datasette database/chiids.db`

## Setup

```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

The app will open at `http://localhost:5173`

## Features

- **Project Discovery** — Browse all CHIIDS projects with cards showing domain, type, status
- **Search & Filter** — Filter by domain (Engineering, Artistic, etc.), project type, and status
- **Project Details** — Click any project to see full information and dependencies
- **Responsive Design** — Works on desktop, tablet, and mobile

## Architecture

```
src/
├── components/          # Reusable UI components
│   ├── Header.jsx      # Navigation header
│   ├── ProjectCard.jsx # Project card component
│   └── FilterBar.jsx   # Search/filter controls
├── pages/              # Page components
│   ├── ProjectList.jsx # Home page with projects grid
│   └── ProjectDetail.jsx # Single project view
├── services/
│   └── api.js         # Datasette API client
├── App.jsx            # Main app with routing
└── index.css          # TailwindCSS directives
```

## API Integration

The app queries Datasette JSON API at `http://localhost:8001/database`. See `src/services/api.js` for available methods:

- `getProjects(filters)` — Get all projects with optional filtering
- `getProjectBySlug(slug)` — Get single project
- `getDependencies()` — Get all project dependencies
- `getProjectDependencies(slug)` — Get dependencies for a specific project
- `getDomains()`, `getProjectTypes()`, `getStatuses()` — Get available filter values

## Stack

- **React 18** — UI framework
- **Vite** — Fast bundler
- **React Router** — Client-side routing
- **TailwindCSS** — Utility-first CSS
- **Recharts** — Charting (prepared for future use)

## Build

```bash
npm run build
# Output: dist/
```

## Deployment

The built app can be deployed to Vercel, Netlify, or any static hosting:

```bash
npm run build
# Deploy the dist/ folder
```

**Important:** The app queries `http://localhost:8001` by default. For production, update the API base URL in `src/services/api.js` to point to your cloud-deployed Datasette instance (e.g., Railway, Render).

---

For backend setup, see [../docs/integrations/datasette.md](../docs/integrations/datasette.md)
