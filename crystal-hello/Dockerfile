FROM alpine:edge as base
WORKDIR /usr/src
RUN apk add --no-cache crystal libressl-dev libc-dev zlib-dev
COPY . .
RUN crystal build --release --static main.cr

FROM scratch
COPY --from=base /usr/src/main /crystal-http-microservice
CMD ["/crystal-http-microservice"]
