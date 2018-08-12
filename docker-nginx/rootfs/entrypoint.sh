#!/bin/sh

echo "Building configuration from templates"

confd -onetime -backend env

exec "$@"
