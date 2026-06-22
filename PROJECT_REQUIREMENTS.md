# Project Requirements — SDLC Project Management Utility

This document captures the assignment requirements and maps them to the implementation.

## Objective

Build a simple, functional **MERN stack** web application that demonstrates full-stack proficiency: database setup, API endpoints, and an intuitive UI for project management across SDLC phases.

## Core Requirements Mapping

| Requirement | Implementation |
|-------------|----------------|
| React homepage | `client/src/pages/Home.jsx` |
| User management form | `client/src/pages/Users.jsx` |
| Tasks dashboard | `client/src/pages/Dashboard.jsx` (Kanban board) |
| User assigned tasks view | `client/src/pages/MyTasks.jsx` |
| Task CRUD API | `server/routes/tasks.js` |
| User CRUD API | `server/routes/users.js` |
| API security | CORS + `x-api-key` header (`server/middleware/auth.js`) |
| MongoDB: Tasks schema | `server/models/Task.js` |
| MongoDB: User schema | `server/models/User.js` |
| SDLC phase tracking | 7 phases: backlog → done |
| Task history on demand | `GET /api/tasks/:id/history` + `TaskHistoryModal` |

## SDLC Model

This project uses an **Agile/Kanban** interpretation of the SDLC:

- Tasks live in one phase at a time
- Users move tasks between phases via dropdown
- Every phase change is logged in `task.history[]`

## Technology Stack

| Layer | Technology |
|-------|------------|
| Database | MongoDB + Mongoose |
| Backend | Node.js + Express.js |
| Frontend | React 18 + Vite + React Router |
| Security | CORS, API key simulation |

## Future Technology Scope (Long-Term)

The codebase is structured to allow future migration:

- **Frontend:** Flutter, Next.js
- **Backend:** Golang, Python

Suggested migration path:

1. Keep REST API contract stable
2. Replace React client with Next.js (SSR/SSG) or Flutter (mobile)
3. Extract task analytics to a Python or Go microservice

## Submission Deliverables

1. **Source code** — `SDLC Project Management/` folder in this repository
2. **README.md** — Setup, design choices, improvements
3. **Intro video** — Record yourself covering:
   - Your name
   - Course and college
   - Year of study
   - Interests
   - Career goals
4. **Public Git repo** — Push to GitHub or GitLab and share the link

## Video Script Template

> "Hi, my name is [Name]. I'm studying [Course] at [College], currently in [Year].
> I'm interested in [topics — e.g., full-stack development, cybersecurity, AI].
> My career goal is to [goal — e.g., become a software engineer specializing in secure healthcare systems].
> For this project, I built a MERN stack SDLC project management tool that tracks tasks across development phases with full history auditing."

## Quick Start

See [README.md](./README.md) for full setup instructions.

```bash
cd "SDLC Project Management"
npm run install:all
# Start MongoDB, then:
cd server && npm run dev
cd client && npm run dev
```
