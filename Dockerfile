# Top level build args
ARG build_for=linux/amd64

# The default shell on Linux is ["/bin/sh", "-c"] so no need of specifying the shell
# Please do not upgrade beyond python3.10.7 currently as dbt-spark does not support
# 3.11py and images do not get made properly
FROM --platform=$build_for python:3.10.7-slim-bullseye as base

ARG dbt_third_party=dbt-athena-community==1.7.2

# System setup
RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y --no-install-recommends \
    git \
    ssh-client \
    software-properties-common \
    make \
    build-essential \
    ca-certificates \
    libpq-dev \
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

# Env vars
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

# Update python
RUN python -m pip install --upgrade pip setuptools wheel --no-cache-dir

WORKDIR /usr/app

##
# dbt-third-party
##
FROM base as dbt_third_party
RUN python -m pip install --no-cache-dir "${dbt_third_party}"

# Metadata information labels
LABEL owner="zeki"
LABEL dbt = "central repository for zeki dbt projects"
LABEL zeki.maintainer="Usman usman@thezeki.com"