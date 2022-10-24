#!/bin/bash

set -x

echo PROJECT_ENVIRONMENT=$PROJECT_ENVIRONMENT

if [[ -z "$PROJECT_ENVIRONMENT" ]]; then
  echo "Missing PROJECT_ENVIRONMENT environment variable"
  exit 1
fi

echo activate docker-asterion-moduly

if [[ $(grep --invert-match --ignore-case ^dev <<<"$PROJECT_ENVIRONMENT") ]]; then
  /usr/bin/caddy run --config /etc/caddy/production/Caddyfile
else
  /usr/bin/caddy run --config /etc/caddy/localhost/Caddyfile --watch
fi
