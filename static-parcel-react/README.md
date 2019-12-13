# Parcel + React
A simple React built using [Parcel](https://parceljs.org/getting_started.html)

## The Setup
Creating a package.json
`yarn init -y`
or
`npm init -y`
to create package.json

### Installing React, Parcel, Serve, and Node-sass
`yarn add react react-dom parcel-bundler node-sass`


Now Create index.html, src/index.js, and src/App.js

**index.html**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Parcel</title>
</head>
<body>
<noscript>You need to have Javascript enabled.</noscript>
<div id="app"></div>
<script src="src/index.js"></script>
</body>
</html>
```

**src/index.js**
```js
import React, { Component } from "react";
import ReactDOM from "react-dom";
import App from './App';
import './main.scss'; 

var mountNode = document.getElementById("app");
ReactDOM.render(<App />, mountNode);
```

**src/App.js**
```js
import React from 'react'

const App = () => {
  return (
    <div className="container">
        <h1>Hello World</h1>
        <p>Built using Parcel and deployed with Now.sh!</p>
        <a href="https://zeit.co/docs/examples/parcel-react-scss">zeit.co/docs</a>
    </div>
  )
}

export default App
```

Adding Sass support to Parcel Apps is as simple as installing node-sass and importing it.

`yarn add node-sass` or `npm i node-sass`
We already installed it in the start

**src/main.scss**
```scss
@import url("https://fonts.googleapis.com/css?family=Nunito+Sans");
body {
    margin: 0;
    font-family: 'Nunito Sans';
}
.container {
    margin: 0 auto;
    max-width: 1280px;
    width: 90%;
}
h1 {
    text-align: center;
    font-size: 4.2rem;
    line-height: 110%;
    margin: 2.8rem 0 1.68rem 0;
    font-weight: 400;
}
a {
    text-decoration: none;
    color: #039be5;
    text-decoration: none;
    -webkit-tap-highlight-color: transparent;
}
@media only screen and (min-width: 700px) {
    width: 85%;
}
```

## Testing and Deploying
Our package.json should be somewhat like this
```json
{
  "name": "parcel-app",
  "scripts": {
    "start": "parcel index.html --port 8080 --hmr-port 8181",
    "build": "parcel build index.html",
    "clear-dist": "rm dist/*"
  },
  "dependencies": {
    "babel-preset-env": "^1.7.0",
    "babel-preset-react": "^6.24.1",
    "node-sass": "^4.9.3",
    "parcel-bundler": "^1.9.7",
    "react": "^16.4.2",
    "react-dom": "^16.4.2"
  }
}
```

Running `yarn start` or `npm start` Parcel will build our project to dist/
and start a local dev server [localhost:8080](http://localhost:8080)

## Deploying (Setting up Docker to build our App)

### Setting up now.json file
Make a new file `now.json`
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

- Define the type of deployment as `static`
- Set the environment variable CI on the build stage
- Configure the static deployment to return index.html if a path is not found.
  The index.html rewrite rule will add support for Single Page Applications.


Make a new file `Dockerfile` and the following
```Dockerfile
FROM mhart/alpine-node:10
ARG CI
WORKDIR /usr/src
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build
RUN mv ./dist /public
```
- Used Node:10 image and used the build variable CI
- Installed dependencies
- Build the App
- Moved the build results to /public dir which Now will serve

Now we gonna make sure the Docekr will ignore all files except `src/` and `package.json` and `yarn.lock`
Make a new file `.dockerignore`
```
*
!src
!package.json
!yarn.lock
```

### Deploy to Now
To deploy our App we just run
`now`
