#!/bin/sh

set -e
set -x
set -o pipefail

echo "--> Install spellchecker"
npm install -g markdown-spellcheck

echo "--> Spell check markdown files"
mdspell -r -n -a --en-us '**/*.md'
