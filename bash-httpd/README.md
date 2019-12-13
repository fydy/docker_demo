# bash-httpd

In this project we will be building and deploying a minimal server using Bash with bashttpd. This project uses [bashttpd](https://github.com/tootallnate/bashttpd), a web server written in Bash.

### Getting started with bashttpd

#### Create a new folder with the name of your app

```
mkdir my-app && cd my-app
```

#### Create an bashttpd.conf file

```
touch bashttpd.conf
```

For this example we will print to the output the values of `env` sorted

```
env | sort
```

### Adding Dockerfile for bashttpd

#### Instructions

We will create a `Dockerfile` to:

- Start build a project on bashttpd
- Configure the server via a conf file
- Add extra env variables

#### Dockerfile

We will start buy using a prebuilt Docker image with [bashttpd](https://hub.docker.com/r/tootallnate/bashttpd/). Then we will copy our config to `/etc/bashttpd/` and run the bash command to output, in this case it will be `env`.

```
FROM tootallnate/bashttpd:1.3.0
COPY bashttpd.conf /etc/bashttpd/
ARG FOO
ARG BAR
RUN ["env"]
USER nobody
```

#### Add a .dockerignore

We can tell to Docker which files should only be required for building the project using an `.dockerignore` file.

```
touch .dockerignore
```

For this project we only need the bashttpd.conf for the static site.

```
*
!bashttpd.conf
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