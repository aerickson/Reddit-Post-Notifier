FROM python:3.9-slim-buster

LABEL org.opencontainers.image.source https://github.com/aerickson/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN groupadd -g 10001 -r nonroot && useradd -m --no-log-init -r -g nonroot nonroot
USER nonroot

WORKDIR /app

COPY app.py Pipfile Pipfile.lock /app/

ENV PATH="$PATH:/home/nonroot/.local/bin"
RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy --clear 

ENTRYPOINT ["pipenv" "run" "python", "app.py"]
