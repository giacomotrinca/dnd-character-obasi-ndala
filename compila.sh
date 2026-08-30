#!/usr/bin/env bash
# Build the D&D character sheet for Obasi N'Dala.
# Usage: ./compila.sh [it|en|all]   (default: all)
#
# NOTE: pdflatex fails when run directly on /mnt/c (WSL DrvFs bug:
# "DumpStack.log.tmp: Permission denied"). For that reason every build
# happens in a temporary directory on ext4 (/tmp/build-<lang>) and the
# resulting PDF is copied back next to the .tex file.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

LANG_REQUEST="${1:-all}"

build() {
  local lang="$1"
  local src="$ROOT/$lang"
  local build="${TMPDIR:-/tmp}/obasi-build-$lang"
  local main=obasindala

  rm -rf "$build"
  mkdir -p "$build"

  cp "$src/$main.tex" "$build/"
  # Shared portrait / resources
  if compgen -G "$ROOT/assets/*" >/dev/null; then
    cp "$ROOT"/assets/* "$build/"
  fi

  (
    cd "$build"
    export LC_ALL=it_IT.UTF-8
    for i in 1 2 3; do
      pdflatex -interaction=nonstopmode -halt-on-error "$main.tex" >/dev/null || {
        echo "ERROR compiling $lang (pass $i). Log: $build/$main.log"
        tail -40 "$build/$main.log"
        exit 1
      }
    done
  )

  cp "$build/$main.pdf" "$src/$main.pdf"
  echo "OK: $src/$main.pdf"
}

case "$LANG_REQUEST" in
  it)  build it ;;
  en)  build en ;;
  all) build it; build en ;;
  *)   echo "Usage: $0 [it|en|all]" >&2; exit 1 ;;
esac
