#!/usr/bin/env bash
set -e

# Build Docker images
echo "Building Docker images..."
docker-compose build

# Start containers in the background
echo "Starting containers..."
docker-compose up -d

# Open default browser at the UI
echo "Launching browser..."
if command -v wslview >/dev/null 2>&1; then
    wslview http://localhost:8001
elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open http://localhost:8001 >/dev/null 2>&1 &
else
    explorer.exe http://localhost:8001 >/dev/null 2>&1 || true
fi
