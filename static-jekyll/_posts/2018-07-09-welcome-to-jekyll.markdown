---
layout: post
title:  "Welcome"
date:   2018-07-09 23:54:30 +0530
categories: jekyll update
---

This is a simple Jekyll app deploy on Now using the static build support.<br/>
Here we use a Jekyll [plugin](https://github.com/dommmel/jekyll-youtube) to render the following youtube video.

{% youtube "https://www.youtube.com/watch?v=yqACl3tRHNI" %}

<br/>
You cannot use that plugin in GitHub pages since it's not [white listed](https://pages.github.com/versions/).
But you can use inside Now thanks to Now's static build support which is based on docker.

You can find [this sample app](https://github.com/now-examples/now-jekyll-example) on GitHub.
