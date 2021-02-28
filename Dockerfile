FROM python:3.9-alpine

LABEL org.opencontainers.image.source https://github.com/RafhaanShah/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN adduser -D python
USER python

WORKDIR /app

RUN pip install pipenv
COPY Pipfile Pipfile.lock /app/
RUN pipenv install

COPY app.py /app/

ENTRYPOINT ["pipenv" "run" "python", "app.py"]
