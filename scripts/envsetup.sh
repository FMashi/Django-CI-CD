#!/bin/bash
# envsetup.sh

if [ -d "env" ]; then
    echo "Python virtual environment exists."
else
    python3 -m venv env
fi

source env/bin/activate

# Install dependencies from requirements.txt
pip install --upgrade pip
pip install -r app/requirements.txt

# Check and create logs folder
if [ -d "logs" ]; then
    echo "Log folder exists."
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Adjust permissions
chmod -R 777 logs
