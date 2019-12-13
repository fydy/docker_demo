# mdx-deck

A simple presentation built with [mdx-deck](https://github.com/jxnblk/mdx-deck) that builds and hosts on Now as a [static deployment](https://zeit.co/blog/dockerfile-static).

## Step 1: Initialize project

Initialize the project with:

```bash
yarn init --yes
```

## Step 2: Install dependencies

Add the project dependencies:

```bash
yarn add mdx-deck
```

## Step 3: Configure scripts

Set scripts to `package.json`:

```json
{
...
"scripts": {
  "start": "mdx-deck deck.mdx",
  "build": "mdx-deck build deck.mdx"
}
...
}
```

## Step 4: Set Docker to build and run the app

Add the following `Dockerfile` which will:

- Install all the dependencies
- Build the application for production
- Export to static files the application on /public


```Dockerfile
FROM mhart/alpine-node:10
WORKDIR /usr/src
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build -d /public
```

## Step 5: Set files to ignore with Docker

Add the following `.dockerignore` which will tell Docker to ignore all files except the our `package.json`, `yarn.lock` and `deck.mdx`.

```plain
*
!package.json
!yarn.lock
!deck.mdx
```

## Step 6: Add the presentation code

Add more slides to deck.mdx

## Step 7: Deploy to Now

Now the project is ready to deploy:

```bash
now
```
