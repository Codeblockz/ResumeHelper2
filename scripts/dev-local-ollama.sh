#!/bin/bash

# Resume Tailor - Development Server with Local Ollama

set -e

echo "🔧 Starting Resume Tailor with local Ollama..."

# Check if local Ollama is running
if ! curl -s http://localhost:11434/api/tags > /dev/null; then
    echo "❌ Local Ollama is not running at localhost:11434"
    echo "Please start Ollama first:"
    echo "  ollama serve"
    exit 1
fi

echo "✅ Local Ollama detected"

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found. Running setup first..."
    ./scripts/setup.sh
fi

# Update .env to use local Ollama
if ! grep -q "OLLAMA_URL=http://host.docker.internal:11434" .env; then
    echo "🔧 Updating .env to use local Ollama..."
    sed -i 's|OLLAMA_URL=http://ollama:11434|OLLAMA_URL=http://host.docker.internal:11434|' .env
fi

# Start services without Ollama containers
echo "🚀 Starting development services with local Ollama..."
docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.local-ollama.yml up --build

echo "🛑 Development server stopped."