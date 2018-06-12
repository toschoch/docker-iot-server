#!/bin/sh

# replace env variables in configuration file
echo "use environment variables in config file telegraf_template.conf -> telegraf.conf"
envsubst < telegraf_template.conf > telegraf.conf

exec "$@"