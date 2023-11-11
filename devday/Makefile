TALK_TEXT ?= What is something great about San Francisco?

default: talk
.PHONY: default

demo:
	bash ./demo.sh "$(DEMO_NAME)"
.PHONY: demo

lint:
	poetry run ruff --fix -- .
.PHONY: ruff

sane:
	[ -x '$(shell command -v brew)' ] # Homebrew: https://brew.sh
	brew install python@3.11 poetry snyk/tap/snyk && poetry install
.PHONY: sane

scan:
	@[ -x '$(shell command -v snyk)' ] || brew install snyk/tap/snyk
	poetry run snyk test && poetry run snyk code test
.PHONY: scan

talk:
	poetry run python3 talk.py '$(TALK_TEXT)'
.PHONY: talk
