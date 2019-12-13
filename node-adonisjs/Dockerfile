FROM mhart/alpine-node:10 as build
WORKDIR /usr/src
COPY package.json ./
RUN yarn --production
COPY . .

FROM mhart/alpine-node:base-10
WORKDIR /usr/src
ENV PATH="./node_modules/.bin:$PATH"
ENV NODE_ENV="production"
ENV ENV_SILENT="true"
COPY --from=build /usr/src .
EXPOSE 3333
CMD ["node", "server.js"]