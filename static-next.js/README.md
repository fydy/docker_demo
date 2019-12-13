# static-next.js

In this project we will be building and deploying a simple static example using [Next.js](https://nextjs.org/) with a shared component.

Next.js is a lightweight framework for static and server‑rendered applications.

### Getting started with Next.js

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Initialize and setup the project

```
yarn init --yes
```

> For this example we are using `yarn` but it will work the same with `npm`

Then we will install the required dependencies.

```
yarn add next react react-dom
```

After installing the dependecies we need to add the scripts to build and start the app into the `package.json` file.

```
{
 ...
 "scripts": {
   "dev": "next",
   "build": "next build",
   "export": "next export"
 }
 ...
}
```

#### Create new components and pages folders

```
mkdir components pages
```

#### Create an header.js file to be shared.

```
touch components/header.js
```

We will add a basic header.

```
export default () => (
  <header>
    <h1>Next.js SSR Example</h1>
  </header>
);
```

#### Create an index.js and about.js files under the pages directory

```
touch pages/{index,about}.js
```

For this example we will create two pages the index.js using the shared header component.

```
import Link from "next/link";
import Header from "../components/header";

export default () => (
  <main>
    <Header />
    <section>
      <Link href="/about">
        <a>Go to About Me</a>
      </Link>
    </section>
  </main>
);
```

And the about.js with the header component as well.

```
import { Component } from "react";
import Link from "next/link";
import Header from "../components/header";

class AboutPage extends Component {
  static getInitialProps() {
    const isServer = typeof window === "undefined";
    return { isServer };
  }
  render() {
    return (
      <main>
        <Header />
        <section>
          <p>
            This is another page of the SSR example, you accessed it{" "}
            <strong>{this.props.isServer ? "server" : "client"} side</strong>.
          </p>
          <p>You can reload to see how the page change.</p>
          <Link href="/">
            <a>Go to Home</a>
          </Link>
        </section>
      </main>
    );
  }
}

export default AboutPage;
```

#### Run you the app locally in dev mode

```
yarn dev
```

### Adding Dockerfile for Static Next.js

#### Instructions

We will create a `Dockerfile` to:

- Install all the dependencies
- Build the application for production
- Export to static files the application on /public

#### Dockerfile

We will start buy using the a prebuild Node Docker image to install the dependencies and build the project, after we will copy all the build files into the `/public` folder on the image to serve the site statically.

```
FROM mhart/alpine-node:10
WORKDIR /usr/src
COPY package.json yarn.lock /usr/src/
RUN yarn install
COPY . .
RUN yarn build
RUN yarn export -o /public
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the next files for the build process:

```
*
!components
!pages
!package.json
!yarn.lock
```

### Deploy with Now

First we need to add a `now.json` file to specify we want to use our Cloud V2.

```
touch now.json
```

Add the type static key to notify Now that this is a static deployemnt and just adding the features key, we can specify the Now cloud to use.

```
{
  "type": "static",
  "features": {
    "cloud": "v2"
  }
}
```

We are now ready to deploy the app.

```
now
```