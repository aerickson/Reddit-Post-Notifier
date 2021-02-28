FROM python:3.9-alpine

LABEL org.opencontainers.image.source https://github.com/RafhaanShah/Reddit-Post-Notifier

ENV PYTHONUNBUFFERED 1

RUN addgroup -g 10001 -S nonroot && adduser -u 10000 -S -G nonroot -h /home/nonroot nonroot
USER nonroot

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app.py .

ENTRYPOINT ["python", "app.py"]
