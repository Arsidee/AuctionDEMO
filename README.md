# AuctionDEMO

A simple auction web app built with Ruby on Rails. Admins create auctions and lots, registered users place bids, and the highest bidder at the end of the auction window wins.

Built as a portfolio/demo project, not production-grade.

## Tech Stack

- **Ruby on Rails 8.1** — server-side rendered, minimal Hotwire usage
- **PostgreSQL** — via Docker Compose
- **Devise** — separate `User` and `AdminUser` authentication models
- **Bootstrap 5** — via CDN
- **ActiveStorage** — local filesystem for lot images

---

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (with WSL 2 backend on Windows)
- Git

That's it — no local Ruby or Postgres installation needed.

---

## Setup

**1. Clone the repo**

```bash
git clone https://github.com/Arsidee/AuctionDEMO.git
cd AuctionDEMO
```

**2. Start the containers**

```bash
docker compose up --build
```

This builds the Rails image and starts both the `web` (Rails) and `db` (Postgres) containers. The first build takes a few minutes.

**3. In a second terminal, run migrations and seed the database**

```bash
docker compose exec web bin/rails db:migrate db:seed
```

**4. Open the app**

- Public site: [http://localhost:3000](http://localhost:3000)
- Admin login: [http://localhost:3000/admins/login](http://localhost:3000/admins/login)

---

## Demo Accounts

Seeded automatically by `db:seed`:

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@example.com | password123 |
| User | user@example.com | password123 |

---

## How to Test It

**As an admin (`/admins/login`):**
1. Log in with the admin credentials above
2. You'll land on the admin dashboard — create a new Auction (set start/end times)
3. Open the auction and add Lots, optionally uploading an image for each

**As a user (`/users/login`):**
1. Log in with the user credentials, or register a new account
2. Browse auctions on the home page
3. Click into an auction, then a lot, and place a bid
4. Bids must beat the current highest bid — the auction must also be active (within start/end times)

**Winning:**  
At the end of the auction window, the highest bid on each lot wins. The winner is shown on the lot page after the auction ends.

---

## Stopping / Restarting

```bash
# Stop containers (preserves database)
docker compose down

# Start again (no rebuild needed)
docker compose up
```

Database data persists in a Docker volume (`postgres_data`) between restarts.
