#!/bin/bash

# Install dependencies for LilyPond on macOS

echo "Installing LilyPond dependencies for macOS..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install Homebrew first:"
    echo "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Install LilyPond
echo "Installing LilyPond via Homebrew..."
brew install lilypond

echo "✅ LilyPond installation complete!"
echo "You can now run './generate-pdfs.sh' to convert .ly files to PDFs"