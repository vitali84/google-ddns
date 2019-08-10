#!/bin/bash
set -e


[[ -z "$USERNAME" ]] && { echo "Error: \$USERNAME is empty"; exit 1; }
[[ -z "$PASSWORD" ]] && { echo "Error: \$PASSWORD is empty"; exit 1; }
[[ -z "$HOST" ]] && { echo "Error: \$HOST is empty"; exit 1; }

. /app/google-dynamic-dns-update.sh
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"