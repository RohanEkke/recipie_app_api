FROM python:3.9-alpine3.13
LABEL maintainer="recipeapp.com"

ENV PYTHONUNBUFFERED=1
ENV DEV=false

COPY ./requirments.txt /tmp/requirments.txt
COPY ./requirments.dev.txt /tmp/requirments.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8080

USER root

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirments.txt && \
    if [ "$DEV" = "true" ]; then /py/bin/pip install -r /tmp/requirments.dev.txt; fi && \
    rm -rf /tmp && \
    adduser --disabled-password --no-create-home django-user && \
    chown -R django-user:django-user /py

ENV PATH="/py/bin:$PATH"

USER django-user
