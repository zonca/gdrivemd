#!/bin/bash
# pull_from_gdoc.sh
# Pulls content from a Google Doc and saves it as a Markdown file.

DOC_ID=$1
OUT_FILE=$2

if [ -z "$DOC_ID" ] || [ -z "$OUT_FILE" ]; then
  echo "Usage: $0 <doc_id> <output_file.md>"
  exit 1
fi

echo "Pulling from Google Doc ($DOC_ID) to $OUT_FILE..."
gog docs export "$DOC_ID" --format md --out "$OUT_FILE" --force --no-input

if [ $? -eq 0 ]; then
  echo "Successfully exported Google Doc to $OUT_FILE"
else
  echo "Failed to export Google Doc"
  exit 1
fi
