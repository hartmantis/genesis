#!/bin/sh

set -e
set -x
set -o pipefail

echo "--> Install write-good"
apk add bash
npm install -g write-good

echo "--> Check markdown files"
bash -O globstar -c 'write-good **/*.md'
