@echo off

rem Install dependencies and run PrivateGPT locally

echo Installing dependencies...
poetry install --no-interaction

echo Starting PrivateGPT in a new window...
start "PrivateGPT" cmd /k "set PGPT_PROFILES=local && poetry run python -m private_gpt"

echo Launching browser...
start "" http://localhost:8001


