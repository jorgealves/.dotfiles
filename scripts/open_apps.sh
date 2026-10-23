#!/bin/bash

appsFile="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/starting-apps.local"

if [[ ! -f "$appsFile" ]]; then
  printf 'Missing apps file: %s\n' "$appsFile" >&2
  exit 1
fi

if [[ ! -s "$appsFile" ]]; then
  printf 'Apps file is empty: %s\n' "$appsFile" >&2
  exit 1
fi

while IFS= read -r app || [[ -n "$app" ]]; do
  [[ -z "$app" || "$app" == \#* ]] && continue
  echo "Opening $app"
  open -a "$app"
done <"$appsFile"
