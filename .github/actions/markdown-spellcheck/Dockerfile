FROM node:lts-alpine

LABEL "name"="Markdown Spellcheck"
LABEL "maintainer"="Jonathan Hartman"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="Markdown Spellcheck"
LABEL "com.github.actions.description"="Markdown spell checker"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
