#!/bin/bash

set -euo pipefail # Enable strict mode
# source libs
source "$(pwd)/lib/variables.sh"
source "$ROOT_DIR/lib/logs.sh"
source "$ROOT_DIR/lib/utils.sh"

log_header "Installing Homebrew"

# Find all Brewfile variants
declare -a BREWFILES
while IFS= read -r file; do
  BREWFILES+=("$file")
done < <(find "$ROOT_DIR" -maxdepth 1 -name "client_*Brewfile" -type f | sort)

# Select Brewfile
if [[ ${#BREWFILES[@]} -eq 0 ]]; then
  log_error "No Brewfiles found in $ROOT_DIR"
  exit 1
elif [[ ${#BREWFILES[@]} -eq 1 ]]; then
  BREWFILE="${BREWFILES[0]}"
  log_info "Using Brewfile: $(basename "$BREWFILE")"
else
  log_info "Multiple Brewfiles found:"
  for i in "${!BREWFILES[@]}"; do
    echo "  $((i + 1))) $(basename "${BREWFILES[$i]}")"
  done

  read -rp "Choose a Brewfile (1-${#BREWFILES[@]}): " choice

  if ! [[ "$choice" =~ ^[0-9]+$ ]] || ((choice < 1 || choice > ${#BREWFILES[@]})); then
    log_error "Invalid choice"
    exit 1
  fi

  BREWFILE="${BREWFILES[$((choice - 1))]}"
  log_info "Selected: $(basename "$BREWFILE")"
fi

if ! command -v brew &>/dev/null; then
  log_error "Homebrew is not installed. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade
brew bundle install -v --file="$BREWFILE" --upgrade --force-cleanup

log_footer "Homebrew installed successfully 🎉"
