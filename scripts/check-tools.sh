#!/usr/bin/env bash
# Checks that the tools this project needs are installed.
set -euo pipefail

tools=(git gh jq multipass)
missing=0
for t in "${tools[@]}"; do
  if command -v "$t" >/dev/null 2>&1; then
    printf 'ok       %s\n' "$t"
  else
    printf 'MISSING  %s\n' "$t"
    missing=1
  fi
done
exit "$missing"
