#!/usr/bin/env bash
set -euo pipefail

# Site-specific wrapper for the global BaseKit updater.
# Usage (from dev.gravellecreative.com3 root):
#   ./scripts/update-basekit_host.sh

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SITE_KEY="$(basename "$ROOT_DIR")"

"$ROOT_DIR/../scripts/site-update-basekit_host.sh" "$SITE_KEY"

