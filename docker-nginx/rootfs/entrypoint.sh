#!/bin/sh

set -e

echo "Building configuration from templates"

confd -onetime -backend env

exec "$@"
