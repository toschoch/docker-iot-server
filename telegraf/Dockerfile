FROM telegraf:alpine

COPY telegraf.conf /
COPY mqtt_consumer.conf /
COPY entrypoint.sh /
RUN apk add --update --no-cache sed curl jq && chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "telegraf.conf"]