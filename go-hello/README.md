# go-hello

In this project we will be building and deploying a Hello World example using [Go](https://golang.org/).

Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.

### Getting started with Go

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Create a main.go file

```
touch main.go
```

For this example we will use the minimal requirements to run a Hello World.

```
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from Go")
	})
	http.ListenAndServe(":3000", nil)
}
```

### Adding Dockerfile for Go

#### Instructions

We will create a `Dockerfile` with multi stage builds to:

- Install all the dependencies
- Build the application for production
- Remove non-production dependencies
- Create a new lighter Docker image to reduce boot time
- Pull built files and production dependencies from previous steps

#### Dockerfile

We will start buy using the official Go Docker image to install the dependencies and build the project, after that we will use the official scratch Docker image to have the minimum requirements and lower the Docker image size to run the app and copy all the files.

Then using the Docker `CMD` we will start the app in production mode.

```
FROM golang:1.9-alpine as base
WORKDIR /usr/src
COPY . .
RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o main

FROM scratch
COPY --from=base /usr/src/main /go-http-microservice
CMD ["/go-http-microservice"]
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the main.go.

```
*
!main.go
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