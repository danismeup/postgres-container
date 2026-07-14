#!/usr/bin/env bash
# Quick psql shell into the dev Postgres container.
# Pass optional args e.g.: ./cli.sh -c "SELECT version()"
set -euo pipefail
docker exec -it dev-postgres \
  psql -U dev -d devdb \
  "$@"
