#!/usr/bin/env bash
set -euo pipefail

echo "==> Granskar skripten"
shellcheck scripts/*.sh

echo "==> Kontrollerar att modulens dokument finns"
for f in docs/01-delivery-analysis.md docs/02-branching-strategy.md; do
  test -f "$f" || { echo "Saknas: $f"; exit 1; }
done

echo "Build OK"
