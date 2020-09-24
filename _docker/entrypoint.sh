#!/bin/bash

set -x

nohup php-fpm &

echo PROJECT_ENVIRONMENT=$PROJECT_ENVIRONMENT

if [[ $(echo "$PROJECT_ENVIRONMENT" | grep --invert-match --ignore-case ^dev) ]]; then
  /usr/bin/caddy run --config /etc/caddy/production/Caddyfile --watch
else
  /usr/bin/caddy run --config /etc/caddy/localhost/Caddyfile --watch
fi
