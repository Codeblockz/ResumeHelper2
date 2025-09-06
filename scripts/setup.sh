#!/bin/bash

# Resume Tailor - Development Setup Script

set -e

echo "🚀 Setting up Resume Tailor development environment..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "✅ Created .env file. Please review and update the values as needed."
else
    echo "📝 .env file already exists."
fi

# Create upload directories
echo "📁 Creating upload directories..."
mkdir -p backend/uploads
mkdir -p nginx/logs

# Generate a random secret key
if [ ! -f .env ] || ! grep -q "SECRET_KEY=" .env || grep -q "your-super-secret-key" .env; then
    echo "🔐 Generating random secret key..."
    SECRET_KEY=$(openssl rand -base64 32)
    if [ -f .env ]; then
        sed -i "s/SECRET_KEY=.*/SECRET_KEY=${SECRET_KEY}/" .env
    else
        echo "SECRET_KEY=${SECRET_KEY}" >> .env
    fi
    echo "✅ Generated new secret key."
fi

# Pull required Docker images
echo "📦 Pulling Docker images..."
docker-compose pull

# Build containers
echo "🔨 Building containers..."
docker-compose build --no-cache

# Check if Ollama is configured for CPU or GPU
echo "🤖 Checking Ollama configuration..."
if command -v nvidia-smi &> /dev/null; then
    echo "🎮 NVIDIA GPU detected. You can use GPU acceleration for Ollama."
    echo "To use GPU: COMPOSE_PROFILES=gpu docker-compose up"
    echo "To use CPU: COMPOSE_PROFILES=cpu docker-compose up"
else
    echo "💻 No NVIDIA GPU detected. Will use CPU-only mode."
    echo "To start: COMPOSE_PROFILES=cpu docker-compose up"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "🔧 Next steps:"
echo "1. Review and update .env file if needed"
echo "2. Start the application:"
echo "   For CPU: COMPOSE_PROFILES=cpu docker-compose up"
echo "   For GPU: COMPOSE_PROFILES=gpu docker-compose up" 
echo "3. Visit http://localhost for the frontend"
echo "4. Visit http://localhost:8000/docs for API documentation"
echo ""
echo "🛑 To stop: docker-compose down"
echo "🗑️  To clean up: docker-compose down -v --remove-orphans"