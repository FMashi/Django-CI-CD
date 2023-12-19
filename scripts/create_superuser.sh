#!/bin/bash
# create_superuser.sh

# Set the DJANGO_SUPERUSER_EMAIL variable or use a default value
SUPERUSER_EMAIL="${DJANGO_SUPERUSER_EMAIL:-admin@gmail.com}"

# Set the DJANGO_SUPERUSER_USERNAME variable or use a default value
SUPERUSER_USERNAME="${DJANGO_SUPERUSER_USERNAME:-admin}"

# Set the DJANGO_SUPERUSER_PASSWORD variable or use a default value
SUPERUSER_PASSWORD="${DJANGO_SUPERUSER_PASSWORD:-default_password}"
# SUPERUSER_PASSWORD=$(openssl rand -hex 16)


# Activate the virtual environment
source venv/bin/activate || { echo "Failed to activate virtual environment."; exit 1; }

# Change to the app directory
cd /app/ || { echo "Failed to navigate to the 'app' directory."; exit 1; }

# Run migrations with --noinput flag
echo "Applying migrations..."
python app/manage.py migrate --noinput || true

# Create a superuser with the specified email and generated password
python app/manage.py createsuperuser --email "$SUPERUSER_EMAIL" --noinput --username "$SUPERUSER_EMAIL" --password "$SUPERUSER_PASSWORD" || true

# Print the generated password
echo "Django superuser created with email: $SUPERUSER_EMAIL and password: $SUPERUSER_PASSWORD"
