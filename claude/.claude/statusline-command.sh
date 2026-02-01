#!/bin/bash
# Starship-inspired statusline for Claude Code
# Based on user's Starship configuration

# Read JSON input
input=$(cat)

# Extract workspace info
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Directory (bold cyan, truncated)
dir_name=$(basename "$cwd")
printf "\033[1;36m%s\033[0m" "$dir_name"

# Git branch and status (bold purple for branch, bold red for status)
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    # Get branch name with skip optional locks
    branch=$(git -C "$cwd" -c core.useBuiltinFSMonitor=false symbolic-ref --short HEAD 2>/dev/null || \
             git -C "$cwd" -c core.useBuiltinFSMonitor=false rev-parse --short HEAD 2>/dev/null)
    
    if [ -n "$branch" ]; then
        printf " \033[1;35m %s\033[0m" "$branch"
        
        # Git status indicators
        status_output=""
        
        # Check for modifications
        if ! git -C "$cwd" -c core.useBuiltinFSMonitor=false diff --quiet 2>/dev/null; then
            modified=$(git -C "$cwd" -c core.useBuiltinFSMonitor=false diff --name-only 2>/dev/null | wc -l | tr -d ' ')
            [ "$modified" -gt 0 ] && status_output="${status_output} ${modified}"
        fi
        
        # Check for staged changes
        if ! git -C "$cwd" -c core.useBuiltinFSMonitor=false diff --cached --quiet 2>/dev/null; then
            staged=$(git -C "$cwd" -c core.useBuiltinFSMonitor=false diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
            [ "$staged" -gt 0 ] && status_output="${status_output} ${staged}"
        fi
        
        # Check for untracked files
        untracked=$(git -C "$cwd" -c core.useBuiltinFSMonitor=false ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
        [ "$untracked" -gt 0 ] && status_output="${status_output} ${untracked}"
        
        # Print status if any
        [ -n "$status_output" ] && printf " \033[1;31m%s\033[0m" "$status_output"
    fi
fi

# Python environment (yellow)
if [ -f "$cwd/requirements.txt" ] || [ -f "$cwd/pyproject.toml" ] || [ -f "$cwd/Pipfile" ] || [ -f "$cwd/.python-version" ]; then
    # Check for virtual environment
    if [ -n "$VIRTUAL_ENV" ]; then
        venv_name=$(basename "$VIRTUAL_ENV")
        printf " \033[0;33m %s\033[0m" "$venv_name"
    elif [ -f "$cwd/.python-version" ]; then
        python_version=$(cat "$cwd/.python-version" 2>/dev/null)
        [ -n "$python_version" ] && printf " \033[0;33m %s\033[0m" "$python_version"
    fi
fi

# Node.js (green)
if [ -f "$cwd/package.json" ] || [ -f "$cwd/.nvmrc" ]; then
    if command -v node > /dev/null 2>&1; then
        node_version=$(node --version 2>/dev/null | sed 's/v//')
        [ -n "$node_version" ] && printf " \033[0;32m %s\033[0m" "$node_version"
    fi
fi

# Kubernetes (blue)
if [ -d "$cwd/k8s" ] || [ -d "$cwd/kubernetes" ] || [ -f "$cwd/kustomization.yaml" ]; then
    if command -v kubectl > /dev/null 2>&1; then
        k8s_context=$(kubectl config current-context 2>/dev/null)
        [ -n "$k8s_context" ] && printf " \033[0;34m󱃾 %s\033[0m" "$k8s_context"
    fi
fi

# Docker (blue)
if [ -f "$cwd/Dockerfile" ] || [ -f "$cwd/docker-compose.yml" ] || [ -f "$cwd/docker-compose.yaml" ]; then
    if [ -n "$DOCKER_CONTEXT" ] && [ "$DOCKER_CONTEXT" != "default" ]; then
        printf " \033[0;34m %s\033[0m" "$DOCKER_CONTEXT"
    fi
fi

# Model name and context usage
model_name=$(echo "$input" | jq -r '.model.display_name')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used_pct" ]; then
    # Color based on usage: green < 50%, yellow 50-80%, red > 80%
    if [ "$(echo "$used_pct < 50" | bc 2>/dev/null || echo 1)" -eq 1 ]; then
        color="\033[0;32m"  # green
    elif [ "$(echo "$used_pct < 80" | bc 2>/dev/null || echo 0)" -eq 1 ]; then
        color="\033[0;33m"  # yellow
    else
        color="\033[0;31m"  # red
    fi
    printf " ${color}[%s %.0f%%]\033[0m" "$model_name" "$used_pct"
else
    printf " \033[0;36m[%s]\033[0m" "$model_name"
fi

echo ""
