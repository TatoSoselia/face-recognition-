FROM python:3.10.12
LABEL maintainer="https://github.com/TatoSoselia"

ENV PYTHONUNBUFFERED 1

# Install dependencies required for OpenCV
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /tmp/requirements.txt
COPY ./src /src
WORKDIR /src

RUN \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt && \
    adduser \
        --disabled-password \
        --no-create-home \
        tato

USER tato

CMD ["python", "./main.py"]
