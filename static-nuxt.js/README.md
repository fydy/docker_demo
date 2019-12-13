# Nuxt.js Static

A simple Nuxt.js application with two pages and statically exported.
To add new pages create files under `./pages`.

## Step 1: Initialize project

Initialize the project with:

```bash
yarn init --yes
```

## Step 2: Install dependencies

Add the project dependencies:

```bash
yarn add nuxt
```

## Step 3: Configure scripts

Set scripts to `package.json`:

```json
{
 ...
 "scripts": {
   "dev": "nuxt",
   "build": "nuxt build",
   "generate": "nuxt generate"
 }
 ...
}
```

## Step 4: Set Docker to build and run the app

Add the following `Dockerfile` which will:

- Install all the dependencies
- Build the application for production
- Generate to static files the application on /public

```Dockerfile
FROM mhart/alpine-node:10
WORKDIR /usr/src
COPY package.json yarn.lock /usr/src/
RUN yarn install
COPY . .
RUN yarn build && yarn generate
RUN mv ./dist /public
```

## Step 5: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the pages directories and our `package.json` and `yarn.lock`.

```plain
*
!pages
!package.json
!yarn.lock
```

## Step 6: Add the application code

Create a `/pages` directories and add the code of the application there.

## Step 7: Deploy to Now

Now the project is ready to deploy:

```bash
now
```
