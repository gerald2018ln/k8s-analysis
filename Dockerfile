FROM gliderlabs/alpine:latest
# skip as already installed: netstat, nslookup, telnet, traceroute, ping
# dig from bind-tools; ab from apache2-utils
RUN apk -v --update add --no-cache curl bind-tools apache2-utils mysql-client postgresql-client
RUN apk -v add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN addgroup -S app && adduser -S -g app app
WORKDIR /app
USER app
CMD ["/bin/sh", "-c", "while true; do sleep 60; done"]
