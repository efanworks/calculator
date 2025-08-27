#!/bin/zsh

# Install Verdaccio (if not already installed)
if ! command -v verdaccio &> /dev/null; then
    echo "Install Verdaccio..."
    npm install -g verdaccio@latest
fi

# Start Verdaccio
echo "Starting private NPM registry at http://120.55.115.214:4873/"
verdaccio
