FROM alpine:latest
LABEL maintainer="Russ McKendrick <russ@mckendrick.io>" \
  description="This example Dockerfile installs NGINX." \
  version="1.0"

RUN apk update && \
  apk upgrade && \
  apk add --update nginx && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /run/nginx/

#COPY files/nginx.conf /etc/nginx/nginx.conf
#COPY files/default.conf /etc/nginx/conf.d/default.conf
#ADD files/html.tar.gz /usr/share/nginx/

EXPOSE 80/tcp

# ENTRYPOINT ["nginx"]
CMD ["nginx", "-g", "daemon off;"]
