FROM mhart/alpine-node:10.7.0 as base
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn

FROM mhart/alpine-node:base-10.7.0
COPY --from=base /app /app
WORKDIR /app
COPY . .
CMD [ "node", "server.js" ]
