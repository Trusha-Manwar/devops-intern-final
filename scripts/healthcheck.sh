#!/bin/bash

set -euo pipefail

URL="${1:-http://localhost:8080/healthz}"

if curl --fail --silent --show-error "$URL" > /dev/null; then
    echo "Health check passed: $URL"
else
    echo "Health check failed: $URL" >&2
    exit 1
fi
