.PHONY: help install dev test format lint clean docker-build docker-up docker-down

# Default target
help:
	@echo "Available commands:"
	@echo "  install     - Install dependencies"
	@echo "  dev         - Start development servers"
	@echo "  test        - Run tests"
	@echo "  format      - Format code with black and prettier"
	@echo "  lint        - Run linting checks"
	@echo "  clean       - Clean temporary files"
	@echo "  docker-build - Build Docker images"
	@echo "  docker-up   - Start Docker services"
	@echo "  docker-down - Stop Docker services"

# Install dependencies
install:
	@echo "Installing Python dependencies..."
	pip install -r requirements.txt
	@echo "Installing pre-commit hooks..."
	pre-commit install
	@echo "Downloading spaCy models..."
	python -m spacy download zh_core_web_sm
	python -m spacy download en_core_web_sm
	@echo "Installing frontend dependencies..."
	cd frontend && npm install

# Start development servers
dev:
	@echo "Starting development servers..."
	@echo "Backend will be available at http://localhost:8000"
	@echo "Frontend will be available at http://localhost:3000"
	docker-compose up --build

# Run tests
test:
	@echo "Running backend tests..."
	pytest tests/ -v
	@echo "Running frontend tests..."
	cd frontend && npm run test

# Format code
format:
	@echo "Formatting Python code..."
	black backend/
	isort backend/
	@echo "Formatting frontend code..."
	cd frontend && npm run format

# Run linting
lint:
	@echo "Linting Python code..."
	flake8 backend/
	@echo "Linting frontend code..."
	cd frontend && npm run lint

# Clean temporary files
clean:
	@echo "Cleaning temporary files..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -delete
	rm -rf .coverage htmlcov/

# Docker commands
docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

# Setup development environment
setup: install
	@echo "Setting up development environment..."
	@echo "Creating backend directories..."
	mkdir -p backend/{api,core,database,models,services,nlp,utils}
	mkdir -p frontend/src/{components,views,store,api}
	mkdir -p tests/{unit,integration}
	mkdir -p docs
	mkdir -p deployment
	@echo "Development environment setup complete!" 