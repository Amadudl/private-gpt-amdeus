@echo off

rem Build and start containers

echo Building and starting containers...
docker compose up --build -d

rem Open default browser at the UI

echo Launching browser...
start "" http://localhost:8001


