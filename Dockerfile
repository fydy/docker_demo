FROM alpine:edge as base
WORKDIR /usr/src/app
RUN apk --update --no-cache add curl libstdc++ libgcc && \
    curl -LO https://github.com/zeit/now-cli/releases/download/12.0.0-canary.70/now-alpine.gz && \
    gunzip now-alpine.gz && \
    chmod +x now-alpine && \
    mv now-alpine /bin/now
ARG NOW_TOKEN
COPY . .
RUN find . -maxdepth 1 -type d '!' -path '.' '!' -path './meta' '!' -path './.github' -print0 | \
    sort -z | \
    xargs -0 -n 1 -I{} ./meta/deploy {} "$NOW_TOKEN" && \
    echo "</ul></body></html>" >> meta/index.html

FROM jtyr/asmttpd
COPY --from=base /usr/src/app/meta/index.html /data
COPY --from=base /usr/src/app/meta/css /data/css
COPY --from=base /usr/src/app/meta/images /data/images
