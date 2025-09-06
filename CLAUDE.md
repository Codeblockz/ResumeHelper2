# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a web-based resume tailoring application that uses Ollama (local LLM) to automatically customize resumes for specific job postings. The app helps users optimize their resumes for Applicant Tracking Systems (ATS) and increase interview opportunities.

## Architecture (Implemented)

**Microservices with Docker Compose:**
- **Frontend**: Next.js with Tailwind CSS (Port 3000)
- **Backend**: FastAPI with Python (Port 8000) 
- **Database**: PostgreSQL (Port 5432)
- **LLM Service**: Ollama container (Port 11434)
- **Cache**: Redis (Port 6379)
- **Proxy**: Nginx reverse proxy (Port 80/443)

## Development Commands

### Script Purposes
- **`./scripts/setup.sh`** - One-time initialization (creates .env, builds images, checks requirements)
- **`./scripts/dev.sh`** - Daily development workflow (starts dev environment with hot reload)
- **`./scripts/ollama-setup.sh`** - Install/manage AI models
- **Test commands** - Quality assurance (run inside existing containers)

### Typical Workflow
```bash
# First time only
./scripts/setup.sh          # Environment prep, builds images
./scripts/ollama-setup.sh    # Install AI models

# Daily development
./scripts/dev.sh             # Start dev environment
# ... make code changes ...
docker-compose exec backend pytest  # Test changes
docker-compose down          # Stop when done
```

### Docker Commands
```bash
# Development with CPU-only Ollama
COMPOSE_PROFILES=cpu docker-compose up

# Development with GPU Ollama (if available)
COMPOSE_PROFILES=gpu docker-compose up

# Production deployment
./scripts/prod.sh

# View logs
docker-compose logs -f [service-name]

# Stop services
docker-compose down

# Clean rebuild
docker-compose down -v --remove-orphans && docker-compose up --build
```

### Testing
```bash
# Backend tests
docker-compose exec backend pytest

# Frontend tests  
docker-compose exec frontend npm test

# Linting
docker-compose exec backend black . && flake8 .
docker-compose exec frontend npm run lint
```

## Core Functionality Requirements

### Resume Processing
- Support PDF, DOCX, and TXT upload formats
- Parse and extract structured data (summary, experience, skills, education)
- Manual entry form and guided resume builder

### Job Analysis
- Text area for job description input
- URL import from job sites
- Extract key requirements, skills, and keywords
- Calculate compatibility scores

### AI Tailoring Engine
- Keyword optimization and natural integration
- Skills alignment and prioritization
- ATS optimization (proper headings, keyword density 2-3%)
- Content suggestions and achievement quantification
- Professional summary rewriting

## Ollama Integration Pattern

```python
# Standard Ollama API call structure
response = requests.post('http://localhost:11434/api/generate', 
                        json={
                            'model': 'llama3.1',
                            'prompt': tailoring_prompt,
                            'stream': False
                        })
```

## Performance Targets
- Resume parsing: < 5 seconds
- Job analysis: < 3 seconds  
- Tailoring generation: < 30 seconds
- Export processing: < 10 seconds

## Security Requirements
- Local processing for privacy
- No cloud storage of sensitive resume data
- User authentication and session management
- Rate limiting for API calls
- Secure file handling and cleanup

## Development Phases
1. **MVP**: Basic upload, parsing, Ollama integration, PDF export
2. **Enhancement**: Advanced ATS optimization, improved UI, multiple formats
3. **Advanced**: Multi-job management, templates, batch processing

## Testing Strategy
- Unit tests for parsing, analysis, keyword extraction
- Integration tests for Ollama API and end-to-end workflow
- User testing for interface usability and tailoring quality

## Project Structure

```
ResumeHelper2/
├── frontend/           # Next.js app (src/app/, components/, lib/)
├── backend/            # FastAPI app (app/api/, models/, services/)
├── nginx/              # Reverse proxy configs
├── docker/             # Custom Docker images
├── scripts/            # Development automation
└── docker-compose.yml  # Service orchestration
```

## Configuration

**Environment**: Copy `.env.example` to `.env` and update values
**Models**: llama3.1 (recommended), mistral, codellama
**URLs**: Frontend (localhost), API (localhost:8000), Docs (/docs)

## Key Implementation Details

- **Backend**: FastAPI at `backend/main.py`, models in `app/models/`
- **Frontend**: Next.js App Router, Tailwind CSS, React Query
- **Database**: PostgreSQL with SQLAlchemy, auto-migrations
- **AI Integration**: Ollama HTTP API at `http://ollama:11434`
- **Authentication**: JWT tokens, Redis sessions
- **File Processing**: PyPDF2, python-docx for resume parsing