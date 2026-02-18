#!/bin/bash

set -euo pipefail # Enable strict mode

# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Configuring Python Environment 🐍"

if ! command -v uv &>/dev/null; then
  echo "uv tool is not installed. Please install it to proceed."
  exit 1
fi

SUPPORTED_PYTHON_VERSIONS=(3.12 3.13 3.14)
DEFAULT_PYTHON_VERSION=3.14

uv python install "${SUPPORTED_PYTHON_VERSIONS[@]}"

uv python pin "$DEFAULT_PYTHON_VERSION"

uv python list

log_footer "Python environment configured successfully 🎉"
