#!/usr/bin/python
# -*- coding: UTF-8 -*-
# created: 19.04.2018
# author:  TOS
import time
import paho.mqtt.client as mqtt
import psutil
import json

if __name__ == '__main__':
    mqttc = mqtt.Client()
    mqttc.max_inflight_messages_set(1000)
    mqttc.connect('localhost', port=1883, keepalive=60)
    mqttc.reconnect_delay_set()

    while True:
        time.sleep(1)

        payload = {"cpu_percent": psutil.cpu_percent(), "virtual_memory_percent": psutil.virtual_memory().percent}
            # .format(psutil.cpu_percent(), psutil.virtual_memory().percent)

        result = mqttc.publish('events/system_load', qos=1, payload=json.dumps(payload))
        print(result)

