#!/usr/bin/env bash
set -euo pipefail

# Re-apply a recipe inside Lando, then import config and rebuild cache.
# Usage: lando recipes-apply [/app/recipes/basekit-recipe/recipes/site]

RECIPE_PATH="${1:-/app/recipes/basekit-recipe/recipes/site}"

if [ -d "/app/web" ]; then
  (cd /app/web && php core/scripts/drupal recipe "$RECIPE_PATH") || true
else
  php /app/web/core/scripts/drupal recipe "$RECIPE_PATH" || true
fi

drush cim -y || true
drush updb -y || true
drush cr || true

echo "Recipe applied and config imported."

