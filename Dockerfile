FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . /app

# Install required dependencies
RUN pip install --upgrade pip && pip install -r app/requirements.txt

# Copy the create_superuser.sh script to the container
COPY scripts/create_superuser.sh /app/
RUN chmod +x /app/create_superuser.sh


EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE=app.settings

CMD ["bash", "scripts/entrypoint.sh"]
