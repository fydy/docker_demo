FROM ocaml/opam:alpine as base
RUN opam depext -iy jbuilder
RUN opam install graphql-lwt jbuilder
COPY . /home/opam/src/graphql
RUN sudo chown opam.nogroup -R /home/opam/src/graphql

WORKDIR /home/opam/src/graphql

RUN opam config exec -- jbuilder build server.exe
RUN sudo cp /home/opam/src/graphql/_build/default/server.exe /usr/bin/server

FROM scratch
COPY --from=base /usr/bin/server /server
CMD ["/server"]