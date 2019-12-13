# Create React App

A simple React.js application built using Create React App.

## Step 1: Initialize project

Initialize the project with:

```bash
yarn create react-app app-name
```

Or using `npx`

```bash
npx create-react-app app-name
```

## Step 2: Configure Now

Add the following `now.json` which will:

- Define the type of deployment as `static`
- Set the environment variable CI on the build stage
  Will configure CRA fail to deploy if the tests or the build log a warning.
- Configure the static deployment to return index.html if a path is not found.
  The index.html rewrite rule will add support for Single Page Applications.

```json
{
  "type": "static",
  "build": {
    "env": {
      "CI": "true"
    }
  },
  "static": {
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

## Step 3: Set Docker to test and build the app

Add the following `Dockerfile` which will:

- Made use of the build variable CI
- Install dependencies
- Run tests
- Build the application
- Move the results to /public to be served by Now

```Dockerfile
FROM mhart/alpine-node:10
ARG CI
WORKDIR /usr/src
COPY package.json yarn.lock /usr/src/
RUN yarn install
COPY . .
RUN yarn test
RUN yarn build
RUN mv /usr/src/build /public
```

## Step 4: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the public and src directories and our `package.json` and `yarn.lock`.

```
*
!public
!src
!package.json
!yarn.lock
```

## Step 5: Add the application code

Create the application code inside `/src` or `/public`.

## Step 6: Deploy to Now

Now the project is ready to deploy:

```bash
now
```
