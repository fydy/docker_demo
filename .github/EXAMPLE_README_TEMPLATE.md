# <Project>
Description

### Getting started with <Project>
#### Step 1
#### Step 2
#### Step n

### Adding Dockerfile for <Project>
#### Instructions
#### Dockerfile
#### .dockerignore

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