#!/bin/sh

echo "wait for database"
sh wait-for-it.sh cratedb:1883
echo "crate db is up..."
mosquitto -c /config/mosquitto.conf