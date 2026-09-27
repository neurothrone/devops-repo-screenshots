#!/usr/bin/env bash
set -uo pipefail

fail=0

check() {
  local name="$1"
  shift
  if "$@" >/dev/null 2>&1; then
    echo "  ok    $name"
  else
    echo "  FAIL  $name"
    fail=1
  fi
}

echo "==> Kontrollerar repots struktur"
check "docs/ finns"           test -d docs
check "scripts/ finns"        test -d scripts
check "CODEOWNERS finns"      test -f .github/CODEOWNERS
check "PR-mall finns"         test -f .github/pull_request_template.md

exit "$fail"
