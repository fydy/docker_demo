# c-microhttpd

In this project we will be building and deploying a minimal server using C with libmicrohttpd. This project uses [libmicrohttpd](https://www.gnu.org/software/libmicrohttpd/), GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application.

### Getting started with c-microhttps

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Create a main.c file

```
touch main.c
```

For this example we will use the minimal requirements to run a Hello World.

```
#include <microhttpd.h>
#include <stdio.h>
#include <string.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/types.h>

#define PORT 3000

static int answer_to_connection(void *cls, struct MHD_Connection *connection,
                                const char *url, const char *method,
                                const char *version, const char *upload_data,
                                size_t *upload_data_size, void **con_cls) {
  const char *page = "Hello World";
  struct MHD_Response *response;
  int ret;
  response = MHD_create_response_from_buffer(strlen(page), (void *)page,
                                             MHD_RESPMEM_PERSISTENT);
  ret = MHD_queue_response(connection, MHD_HTTP_OK, response);
  MHD_destroy_response(response);
  return ret;
}

int main() {
  struct MHD_Daemon *daemon;
  daemon = MHD_start_daemon(MHD_USE_SELECT_INTERNALLY, PORT, NULL, NULL,
                            &answer_to_connection, NULL, MHD_OPTION_END);
  if (NULL == daemon)
    return 1;
  while (1) {
    sleep(1);
  }
  MHD_stop_daemon(daemon);
  return 0;
}
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

We will start buy using a Ubuntu official Docker image to install the dependencies and build the project, after that we will use a busybox Docker image to have the minimum requirements and lower the Docker image size to run the app and copy all the files.

Then using the Docker `CMD` we will start the app in production mode.

```
FROM debian:buster-slim as base
WORKDIR /usr/src
RUN apt-get update && apt-get install -y gcc libmicrohttpd12 libmicrohttpd-dev
COPY . .
RUN gcc -o main main.c -Os -lmicrohttpd

FROM spritsail/busybox
COPY --from=base /usr/src/main /bin/main
COPY --from=base /usr/lib/x86_64-linux-gnu/libmicrohttpd* \
  /usr/lib/x86_64-linux-gnu/libgnutls* \
  /usr/lib/x86_64-linux-gnu/libz* \
  /usr/lib/x86_64-linux-gnu/libp11* \
  /usr/lib/x86_64-linux-gnu/libidn* \
  /usr/lib/x86_64-linux-gnu/libunistring* \
  /usr/lib/x86_64-linux-gnu/libtasn* \
  /usr/lib/x86_64-linux-gnu/libnettle* \
  /usr/lib/x86_64-linux-gnu/libhogweed* \
  /usr/lib/x86_64-linux-gnu/libgmp* \
  /usr/lib/x86_64-linux-gnu/libffi* \
  /usr/lib/
CMD ["/bin/main"]
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the main.c to be built with C.

```
*
!main.c
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