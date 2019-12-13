FROM swift:4.1 as builder
WORKDIR /build
COPY . .
RUN swift package resolve
RUN swift build -c release
RUN chmod +x pkg-swift-deps.sh
RUN ./pkg-swift-deps.sh /build/.build/x86_64-unknown-linux/release/Run

FROM busybox:glibc
WORKDIR /app
COPY --from=builder /build/swift_libs.tar.gz .
COPY --from=builder /build/.build/x86_64-unknown-linux/release/Run .

RUN tar -xzvf swift_libs.tar.gz -C /
RUN rm -rf usr/lib lib lib64 swift_libs.tar.gz

CMD ["./Run", "serve", "-e", "prod"]
