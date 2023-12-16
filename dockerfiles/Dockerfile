FROM python:3.9-slim


WORKDIR /app


COPY . /app


RUN pip install --upgrade pip && pip install -r app/requirements.txt


EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE=app.settings

CMD ["bash", "scripts/entrypoint.sh"]
