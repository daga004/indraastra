#!/bin/bash

# MCP Server Setup Script
set -e

echo "Setting up MCP servers for Claude Code..."

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    cp .env.template .env
    echo "Please edit .env with your actual API keys and configuration values."
    echo "File location: $(pwd)/.env"
else
    echo ".env file already exists."
fi

# Create MCP config from template
if [ ! -f "claude-mcp-config.json" ]; then
    echo "Creating MCP configuration..."
    
    # Source environment variables
    if [ -f ".env" ]; then
        export $(cat .env | grep -v '^#' | xargs)
    fi
    
    # Use envsubst to substitute environment variables in template
    envsubst < claude-mcp-config.json.template > claude-mcp-config.json
    echo "MCP configuration created at: $(pwd)/claude-mcp-config.json"
else
    echo "MCP configuration already exists."
fi

# Initialize jujutsu if not already initialized
if [ ! -d ".jj" ]; then
    echo "Initializing jujutsu repository..."
    jj git init --colocate
    echo "Jujutsu repository initialized with Git colocate."
else
    echo "Jujutsu repository already initialized."
fi

echo "MCP server setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit .env with your actual API keys"
echo "2. Run: source .env"
echo "3. Test MCP servers with: claude --mcp-config claude-mcp-config.json"