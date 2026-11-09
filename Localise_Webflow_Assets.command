#!/bin/zsh
cd -- "$(dirname -- "$0")" || exit 1
clear
echo "Portfolio v342 — Webflow asset migration"
echo "This downloads the portfolio's remaining images and animations from Webflow."
echo "The complete ZIP will appear beside this folder once everything is downloaded."
echo
if ! command -v python3 >/dev/null 2>&1; then
  echo 'Python 3 was not found. Install Python 3, then run this file again.'
  echo 'https://www.python.org/downloads/'
  read '?Press Return to close this window...'
  exit 1
fi
python3 tools/localise_webflow_assets.py
STATUS=$?
echo
if [ "$STATUS" -ne 0 ]; then
  echo 'Migration was not completed. Do not delete the Webflow site yet.'
fi
read '?Press Return to close this window...'
exit "$STATUS"
