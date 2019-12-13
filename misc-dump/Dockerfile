FROM mhart/alpine-node:10.1.0
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
ENV FOO bar baz
EXPOSE 3000
USER nobody
CMD ["node", "./node_modules/.bin/micro", "server.js"]
