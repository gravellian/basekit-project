#!/usr/bin/env bash
set -euo pipefail

# Resolve directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SITE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
WORKSPACE_ROOT="$(cd "$SITE_ROOT/.." && pwd)"

# Derive site key from the site root folder name
SITE_KEY="$(basename "$SITE_ROOT")"

# Call the global DB script with the inferred site key
"$WORKSPACE_ROOT/scripts/site-db.sh" "$SITE_KEY" "${@:-}"

