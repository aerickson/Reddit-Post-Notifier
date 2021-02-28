FROM python:3.9-alpine

LABEL org.opencontainers.image.source https://github.com/RafhaanShah/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN addgroup -g 10001 -S nonroot && adduser -u 10000 -S -G nonroot -h /home/nonroot nonroot
USER nonroot

WORKDIR /app

RUN pip install pipenv
COPY Pipfile Pipfile.lock /app/
RUN pipenv install

COPY app.py /app/

ENTRYPOINT ["pipenv" "run" "python", "app.py"]
