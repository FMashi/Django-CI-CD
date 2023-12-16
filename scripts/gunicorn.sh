#!/bin/bash
# gunicorn.sh
# Activate virtual environment
source env/bin/activate

cd app

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input

echo "Migrations done"

cd ..

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload

# Start Gunicorn
sudo systemctl start gunicorn

echo "Gunicorn has started."

sudo systemctl enable gunicorn

echo "Gunicorn has been enabled."

sudo systemctl restart gunicorn


sudo systemctl status gunicorn
