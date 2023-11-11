#!/usr/bin/env bash
# USAGE: bash ./demo.sh # or: `bash ./demo.sh beta` + pyproject.toml and *.py
set -euo pipefail
: "${HOMEBREW_NO_AUTO_UPDATE:=1}"
: "${HOMEBREW_NO_INSTALL_CLEANUP:=1}"

# run the demo.py script after installing poetry, Python v3.11, and langchain
[[ -x "$(command -v poetry)" ]] || brew install ffmpeg poetry python@3.11
poetry run python3 -c 'import langchain' 2>/dev/null || poetry install
exec poetry run python3 . "$@" # pass args from script
