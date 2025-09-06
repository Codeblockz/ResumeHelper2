#!/bin/bash

# Resume Tailor - Development Server Script

set -e

echo "🔧 Starting Resume Tailor in development mode..."

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found. Running setup first..."
    ./scripts/setup.sh
fi

# Start services with development overrides
echo "🚀 Starting development services..."
COMPOSE_PROFILES=cpu docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build

echo "🛑 Development server stopped."