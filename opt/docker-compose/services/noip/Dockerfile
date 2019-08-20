FROM alpine:latest

RUN apk add --no-cache curl bash dig

COPY update.sh /

WORKDIR /

CMD ["/bin/sh", "/update.sh"]