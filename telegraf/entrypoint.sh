#!/bin/sh

# replace env variables in configuration file
echo "modify config file..."
TELEGRAF_MQTT_PW=`cat run/secrets/telegraf_mqtt_pw`
SER="s/<telegraf_mqtt_pw>/$(echo $TELEGRAF_MQTT_PW | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')/g"
sed -i $SER /telegraf.conf

exec "$@"