#!/usr/bin/env bash
# Render every reviewer pack in packs/ to a PDF in out/ using pandoc.
#
# Requirements:
#   - pandoc        https://pandoc.org/installing.html
#   - xelatex       from TeX Live / MacTeX / MiKTeX
#
# Usage:
#   ./build.sh                               # render all packs
#   ./build.sh 01_upper_tract_endourology    # render a single pack

set -euo pipefail

cd "$(dirname "$0")"
mkdir -p out

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc not found. Install from https://pandoc.org/installing.html" >&2
  exit 1
fi

render() {
  local src="$1"
  local stem
  stem="$(basename "$src" .md)"
  local out="out/${stem}.pdf"
  echo "render -> $out"
  pandoc "$src" \
    --from=gfm \
    --pdf-engine=xelatex \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V colorlinks=true \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -o "$out"
}

if [ $# -eq 0 ]; then
  for f in packs/*.md; do
    render "$f"
  done
else
  render "packs/$1.md"
fi

echo "done. PDFs in $(pwd)/out"
