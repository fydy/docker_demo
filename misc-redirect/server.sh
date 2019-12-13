#!/bin/bash
set -euo pipefail

if [ -z "${REDIRECT_URL-}" ]; then
  set_response_code "500"
  echo "The \$REDIRECT_URL environment variable must be set!"
  exit 2
fi

# Strip the trailing `/` from the base redirect URL, if there is one
base_url="${REDIRECT_URL%%/}"

# If the root URL was requested, don't append the beginning slash to the
# final redirect URL. Anything else gets appended to the base URL.
# (This is to make absolute base URLs with query-strings work as expected)
redirect_url=
if [ "$REQUEST_URI" != "/" ]; then
  redirect_url="$REQUEST_URI"
fi

set_response_code "${STATUS-301}"
set_response_header "Location" "$base_url$redirect_url"
