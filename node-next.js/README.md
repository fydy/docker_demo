# Next.js SSR

A simple Next.js application with two pages and SSR enabled.

To add new pages create files under `./pages`.

## Step 1: Initialize project

Initialize the project with:

```bash
yarn init --yes
```

## Step 2: Install dependencies

Add the project dependencies:

```bash
yarn add next react react-dom
```

## Step 3: Configure scripts

Set scripts to `package.json`:

```json
{
  ...
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start"
  }
  ...
}
```

## Step 4: Set Docker to build and run the app

Add the following `Dockerfile` which will:

- Install all the dependencies
- Build the application for production
- Remove non-production dependencies
- Create a new lighter Docker image to reduce boot time
- Pull built files and production dependencies from previous steps
- Expose the port 300 and run the application

```Dockerfile
FROM mhart/alpine-node:10 as base
WORKDIR /usr/src
COPY package.json yarn.lock /usr/src/
RUN yarn install
COPY . .
RUN yarn build && yarn --production

FROM mhart/alpine-node:base-10
WORKDIR /usr/src
ENV NODE_ENV="production"
COPY --from=base /usr/src .
EXPOSE 3000
CMD ["node", "./node_modules/.bin/next", "start"]
```

## Step 5: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the components and pages directories and our `package.json` and `yarn.lock`.

```plain
*
!components
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
