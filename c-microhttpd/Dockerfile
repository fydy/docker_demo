FROM debian:buster-slim as base
WORKDIR /usr/src
RUN apt-get update && apt-get install -y gcc libmicrohttpd12 libmicrohttpd-dev
COPY . .
RUN gcc -o main main.c -Os -lmicrohttpd

FROM spritsail/busybox
COPY --from=base /usr/src/main /bin/main
COPY --from=base /usr/lib/x86_64-linux-gnu/libmicrohttpd* \
  /usr/lib/x86_64-linux-gnu/libgnutls* \
  /usr/lib/x86_64-linux-gnu/libz* \
  /usr/lib/x86_64-linux-gnu/libp11* \
  /usr/lib/x86_64-linux-gnu/libidn* \
  /usr/lib/x86_64-linux-gnu/libunistring* \
  /usr/lib/x86_64-linux-gnu/libtasn* \
  /usr/lib/x86_64-linux-gnu/libnettle* \
  /usr/lib/x86_64-linux-gnu/libhogweed* \
  /usr/lib/x86_64-linux-gnu/libgmp* \
  /usr/lib/x86_64-linux-gnu/libffi* \
  /usr/lib/
CMD ["/bin/main"]
