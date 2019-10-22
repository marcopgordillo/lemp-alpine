FROM alpine:latest

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Dominic Taylor <dominic@yobasystems.co.uk>" \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.created=$BUILD_DATE

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen && \
  rm -f /var/cache/apk/*

ADD files/run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
  mkdir /scripts/pre-exec.d && \
  mkdir /scripts/pre-init.d && \
  chmod -R 755 /scripts

EXPOSE 3306/tcp

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
