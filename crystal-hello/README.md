# crystal-hello

In this project we will be building and deploying a Hello World example using [Crystal Lang](https://crystal-lang.org/)

### Getting started with Crystal

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Create a main.cr file

```
touch main.cr
```

For this example we will use the minimal requirements to run a Hello World.

```
require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world! The time is #{Time.now}"
end

address = server.bind_tcp "0.0.0.0", 3000
puts "Listening on http://#{address}"
server.listen
```

### Adding Dockerfile for libmicrohttpd

#### Instructions

We will create a `Dockerfile` with multi stage builds to:

- Install all the dependencies
- Build the application for production
- Remove non-production dependencies
- Create a new lighter Docker image to reduce boot time
- Pull built files and production dependencies from previous steps

#### Dockerfile

We will start buy using the official Alpine Docker image to install the dependencies and build the project, after that we will use the official scratch Docker image to have the minimum requirements and lower the Docker image size to run the app and copy all the files.

Then using the Docker `CMD` we will start the app in production mode.

```
FROM alpine:edge as base
WORKDIR /usr/src
RUN apk add --no-cache crystal libressl-dev libc-dev zlib-dev
COPY . .
RUN crystal build --release --static main.cr

FROM scratch
COPY --from=base /usr/src/main /crystal-http-microservice
CMD ["/crystal-http-microservice"]
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the main.cr.

```
*
!main.cr
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