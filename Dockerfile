FROM python:3.9-slim-buster

LABEL org.opencontainers.image.source https://github.com/RafhaanShah/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN addgroup -g 10001 -S nonroot && adduser -u 10000 -S -G nonroot -h /home/nonroot nonroot
USER nonroot

WORKDIR /app

# COPY requirements.txt .
# RUN pip install -r requirements.txt

COPY Pipfile Pipfile.lock /app/
RUN pipenv 
# RUN pip install --no-cache-dir pipenv && \
#     pipenv install --system --deploy --clear

COPY app.py /app/

ENTRYPOINT ["pipenv" "run" "python", "app.py"]
