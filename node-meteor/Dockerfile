FROM geoffreybooth/meteor-base:1.7.0.3

COPY src/ /app/
WORKDIR /app
RUN meteor npm install
RUN meteor build --server-only --directory .

FROM mhart/alpine-node:8.11.4

COPY --from=0 /app/bundle/ /app/

WORKDIR /app/programs/server
RUN apk add --no-cache make g++ python
RUN npm install --production
RUN apk del make g++ python
WORKDIR ../..
RUN ls -l

ENV PORT=3000
EXPOSE 3000
CMD ["node", "main.js"]
