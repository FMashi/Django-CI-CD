#!/bin/bash

# Stop the running containers
docker-compose down

# Pull the latest changes from the repository
git pull origin main

# Build and bring up the containers
docker-compose up --build -d

# Run any additional deployment steps (migrations, collectstatic, etc.)
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py collectstatic --noinput

# Restart the application server
docker-compose restart web

echo "Deployment completed successfully."
