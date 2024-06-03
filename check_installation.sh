#!/bin/bash
set -e

echo "Checking installation of cowsay and fortune..."

# Debugging: Print PATH
echo "PATH: $PATH"

# List directories where games are commonly installed
echo "Contents of /usr/games:"
ls -la /usr/games

echo "Contents of /usr/local/games:"
ls -la /usr/local/games

# Check commands
if command -v cowsay && command -v fortune; then
    echo "Both cowsay and fortune are installed and available in PATH."
else
    echo "Error: cowsay or fortune is not installed or not in PATH."
    exit 1
fi
