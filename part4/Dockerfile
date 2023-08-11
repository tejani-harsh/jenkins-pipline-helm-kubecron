FROM alpine:latest

RUN apk update && \
    apk add --no-cache curl bash jq && \
    apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing ssmtp && \
    apk add --no-cache --update ca-certificates && \
    apk add --no-cache --virtual .build-deps curl && \
    chmod 640 /etc/ssmtp/ssmtp.conf && \
    chown root:mail /etc/ssmtp/ssmtp.conf

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

COPY ./ssmtp.conf /etc/ssmtp/ssmtp.conf

WORKDIR /app

COPY ./mailpendingpod.sh /app/notifyMailForPendingPods.sh

RUN chmod +x /app/notifyMailForPendingPods.sh

EXPOSE 25

ENTRYPOINT ["/app/notifyMailForPendingPods.sh"]
