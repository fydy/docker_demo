# Parcel

A simple website built using [Parcel](https://parceljs.org)

## Step 1: Initialize project

Initialize the project with:

```bash
yarn init --yes
```

## Step 2: Configure Now

Add the following `now.json` which will:

- Define the type of deployment as `static`
- Configure the deployment to be public
- Set the [build environment variable](https://zeit.co/docs/features/build-env-and-secrets) BUNDLER to have the value `Parcel`


```json
{
  "type": "static",
  "public": true,
  "build": {
    "env": {
      "BUNDLER": "Parcel"
    }
  }
}
```

## Step 3: Set Docker to test and build the app

Add the following `Dockerfile` which will:

- Made use of the build variable BUNDLER
- Install dependencies
- Build the application
- Move the results to /public to be served by Now


```Dockerfile
FROM mhart/alpine-node:10
ARG BUNDLER
WORKDIR /usr/src
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build
RUN mv ./dist /public
```

## Step 4: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the src directory and our `package.json`, `wepback.config.js` and `yarn.lock`.

```
*
!src
!package.json
!yarn.lock
```

## Step 5: Add the application code

Create the application code inside `/src`.

## Step 6: Deploy to Now

Now the project is ready to deploy:

```bash
now
```
