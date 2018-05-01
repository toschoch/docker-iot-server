FROM alpine:3.6
LABEL Maintainer="Tobias Schoch" \
      Description="Lightweight Mosquitto MQTT server based on Alpine Linux."

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients

# Expose MQTT port
EXPOSE 1883

ENV PATH /usr/sbin:$PATH

ADD mosquitto.conf /config/
#ADD ../wait-for-it.sh /
#RUN chmod +x /wait-for-it.sh
ADD script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["sh","script.sh"]