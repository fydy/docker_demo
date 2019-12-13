# swift-kitura

In this example we will be building and deploying an API with Kitura web framework for Swift. Kitura is a web framework and web server that is created for web services written in Swift. For more information, visit [https://www.kitura.io](https://www.kitura.io).

### Getting started with Kitura

#### Create a new folder with the name of your app

```
mkdir Hello && cd Hello
```

#### Add a Package.swift

```
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.4.0"),
    ],
    targets: [
        .target(name: "Run", dependencies: ["Kitura"]),
    ]
)
```

> Update the name key with your app name

#### Create directories and main.swift file

```
mkdir -p Sources/Run
```

```
touch Sources/Run/main.swift
```

#### Import Kitura and create an app

```
import Kitura

let router = Router()

router.get("/") { request, response, next in
    response.send("Hello from Kitura")
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
```

#### Run you the app locally

```
swift run
```

### Adding Dockerfile for Kitura

#### Instructions

We will create a `Dockerfile` with multi stage builds to:

- Install all the dependencies
- Package all swift dependencies
- Build the application for production
- Remove non-production dependencies
- Create a new lighter Docker image to reduce boot time
- Pull built files and production dependencies from previous steps

#### Dockerfile

We will start buy using a Swift official Docker image to install the dependencies and build the project, after that we will use the official busybox Docker image to have the minimum requirements and lower the Docker image size to run the app and copy all the files.

Then using the Docker `CMD` we will start the app in productio mode.

```
FROM swift:4.1 as builder
WORKDIR /build
COPY . .
RUN swift package resolve
RUN swift build -c release
RUN chmod +x pkg-swift-deps.sh
RUN ./pkg-swift-deps.sh /build/.build/x86_64-unknown-linux/release/Run

FROM busybox:glibc
WORKDIR /app
COPY --from=builder /build/swift_libs.tar.gz .
COPY --from=builder /build/.build/x86_64-unknown-linux/release/Run .

RUN tar -xzvf swift_libs.tar.gz -C /
RUN rm -rf usr/lib lib lib64 swift_libs.tar.gz

CMD ["./Run", "serve", "-e", "prod"]
```

We will need to create the pkg-swift-deps.sh so we can pack all the Swift dependencies and run them on busybox which doesn't have Swift installed.

#### Script to pacakge all swift dependencies

Create a script file

```
touch pkg-swift-deps.sh
```

Add the code to tar all swift dependencies into Docker so we can use a smaller image.

```
#!/bin/bash
BIN="$1"
OUTPUT_TAR="${2:-swift_libs.tar.gz}"
TAR_FLAGS="hczvf"
DEPS=$(ldd $BIN | awk 'BEGIN{ORS=" "}$1\
  ~/^\//{print $1}$3~/^\//{print $3}'\
  | sed 's/,$/\n/')
tar $TAR_FLAGS $OUTPUT_TAR $DEPS
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the Package.swift, the Sources and the Swift dependencies script.

```
*
!Sources
!Package.swift
!pkg-swift-deps.sh
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