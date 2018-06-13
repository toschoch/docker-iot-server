FROM telegraf:alpine

COPY telegraf.conf /
COPY entrypoint.sh /
RUN apk add --update --no-cache sed && chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "telegraf.conf"]