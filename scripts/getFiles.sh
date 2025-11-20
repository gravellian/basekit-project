#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SITE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
WORKSPACE_ROOT="$(cd "$SITE_ROOT/.." && pwd)"

SITE_KEY="$(basename "$SITE_ROOT")"

"$WORKSPACE_ROOT/scripts/site-files.sh" "$SITE_KEY"

