.PHONY: init run test run_docker .poetry_check lint

.DEFAULT_GOAL := init

init: .poetry_check

.poetry_check: poetry.lock
	@poetry config virtualenvs.in-project true
	@poetry config virtualenvs.options.always-copy true
	@poetry config virtualenvs.prefer-active-python true
	poetry install
	@touch $@

poetry.lock: pyproject.toml
	poetry lock
	@touch $@

test:
	poetry run pytest tests

run:
	poetry run python -m src/magic_demo

lint:
	poetry run ruff check src/
	poetry run ruff check tests/

format:
	poetry run ruff format src/
	poetry run ruff format tests/