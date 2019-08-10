FROM alpine:3.10

RUN apk add --no-cache curl bash

COPY ./cronjobs/root /etc/crontabs/root
COPY /app /app
RUN chmod +x /app/*
RUN mkdir /logs

VOLUME ["/logs"]

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["crond", "-f"]

