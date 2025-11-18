#!/usr/bin/env bash
set -euo pipefail

# Update BaseKit-related packages for this project and re-apply recipes.
# Usage (from project root):
#   ./scripts/update-basekit_host.sh

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if command -v composer >/dev/null 2>&1; then
  composer update gravellian/basekit gravellian/basekit-recipe gravellian/basekit-docs -W
else
  echo "composer not found on PATH. Please run the update manually:" >&2
  echo "  composer update gravellian/basekit gravellian/basekit-recipe gravellian/basekit-docs -W" >&2
  exit 1
fi

if command -v lando >/dev/null 2>&1; then
  lando recipes-apply || true
  lando drush updb -y || true
  lando drush cr || true
else
  echo "Lando not found; skipped recipe apply and Drush commands." >&2
fi

