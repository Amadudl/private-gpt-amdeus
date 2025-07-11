@echo off

rem Build Docker images

echo Building Docker images...
docker-compose build

rem Start containers

echo Starting containers...
docker-compose up -d

rem Open default browser at the UI

echo Launching browser...
start "" http://localhost:8001


