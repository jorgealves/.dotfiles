#!/bin/bash

#enforce file to be source and not executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This script should be sourced, not executed directly."
  exit 1
fi

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
RESET='\033[0m'

DATE_FORMAT='%Y-%m-%d %H:%M:%S'

log_header() {
  echo
  echo -e "${GREEN}----------------------------------------------------------------${RESET}"
  echo -e "${GREEN}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${GREEN} $1${RESET}"
  echo
}

log_footer() {
  echo
  echo -e "${GREEN}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${GREEN} $1${RESET}"
  echo -e "${GREEN}----------------------------------------------------------------${RESET}"
  echo
}

log_success() {
  echo -e "${GREEN}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${GREEN} $1${RESET}"
}

log_error() {
  echo -e "${RED}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${RED} $1${RESET}"
}

log_warning() {
  echo -e "${YELLOW}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${YELLOW} $1${RESET}"
}

log_info() {
  echo -e "${YELLOW}[$(date +"$DATE_FORMAT")] ${YELLOW}[$(basename "$0")]${YELLOW} $1${RESET}"
}
