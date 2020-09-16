FROM registry.hub.docker.com/library/alpine:3.11.5

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --update --no-cache libssh2 nghttp2-dev openssl-dev openssl curl wget && \
    rm -fr /var/cache/apk/*

RUN addgroup -S pod_group && adduser -S pod_user -G pod_group
USER pod_user

ENTRYPOINT ["sh", "-c"]
CMD ["while true; do date; sleep 3; done"]
