FROM clux/muslrust as build
WORKDIR /usr/src
COPY . .
RUN cargo build --release

FROM scratch
COPY --from=build /usr/src/target/x86_64-unknown-linux-musl/release/rust-rocket /
ENV ROCKET_ENV prod
CMD ["/rust-rocket"]
