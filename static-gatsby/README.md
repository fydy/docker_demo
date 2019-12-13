# Gatsby

A basic Gatsby powered website.

## Step 1: Initialize project

Initialize the project with:

```bash
gatsby new static-gatsby
```

## Step 2: Set Docker to build and run the app

Add the following `Dockerfile` which will:

- Install all the dependencies
- Build the application for production
- Export to static files the application on /public

```Dockerfile
FROM mhart/alpine-node:10
WORKDIR /usr/src
COPY package.json yarn.lock /usr/src/
RUN yarn install
COPY . .
RUN yarn build
RUN mv ./public /public
```

## Step 3: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the `src` directory, the Gatsby configuration files, `package.json` and `yarn.lock`

```plain
*
!src
!gastsby-browser.js
!gastsby-config.js
!gastsby-node.js
!gastsby-ssr.js
!package.json
!yarn.lock
```

## Step 4: Add the application code

Add your application code under `./src`

## Step 7: Deploy to Now

Now the project is ready to deploy:

```bash
now
```
