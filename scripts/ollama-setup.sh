#!/bin/bash

# Ollama Model Setup Script for Resume Tailor

set -e

OLLAMA_HOST=${OLLAMA_HOST:-"http://localhost:11434"}

echo "🤖 Setting up Ollama models for Resume Tailor..."

# Function to check if Ollama is running
check_ollama() {
    echo "🔍 Checking if Ollama is running..."
    if ! curl -s "$OLLAMA_HOST/api/tags" > /dev/null; then
        echo "❌ Ollama is not running at $OLLAMA_HOST"
        echo "Please start Ollama first:"
        echo "  docker-compose up ollama-cpu"
        echo "  or"
        echo "  COMPOSE_PROFILES=gpu docker-compose up ollama"
        exit 1
    fi
    echo "✅ Ollama is running"
}

# Function to pull a model
pull_model() {
    local model=$1
    echo "📥 Pulling model: $model"
    
    if curl -s -X POST "$OLLAMA_HOST/api/pull" \
        -H "Content-Type: application/json" \
        -d "{\"name\":\"$model\"}" | grep -q '"status":"success"'; then
        echo "✅ Successfully pulled $model"
    else
        echo "⚠️  Failed to pull $model or it's already available"
    fi
}

# Function to test a model
test_model() {
    local model=$1
    echo "🧪 Testing model: $model"
    
    response=$(curl -s -X POST "$OLLAMA_HOST/api/generate" \
        -H "Content-Type: application/json" \
        -d "{\"model\":\"$model\",\"prompt\":\"Hello\",\"stream\":false}")
    
    if echo "$response" | grep -q '"response"'; then
        echo "✅ Model $model is working correctly"
        return 0
    else
        echo "❌ Model $model test failed"
        return 1
    fi
}

# Main execution
check_ollama

echo ""
echo "📋 Recommended models for resume tailoring:"
echo "1. llama3.1 - Best overall performance (4.7GB)"
echo "2. mistral - Fast and efficient (4.1GB)"
echo "3. codellama - Good for structured content (3.8GB)"
echo ""

# Ask user which models to install
echo "Which models would you like to install?"
echo "[1] llama3.1 (recommended)"
echo "[2] mistral"
echo "[3] codellama"
echo "[4] All of the above"
echo "[5] Skip model installation"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        pull_model "llama3.1"
        test_model "llama3.1"
        ;;
    2)
        pull_model "mistral"
        test_model "mistral"
        ;;
    3)
        pull_model "codellama"
        test_model "codellama"
        ;;
    4)
        pull_model "llama3.1"
        pull_model "mistral" 
        pull_model "codellama"
        test_model "llama3.1"
        ;;
    5)
        echo "⏩ Skipping model installation"
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "📊 Available models:"
curl -s "$OLLAMA_HOST/api/tags" | jq -r '.models[]?.name' 2>/dev/null || echo "Use 'docker exec -it <ollama-container> ollama list' to see models"

echo ""
echo "✅ Ollama setup complete!"
echo "💡 You can now use these models in the Resume Tailor application"
echo "🔧 To change the default model, update OLLAMA_MODEL in your .env file"