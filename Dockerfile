FROM python:3.12.5-slim

RUN mkdir -p /sample_project
RUN mkdir -p /sample_project/tests
WORKDIR /sample_project

RUN apt-get update && apt-get install unzip -y

COPY makefile /sample_project
COPY src/sample_project /sample_project
COPY ./tests /sample_project/tests
COPY poetry.lock pyproject.toml /sample_project/

ENV POETRY_VIRTUALENVS_CREATE=false


CMD ["make", "test"]