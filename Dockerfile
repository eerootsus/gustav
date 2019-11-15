FROM docker:19.03-dind

ARG BUILD_DATE

LABEL maintainer="eerootsus@gmail.com"
LABEL org.label-schema.name="eerootsus/gustav:latest"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.url="https://github.com/eerootsus/gustav"

ADD gustav-server.sh /gustav-server.sh
ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD gustav-server /gustav-server

EXPOSE 3000

ENTRYPOINT ["/docker-entrypoint.sh"]
