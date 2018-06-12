FROM alpine:3.6
LABEL Maintainer="Tobias Schoch" \
      Description="Lightweight Mosquitto MQTT server based on Alpine Linux."

COPY reload /

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients && chmod +x reload

# Expose MQTT port
EXPOSE 1883

ENV PATH /usr/sbin:$PATH

COPY mosquitto.conf /config/

ENTRYPOINT ["mosquitto", "-c", "/config/mosquitto.conf"]
