#!/bin/bash

if [ -z "$GITLAB_REGISTRATION_TOKEN" ];
then
    echo "GITLAB_REGISTRATION_TOKEN is required!"
    exit 1
fi
GITLAB_URL=${GITLAB_URL:-https://gitlab.com/}

sudo gitlab-runner register \
    --executor "shell" \
    --url ${GITLAB_URL} \
    --tag-list "shell,docker" \
    --run-untagged="true" \
    --locked="false" \
    --access-level="not_protected" \
    --non-interactive \
    --registration-token $GITLAB_REGISTRATION_TOKEN
