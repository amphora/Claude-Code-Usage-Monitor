#!/bin/bash
# Claude Code Usage Monitor - Quick Run Script
# Usage: curl -sSL https://raw.githubusercontent.com/amphora/Claude-Code-Usage-Monitor/docker/run.sh | bash

echo "🎯 Starting Claude Code Usage Monitor..."

# Run the Docker container
docker run -it --rm \
  -v "$HOME/.claude:/root/.claude:ro" \
  -e HOME=/root \
  ghcr.io/amphora/claude-code-usage-monitor:docker "$@"