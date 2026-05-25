# gdrivemd Skill

A set of scripts (usable as a Gemini CLI skill or by any terminal-based AI agent) to keep a Google Doc and a Markdown file in a GitHub repository synchronized using the `gog` CLI.

## Workflows

### 1. Pull changes from Google Doc to local Markdown
Use this workflow when the Google Doc has been updated and you want to bring those changes into the local git repository (e.g., to create a Pull Request).

**Using the script:**
```bash
./scripts/pull_from_gdoc.sh <doc_id> <output_file.md>
```

### 2. Push changes from local Markdown to Google Doc
Use this workflow when the local Markdown file has been updated and you want to overwrite or append to the Google Doc.

**Using the script:**
```bash
# Overwrite the Google Doc completely
./scripts/push_to_gdoc.sh <input_file.md> <doc_id> replace

# Append to the Google Doc (merge changes at the bottom)
./scripts/push_to_gdoc.sh <input_file.md> <doc_id> append
```

## Features
- **Markdown Support**: Uses `gog docs export --format md` to pull docs and `gog docs write --markdown` to push.
- **Image Handling**: When pulling from Google Docs, images are automatically embedded directly into the Markdown file as base64 data URIs. When pushing, absolute image links are natively imported into the Google Doc.

## Requirements
* `gog` CLI installed and authenticated.
* Google Docs API enabled for your GCP project (`gcloud services enable docs.googleapis.com`).
