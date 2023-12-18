#!/bin/bash

# Activate virtual environment (if you're using one)
source /path/to/your/virtualenv/bin/activate

# Install or upgrade dependencies
pip install --upgrade -r requirements.txt

# Apply database migrations
python manage.py migrate

# Restart the Django application server (replace with your actual command)
sudo systemctl restart your-django-app.service
