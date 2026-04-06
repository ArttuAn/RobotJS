# RobotJS

A small **React + TypeScript** app for browsing and editing projects. It uses **Redux** for state, **React Router** for navigation, and **json-server** as a local REST API so you can run everything offline.

---

## Features

- **Home** — landing view with app branding  
- **Projects** — paginated list with a “load more” control  
- **Project detail** — read-only view for a single project  
- **Forms** — validation for name, description, and budget when saving  

---

## Tech stack

| Layer | Choice |
|--------|--------|
| UI | React 18, TypeScript |
| State | Redux, redux-thunk |
| Routing | react-router-dom v6 |
| API (dev) | json-server (`api/db.json`) |
| Styling | mini.css |
| Tests | Jest, React Testing Library |

---

## Prerequisites

- **Node.js** 16+ (LTS recommended)  
- **npm** (bundled with Node)

---

## Getting started

**1. Install dependencies**

```bash
npm install
```

**2. Start the mock API** (serves `api/db.json` on port **4000**)

```bash
npm run api
```

**3. In another terminal, start the app** (default [http://localhost:3000](http://localhost:3000))

```bash
npm start
```

The UI expects the API at `http://localhost:4000`. If the API is not running, the projects list will show an error state (that behavior is covered by tests).

**Production build**

```bash
npm run build
```

---

## Testing

**Unit and integration tests (Jest + RTL)**

```bash
npm test
```

Tests live under `src/**/__tests__` and next to some modules (e.g. `home/HomePage.test.tsx`). Project-related examples include:

- `src/projects/__tests__/ProjectsPage-test.tsx`
- `src/projects/__tests__/ProjectList-test.tsx`
- `src/projects/__tests__/ProjectForm-test.tsx`
- `src/projects/__tests__/ProjectCard-test.tsx`
- `src/projects/__tests__/projectDetail-test.tsx`
- `src/projects/state/__tests__/projectReducer-test.ts`
- `src/projects/state/__tests__/projectActions-test.ts`
- `src/projects/__tests__/projectAPI-test.ts`

**Robot Framework (optional)**

End-to-end style scenarios are in the **`demo/`** directory:

| File | Role |
|------|------|
| `demo/smoketests.robot` | Smoke tests |
| `demo/integrationtests.robot` | Integration tests |
| `demo/systemtests.robot` | System tests |

Run them with Robot Framework when your environment is set up (browser drivers, base URL, etc.). Generated logs such as `demo/log.html` and `demo/report.html` are typical Robot output artifacts.

---

## Project layout

```
api/           # JSON DB + sample HTTP requests for manual API checks
demo/          # Robot Framework tests and reports
public/        # Static assets (e.g. logos)
src/
  home/        # Home page
  projects/    # Projects list, detail, forms, Redux slice, API client
  App.tsx      # Routes and shell layout
```

---

## API quick reference

With `npm run api` running:

| Method | URL | Notes |
|--------|-----|--------|
| GET | `http://localhost:4000/projects` | Supports `_page`, `_limit`, `_sort` query params |
| GET | `http://localhost:4000/projects/:id` | Single project |
| PUT | `http://localhost:4000/projects/:id` | Update body as JSON |

Additional `.http` examples are under `api/test/`.

---

## License

This repository does not include a license file in the tree; add one if you intend to distribute or reuse the code.
