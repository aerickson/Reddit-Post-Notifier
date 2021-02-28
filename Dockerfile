FROM python:3.9-slim-buster

LABEL org.opencontainers.image.source https://github.com/aerickson/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN groupadd -g 10001 -r nonroot && useradd -m --no-log-init -r -g nonroot nonroot

WORKDIR /app

RUN pip install --no-cache-dir pipenv

COPY app.py /app/

COPY Pipfile Pipfile.lock /tmp/
RUN cd /tmp && pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt

USER nonroot
ENTRYPOINT ["python", "app.py"]
