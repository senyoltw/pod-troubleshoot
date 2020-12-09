FROM registry.hub.docker.com/library/alpine:3.11.5

ARG pip_installer="https://bootstrap.pypa.io/get-pip.py"

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --update --no-cache libssh2 nghttp2-dev openssl-dev openssl curl wget bash python groff jq less && \
    rm -fr /var/cache/apk/*

RUN curl ${pip_installer} | python && \
    pip install awscli

ENTRYPOINT ["sh", "-c"]
CMD ["while true; do date; sleep 3; done"]
