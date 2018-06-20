#!/bin/sh

# replace env variables in configuration file
echo "modify config file..."

DOCKER_HOSTNAME=$(curl -XGET --unix-socket /var/run/docker.sock http://localhost/info | jq -r '.Name')
SER="s/<hostname>/$(echo $DOCKER_HOSTNAME | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')/g"
sed -i $SER /telegraf.conf

if [ "$MQTT_CONSUMER" = "true" ]; then
    cat mqtt_consumer.conf >> telegraf.conf
    TELEGRAF_MQTT_PW=`cat run/secrets/telegraf_mqtt_pw`
    SER="s/<telegraf_mqtt_pw>/$(echo $TELEGRAF_MQTT_PW | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')/g"
    sed -i $SER /telegraf.conf
fi

exec "$@"