FROM node:12.13-alpine

ARG BUILD_DATE

LABEL maintainer="eerootsus@gmail.com"
LABEL org.label-schema.name="eerootsus/gustav-server"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.url="https://github.com/eerootsus/gustav"

ADD . /gustav-server

WORKDIR /gustav-server
RUN npm config set color false
RUN npm ci

EXPOSE 3000
ENV DEBUG=*

CMD ["node", "index.js"]
