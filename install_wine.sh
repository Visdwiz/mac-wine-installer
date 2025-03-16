#!/bin/bash

set -e

# Check if Homebrew is installed, install if not
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully."

    # Ensure Homebrew is in the environment
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        echo "Setting up Homebrew environment..."
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Ensure Homebrew is up to date
brew update

# Install Wine
if ! brew list --cask | grep -q "wine-stable"; then
    echo "Installing Wine..."
    brew install --cask --no-quarantine wine-stable
    echo "Wine installed successfully."
else
    echo "Wine is already installed."
fi

# Install Rosetta (for Apple Silicon Macs)
if [[ $(uname -m) == "arm64" ]]; then
    echo "Checking and installing Rosetta..."
    softwareupdate --install-rosetta --agree-to-license || echo "Rosetta installation skipped or already installed."
fi

# Verify Wine installation
wine --version
