#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://62fa76e3.ngrok.io/pull/5d46b98f46243d809e7ce019 
fi
./ssg-build.sh
./inject-netlify-identity-widget.js _site
