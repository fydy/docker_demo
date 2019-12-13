# asm-httpd

In this example we will be building and deploying an static site using Assembly using [asm-http](https://github.com/jcalvinowens/asmhttpd), a minimalist HTTP server for Linux, written in x86_64 assembly.

### Getting started with Assembly HTTP

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Add an index.html file

```
<marquee direction=right>Hello ASM!</marquee>
```

### Adding Dockerfile for Assembly HTTP

#### Instructions

We will create a `Dockerfile` to:

- Start build a project on asmhttp
- Copy the static files

#### Dockerfile

We will start buy using a prebuilt Docker image with [asmttpd](https://hub.docker.com/r/jtyr/asmttpd/). This image expects all content to be added to the `/data` folder on the image so we will copy the index.html to be served.

```
FROM jtyr/asmttpd
COPY index.html /data
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the index.html for the static site.

```
*
!index.html
```

### Deploy with Now

First we need to add a `now.json` file to specify we want to use our Cloud V2.

```
touch now.json
```

By just adding the features key, we can specify the Now cloud to use.

```
{
  "features": {
    "cloud": "v2"
  }
}
```

We are now ready to deploy the app.

```
now
```