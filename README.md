# SDLC Project Management Utility

A full-stack **MERN** (MongoDB, Express.js, React, Node.js) application for tracking tasks across Software Development Life Cycle (SDLC) phases. Built as a simple, functional project management tool with Kanban-style phase tracking and complete task history.

## Features

- **Homepage** — Overview of SDLC phases and app capabilities
- **User Management** — CRUD operations for team members (developer, tester, designer, manager)
- **Tasks Dashboard** — Kanban board showing tasks across 7 SDLC phases
- **My Tasks** — Filter and view tasks assigned to a specific user
- **Task History** — Full audit trail for every task (phase changes, assignments, updates)
- **Secured API** — CORS protection + API key authentication (`x-api-key` header)

## SDLC Phases (Agile/Kanban Model)

1. Backlog
2. Requirements
3. Design
4. Development
5. Testing
6. Deployment
7. Done

## Prerequisites

- [Node.js](https://nodejs.org/) v18 or higher
- [MongoDB](https://www.mongodb.com/) running locally (default: `mongodb://127.0.0.1:27017/sdlc_pm`)

## Local Setup

### 1. Install dependencies

```bash
cd "SDLC Project Management"
npm run install:all
```

Or install separately:

```bash
cd server && npm install
cd ../client && npm install
```

### 2. Configure environment

**Server** (`server/.env`):

```
PORT=5000
MONGODB_URI=mongodb://127.0.0.1:27017/sdlc_pm
API_KEY=dev-api-key-change-in-production
CLIENT_URL=http://localhost:5173
```

**Client** (`client/.env`):

```
VITE_API_URL=http://localhost:5000/api
VITE_API_KEY=dev-api-key-change-in-production
```

> The API key must match between server and client.

### 3. Start MongoDB

Ensure MongoDB is running on your machine. On Windows with a local install:

```bash
mongod
```

Or use [MongoDB Atlas](https://www.mongodb.com/atlas) and update `MONGODB_URI` in `server/.env`.

### 4. Run the application

**Terminal 1 — Backend:**

```bash
cd server
npm run dev
```

**Terminal 2 — Frontend:**

```bash
cd client
npm run dev
```

Open [http://localhost:5173](http://localhost:5173) in your browser.

## API Endpoints

All endpoints (except `/api/health`) require the header:

```
x-api-key: dev-api-key-change-in-production
```

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/health` | Health check (no auth) |
| GET/POST | `/api/users` | List / create users |
| GET/PUT/DELETE | `/api/users/:id` | Read / update / delete user |
| GET | `/api/tasks/phases` | List SDLC phases |
| GET/POST | `/api/tasks` | List / create tasks |
| GET/PUT/DELETE | `/api/tasks/:id` | Read / update / delete task |
| GET | `/api/tasks/:id/history` | Task history only |
| PATCH | `/api/tasks/:id/move` | Move task to a new phase |

Query params for tasks: `?assignedTo=<userId>&phase=<phase>`

## Folder Structure

```
SDLC Project Management/
├── README.md
├── package.json              # Root scripts
├── server/
│   ├── index.js              # Express app entry
│   ├── middleware/auth.js    # API key validation
│   ├── models/
│   │   ├── User.js           # User schema
│   │   └── Task.js           # Task + history schema
│   └── routes/
│       ├── users.js          # User CRUD
│       └── tasks.js          # Task CRUD + phase moves
└── client/
    ├── src/
    │   ├── api.js            # API client with auth header
    │   ├── App.jsx           # Router setup
    │   ├── components/       # Navbar, KanbanBoard, TaskHistoryModal
    │   └── pages/            # Home, Users, Dashboard, MyTasks
    └── vite.config.js
```

## Design Choices

- **Kanban over Waterfall UI** — Horizontal columns map naturally to SDLC phases and make task movement visible at a glance.
- **Embedded history array** — Task history is stored inside each task document for simple reads without joins; suitable for this scale.
- **API key auth** — Lightweight security simulation as required; easy to swap for JWT later.
- **Vite + React** — Fast dev experience ("vibe coding") with minimal boilerplate.
- **Separate client/server** — Classic MERN layout; each can be deployed independently.

## Future Improvements

- JWT-based user authentication and login
- Drag-and-drop Kanban cards
- Real-time updates with WebSockets
- Role-based access control (managers vs developers)
- Due dates, tags, and sprint/epic grouping
- Email notifications on assignment changes
- Migrate frontend to **Next.js** or **Flutter** (long-term scope)
- Add **Golang** or **Python** microservices for analytics (long-term scope)

## Submission Checklist

- [x] MERN stack implementation
- [x] User CRUD + Task CRUD
- [x] SDLC phase tracking with history
- [x] React UI (homepage, dashboard, user form, my tasks)
- [x] Secured API (CORS + API key)
- [x] MongoDB schemas for Users and Tasks
- [x] README with setup and design notes
- [ ] Record intro video (course, college, interests, career goals)
- [ ] Push to public Git repository (GitHub/GitLab)

## License

MIT
