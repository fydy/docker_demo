FROM elixir:1.7.2-alpine as builder

ARG MIX_ENV="prod"

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

WORKDIR /build
COPY . .
RUN mix do deps.get --only prod --force, deps.compile, compile
RUN mix phx.digest
RUN mix release

# epmd will fool Now's Automatic Port Discovery, we need to disable it.
# A way of doing it is to avoid starting as a node.
# http://erlang.org/doc/reference_manual/distributed.html#nodes
RUN sed -i -e 's/_configure_node$/# _configure_node/' _build/prod/rel/app/releases/0.0.1/libexec/config.sh

FROM alpine:3.8

RUN apk update && \
    apk add --no-cache bash openssl-dev

WORKDIR /app
COPY --from=builder /build/_build/prod/rel/app .

ENV APP_PORT=4000
CMD trap 'exit' INT; /app/bin/app foreground

