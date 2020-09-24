#!/bin/bash

set -x

nohup php-fpm &

echo PROJECT_ENVIRONMENT=$PROJECT_ENVIRONMENT

if [[ $(grep --invert-match --ignore-case ^dev <<< "$PROJECT_ENVIRONMENT") ]]; then
  /usr/bin/caddy run --config /etc/caddy/production/Caddyfile --watch
else
  /usr/bin/caddy run --config /etc/caddy/localhost/Caddyfile --watch
fi
