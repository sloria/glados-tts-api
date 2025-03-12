SHELL := /bin/bash

# Start server locally
.PHONY: serve
serve:
	@echo "Starting the API server..."
	@uv run litestar run --reload --port 5050 --debug

# Start in Docker
.PHONY: serve-docker
serve-docker:
	@echo "Starting the API server in Docker..."
	@docker compose up -d

# Stop local containers
.PHONY: stop
stop:
	@echo "Stopping container..."
	@docker compose down >/dev/null 2>&1
	@echo "Container stopped"
