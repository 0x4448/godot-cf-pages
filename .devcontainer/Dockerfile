FROM mcr.microsoft.com/devcontainers/python:3.12-bookworm

RUN apt-get update && \
    apt-get install --no-install-recommends --yes \
    shellcheck \
    vim \
    && rm -rf /var/lib/apt/lists/*

COPY setup.sh /
RUN /setup.sh

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
