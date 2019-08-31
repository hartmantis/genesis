#!/bin/sh

set -e

set +e
OUTPUT=$(bash -O globstar -c 'write-good **/*.md')
STATUS=$?
echo "$OUTPUT"
set -e

if [ $STATUS = 0 ]; then
  exit 0
fi

COMMENT="#### \`write-good\` Failed
$OUTPUT
*Workflow: \`${GITHUB_WORKFLOW}\`, Action: \`${GITHUB_ACTION}\`*
"

PAYLOAD=$(echo '{}' | jq --arg body "$COMMENT" '.body = $body')
COMMENTS_URL=$(jq -r .pull_request.comments_url < /github/workflow/event.json)
curl -s -S -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" --data "$PAYLOAD" \
  "$COMMENTS_URL" > /dev/null

exit $STATUS
