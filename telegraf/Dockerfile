FROM telegraf:alpine

COPY telegraf.conf /telegraf_template.conf
COPY entrypoint.sh /
RUN apk add --update --no-cache gettext && chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf", "--config", "telegraf.conf"]