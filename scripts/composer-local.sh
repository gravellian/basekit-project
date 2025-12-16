#!/usr/bin/env bash
#
# Wrapper to force Composer to use composer.local.json (path repos + symlinks).

set -euo pipefail

TARGET="${COMPOSER_OVERRIDE:-composer.local.json}"
if [ ! -f "$TARGET" ]; then
  TARGET="composer.json"
fi

export COMPOSER="$TARGET"

exec composer "$@"
