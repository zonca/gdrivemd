#!/bin/bash
# push_to_gdoc.sh
# Pushes a local Markdown file to a Google Doc, either overwriting or appending.

IN_FILE=$1
DOC_ID=$2
MODE=${3:-replace} # Can be 'replace' or 'append'

if [ -z "$IN_FILE" ] || [ -z "$DOC_ID" ]; then
  echo "Usage: $0 <input_file.md> <doc_id> [replace|append]"
  exit 1
fi

if [ ! -f "$IN_FILE" ]; then
  echo "File not found: $IN_FILE"
  exit 1
fi

if [ "$MODE" = "append" ]; then
  echo "Appending $IN_FILE to Google Doc ($DOC_ID)..."
  gog docs write "$DOC_ID" --file "$IN_FILE" --append --markdown --no-input
else
  echo "Overwriting Google Doc ($DOC_ID) with $IN_FILE..."
  gog docs write "$DOC_ID" --file "$IN_FILE" --replace --markdown --no-input
fi

if [ $? -eq 0 ]; then
  echo "Successfully pushed $IN_FILE to Google Doc"
else
  echo "Failed to push to Google Doc"
  exit 1
fi
