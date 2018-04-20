#!/bin/sh

echo "wait for database"
sh wait.sh cratedb:1883
echo "crate db is up..."
mosquitto -c /config/mosquitto.conf