.PHONY: init run test run_docker .poetry_check

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
	poetry run python -m magic_demo

run:
	poetry run python -m magic_demo
