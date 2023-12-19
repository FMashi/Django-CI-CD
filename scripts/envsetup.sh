#!/bin/bash
# envsetup.sh
echo "=== Setting up Python Virtual Environment and Dependencies ==="

# Check if virtual environment exists
if [ -d "env" ]; then
    echo "Python virtual environment 'env' already exists."
else
    echo "Creating Python virtual environment 'env'..."
    python3 -m venv env
fi
# Activate the virtual environment
source env/bin/activate || { echo "Failed to activate virtual environment."; exit 1; }

# Install/upgrade pip and install dependencies
echo "Installing/upgrading pip and installing dependencies..."
pip install --upgrade pip || { echo "Failed to upgrade pip."; exit 1; }
pip install -r app/requirements.txt || { echo "Failed to install dependencies."; exit 1; }

