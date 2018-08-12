#!/bin/sh

echo "Building configuration from templates"

confd -onetime -backend env

echo "Fail2ban configuration:"

/usr/bin/fail2ban-client --dp -v

echo "Starting Fail2ban ..."

/usr/bin/fail2ban-client -f -v start
