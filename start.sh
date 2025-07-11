#!/usr/bin/env bash
set -e

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is required to run this script." >&2
    echo "You can run PrivateGPT locally using Poetry instead:" >&2
    echo "  PGPT_PROFILES=local make run" >&2
    exit 1
fi

# Determine which compose command is available (docker compose or docker-compose)
if command -v docker-compose >/dev/null 2>&1; then
    COMPOSE_CMD="docker-compose"
elif docker compose version >/dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
else
    echo "Docker Compose is required to run this script." >&2
    echo "You can run PrivateGPT locally using Poetry instead:" >&2
    echo "  PGPT_PROFILES=local make run" >&2
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "Docker daemon is not running or not accessible." >&2
    echo "Start Docker or run locally with:" >&2
    echo "  PGPT_PROFILES=local make run" >&2
    exit 1
fi

echo "Building and starting containers..."
$COMPOSE_CMD up --build -d

# Open default browser at the UI
echo "Launching browser..."
if command -v wslview >/dev/null 2>&1; then
    wslview http://localhost:8001
elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open http://localhost:8001 >/dev/null 2>&1 &
else
    explorer.exe http://localhost:8001 >/dev/null 2>&1 || true
fi
