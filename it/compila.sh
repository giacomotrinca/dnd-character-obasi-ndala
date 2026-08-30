#!/usr/bin/env bash
# Build the Italian character sheet only.
# (Delegates to the shared build script at the repository root.)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec "$ROOT/compila.sh" it
