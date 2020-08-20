#! /usr/bin/env bash
# shellcheck disable=SC2086

set -o errexit

MD5_CMD=${MD5_CMD:-md5sum}
CACHE_KEY_PREFIX=${CACHE_KEY_PREFIX:-}

dir_md5_checksm() {
  find $1 -type f -exec $2 {} \; | sort | $2 | cut -f1 -d ' '
}
