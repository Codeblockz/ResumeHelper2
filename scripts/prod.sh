#!/bin/bash

# Resume Tailor - Production Deployment Script

set -e

echo "🚀 Deploying Resume Tailor in production mode..."

# Check if .env exists and is configured for production
if [ ! -f .env ]; then
    echo "❌ .env file not found. Please create one based on .env.example"
    exit 1
fi

# Verify production settings
if grep -q "ENVIRONMENT=development" .env; then
    echo "⚠️  Warning: ENVIRONMENT is set to development in .env"
    echo "Please update to ENVIRONMENT=production for production deployment"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Pull latest images
echo "📦 Pulling latest Docker images..."
docker-compose pull

# Build and start with production overrides
echo "🔨 Building and starting production services..."
COMPOSE_PROFILES=cpu docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d

echo "✅ Production deployment complete!"
echo ""
echo "🔍 Service status:"
docker-compose ps
echo ""
echo "📊 To view logs: docker-compose logs -f"
echo "🛑 To stop: docker-compose down"