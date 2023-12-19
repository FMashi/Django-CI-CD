#!/bin/bash
# entrypoint.sh
APP_PORT="${PORT:-8000}"

echo "Current working directory: $(pwd)"
echo "=== Running Django Migrations ==="

source venv/bin/activate || { echo "Failed to activate virtual environment."; exit 1; }

# Navigate to the app directory
cd /app/ || { echo "Failed to navigate to the 'app' directory."; exit 1; }

# Run migrations
echo "Applying migrations..."
python app/manage.py makemigrations || { echo "Failed to create migrations."; exit 1; }
python app/manage.py migrate || { echo "Failed to apply migrations."; exit 1; }
python app/manage.py collectstatic --noinput || { echo "collectstatic Failed."; exit 1; }

# Run the development server
echo "Starting Django development server..."
python app/manage.py runserver 0.0.0.0:8000
# /venv/bin/gunicorn --worker-tmp-dir /dev/shm app.wsgi:application --bind "0.0.0.0:${APP_PORT}"

