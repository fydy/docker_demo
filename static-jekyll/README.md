# jekyll-static

This is a simple Jekyll app deploy on Now using the static build support.<br/>
Here we use a Jekyll [plugin](https://github.com/dommmel/jekyll-youtube) to render youtube videos.

You cannot use that plugin in GitHub pages since it's not [white listed](https://pages.github.com/versions/).
So, you won't be able to deploy this app on GitHub pages.

But you can use this inside Now thanks to Now's static build support which is based on docker.

### How it works

* This is a typical jekyll app.
* Then we've a simple [`Dockerfile`](./Dockerfile) which builds the app and put the static content into the `/public` directory.
* The [`now.json`](./now.json) file is used to set the type of this app as `static`. (Otherwise `now` CLI will think this as a typical `docker` app.)
* Finally, you can deploy this app by simply invoking `now`. (Make sure to use the latest release of `now`.)
