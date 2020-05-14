FROM alpine:latest

LABEL maintainer="TungNT"

# Install PowerDNS 
RUN apk --update --no-cache add pdns pdns-backend-remote && \
    rm -rf /var/cache/apk/*

ADD ./entrypoint.sh /
ADD ./pdns.conf /etc/pdns/

RUN mkdir -p /var/empty/var/run/ && \
    chmod +x /entrypoint.sh

# Ports
EXPOSE 53/udp 53/tcp

# Service Start
CMD ["/entrypoint.sh"]
