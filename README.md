# Two-layer achitecture

[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff)](#)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#)
[![Odoo](https://img.shields.io/badge/Odoo-714B67?logo=Odoo&logoColor=fff)](#)
[![Postgres](https://img.shields.io/badge/Postgres-%23316192.svg?logo=postgresql&logoColor=white)](#)

This project is an example of how to create and build a custom Docker image, following a **two-layer architecture** using **Docker** to deploy **Odoo**.

1. Application layer:

- Odoo running inside a Docker container, handling business logic, user interactions, and API requests.

2. Database layer:

- A PostgreSQL database running in a separate container, storing all business data, including products, customers and transactions.

To deploy this project it used **Docker Compose** where it defined services, volumes and networks to connect Odoo to PostgreSQL.

## Requirements

- Docker.

## Setup project

1. Configure environment variables in `.env` file.
2. Build project using `docker compose up --build`.
3. Open `https://localhost:8069` in your browser.

## Stop project

1. `docker compose down --rmi all` --> Stop and delete the containers and images.
