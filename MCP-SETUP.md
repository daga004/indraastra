# MCP Server Setup

This document describes how to set up and configure MCP (Model Context Protocol) servers for use with Claude Code.

## Quick Setup

1. Run the setup script:
   ```bash
   ./setup-mcp.sh
   ```

2. Edit the `.env` file with your actual API keys:
   ```bash
   nano .env
   ```

3. Use the configuration with Claude Code:
   ```bash
   claude --mcp-config claude-mcp-config.json
   ```

## MCP Servers Configured

### 1. Context7 MCP Server
- **Purpose**: Advanced context management
- **Command**: `npx -y @upstash/context7-mcp@latest`
- **Auto-approve**: None (manual approval required)

### 2. Perplexity MCP Server
- **Purpose**: Web search and documentation lookup
- **Command**: Node.js server at `/Users/dhiraj/Documents/Cline/MCP/perplexity-mcp/build/index.js`
- **Environment**: Requires `PERPLEXITY_API_KEY`
- **Auto-approve**: search, get_documentation, chat_perplexity, check_deprecated_code

### 3. Task Manager MCP Server
- **Purpose**: Task and project management
- **Command**: Python server via UV package manager
- **Auto-approve**: create_task, update_task_status, list_projects

### 4. Long Term Memory MCP Server
- **Purpose**: Vector database for persistent memory using Qdrant
- **Command**: Python server via UV package manager
- **Environment Variables**:
  - `QDRANT_URL`: Qdrant database URL (default: http://localhost:6333)
  - `COLLECTION_NAME`: Collection name (default: long-term-memory-collection)
  - `EMBEDDING_PROVIDER`: Provider for embeddings (default: lm-studio)
  - `LMSTUDIO_URL`: LM Studio API URL (default: http://localhost:1234/v1)
  - `LMSTUDIO_MODEL`: Embedding model (default: text-embedding-bge-m3)
- **Auto-approve**: find, add-relation, get-related-nodes

## File Structure

```
.
├── claude-mcp-config.json          # Actual MCP configuration (gitignored)
├── claude-mcp-config.json.template # Template for MCP configuration
├── .env                           # Environment variables (gitignored)
├── .env.template                  # Template for environment variables
├── setup-mcp.sh                  # Setup script
└── MCP-SETUP.md                  # This documentation
```

## Security

- API keys and sensitive configuration are stored in `.env` (gitignored)
- Configuration templates are version controlled
- Jujutsu (jj) version control files are gitignored

## Version Control

This project uses Jujutsu (jj) for version control. The setup script will initialize a jj repository if one doesn't exist.

## Troubleshooting

1. **MCP servers not connecting**: Check that all required dependencies are installed
2. **API key errors**: Verify that `.env` file contains valid API keys
3. **Path issues**: Ensure all paths in the configuration are correct for your system
4. **Permission errors**: Make sure the setup script is executable: `chmod +x setup-mcp.sh`

## Manual Configuration

If you need to manually configure MCP servers:

1. Copy the template: `cp claude-mcp-config.json.template claude-mcp-config.json`
2. Copy environment template: `cp .env.template .env`
3. Edit both files with your actual values
4. Use with Claude Code: `claude --mcp-config claude-mcp-config.json`