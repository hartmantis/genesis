FROM node:lts-alpine

LABEL "name"="Write Good"
LABEL "maintainer"="Jonathan Hartman"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Write Good"
LABEL "com.github.actions.description"="Write Good markdown linter"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
