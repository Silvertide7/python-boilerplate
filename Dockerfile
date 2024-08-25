FROM python:3.12.5-slim-bookworm

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PYTHONDONTWRITEBYTECODE=1 \
  # poetry:
  POETRY_VERSION=1.8.2 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR='/var/cache/pypoetry' \
  POETRY_HOME='/usr/local'

RUN apt-get update && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y \
    curl \
  # Installing `poetry` package manager:
  # https://github.com/python-poetry/poetry
  && curl -sSL 'https://install.python-poetry.org' | python - \
  && poetry --version \
  # Cleaning cache:
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Setup folders
RUN mkdir -p sample_project/
RUN mkdir -p sample_project/src
RUN mkdir -p sample_project/tests
WORKDIR /sample_project

# Copy files
COPY makefile /sample_project/
COPY src/sample_project /sample_project/
COPY ./tests /sample_project/tests
COPY poetry.lock pyproject.toml /sample_project/

# Project initialization:
# hadolint ignore=SC2046
RUN --mount=type=cache,target="$POETRY_CACHE_DIR" \
  && poetry --version \
  && poetry install

CMD ["make", "test"]