# Now Examples

[![Join the community on Spectrum](https://withspectrum.github.io/badge/badge.svg)](https://spectrum.chat/zeit)

## Static Websites

These deployments:

- Have a build phase powered by `Dockerfile`
- Are generated once and served fully statically
- Get cached automatically by the [Now CDN](https://zeit.co/cdn)

### Overview

| Demo  | Description | Size |
|:------|:------------|:---- |
| [static-gatsby](https://static-gatsby.now.sh) | A  static site built with [Gatsby](https://www.gatsbyjs.org/) | 3.1M |
| [static-hugo](https://static-hugo.now.sh) | A static site built by [Hugo](https://gohugo.io/) | 236K |
| [static-jekyll](https://static-jekyll.now.sh) | A basic [Jekyll](https://jekyllrb.com/) powered site | 61K |
| [static-mdx-deck](https://static-mdx-deck.now.sh/) | A simple presentation built with [mdx-deck](https://github.com/jxnblk/mdx-deck) | 299K |
| [static-next.js](https://static-nextjs.now.sh) | A simple statically exported [Next.js](https://nextjs.org/) application | 242K |
| [static-nuxt.js](https://static-nuxtjs.now.sh) | A simple statically generated [Nuxt.js](https://nextjs.org/) application | 209K |
| [static-parcel](https://static-parcel.now.sh) | A simple website built using [Parcel](https://parceljs.org) | 20K |
| [static-react](https://cra.now.sh) | Deploy, test and build [CRA](https://github.com/facebook/create-react-app) | 635K |
| [static-vuepress](https://static-vuepress.now.sh) | A static website built using [vuepress](https://vuepress.vuejs.org/) | 272.0K |
| [static-parcel-react](https://static-parcel-react.now.sh) | A simple React website built using [Parcel](https://parceljs.org) | 2.5M |
| [static-webpack](https://static-webpack.now.sh) | A simple website built using [webpack](https://webpack.js.org) | 8K |

## Serverless Docker (V2)

These deployments:

- Respond with dynamic data by running code
- Automatically scale to zero with no traffic
- Boot from cold in under a second
- Are built reproducibly from `Dockerfile`

### Overview

| Demo | Language | Description | Size |
|:------|:----------:|:-------------|------|
| [asm-httpd](https://asm-httpd-v2.now.sh) | [x86_64 ASM](https://en.wikipedia.org/wiki/X86_assembly_language) | Deploys [`asmhttpd`](https://github.com/jcalvinowens/asmhttpd) which serves a static file | 12.0K |
| [bash-httpd](https://bash-httpd-v2.now.sh) | [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))  | Uses [`bashttpd`](https://github.com/tootallnate/bashttpd) to HTTP requests with the output of Bash commands | 4.3M |
| [c-microhttpd](https://c-microhttpd-v2.now.sh) | [C](https://en.wikipedia.org/wiki/C_(programming_language)) | Uses [libmicrohttpd](https://www.gnu.org/software/libmicrohttpd/) to implement a webserver | 8.3M |
| [crystal-hello](https://crystal-hello-v2.now.sh) | [Crystal](https://en.wikipedia.org/wiki/Crystal_(programming_language)) | Uses the [`http/server` module](https://crystal-lang.org/api/0.25.1/HTTP/Server.html) to implement a webserver | 4.0M |
| [elixir-phoenix](https://elixir-phoenix-v2.now.sh) | [Elixir](https://en.wikipedia.org/wiki/Elixir_(programming_language)) | A [Phoenix](https://phoenixframework.org/) app | 47.5M |
| [go-hello](https://go-hello-v2.now.sh) | [Go](https://en.wikipedia.org/wiki/Go_(programming_language)) | Uses the [`http` package](https://golang.org/pkg/net/http/) to implement a webserver | 1.8M |
| [java-spark-graal](https://java-spark-graal-v2.now.sh) | [Java](https://en.wikipedia.org/wiki/Java_(programming_language)) | Uses the [`Spark`](http://sparkjava.com/) framework and packages with [GraalVM `native-image`](http://www.graalvm.org/) | 5.3M |
| [misc-chat-roulette](https://misc-chat-roulette-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | Implements a [WebSocket](https://en.wikipedia.org/wiki/WebSocket) server with a max concurrency of `2` | 19.3M |
| [misc-dump](https://misc-dump-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | An app that simply logs information about incoming requests and the system it's running on | 26.1M |
| [misc-redirect](https://misc-redirect-v2.now.sh) | [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) | Server that does an HTTP redirect to the configured URL | 4.3M |
| [misc-screenshot](https://misc-screenshot.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | An app that takes a screenshot of a given webpage powered by [puppeteer](https://github.com/GoogleChrome/puppeteer) | 89.6M |
| [misc-socket.io-chat](https://misc-socketio-chat-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | The socket.io [chat demo](https://socket.io/demos/chat/) | 20.2M |
| [misc-socket.io-whiteboard](https://misc-socketio-whiteboard-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | The socket.io [whiteboard demo](https://socket.io/demos/whiteboard/) | 20.2M |
| [misc-web-tty](https://misc-web-tty-v2.now.sh) | [Go](https://en.wikipedia.org/wiki/Go_(programming_language)) | A fully functional terminal in the browser powered by [gotty](https://github.com/yudai/gotty) | 6.1M |
| [node-adonisjs](https://node-adonisjs-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | A minimal AdonisJs application | 21.6M |
| [node-next.js](https://node-nextjs-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) |A simple Next.js application with Server Side Rendering | 86.1M |
| [node-nuxt.js](https://node-nuxtjs-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) |A simple Nuxt.js application with Server Side Rendering | 37.9M |
| [node-hello-world](https://node-hello-world-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | A minimal (1LOC) server in node | 19.2M |
| [node-http-microservice-pkg](https://node-http-microservice-pkg-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | A microservice in Node, packaged with [pkg](https://github.com/zeit/pkg) | 19.3M |
| [node-micro](https://node-micro-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | A microservice in Node written with [micro](https://github.com/zeit/micro) | 19.6M |
| [node-express](https://node-express-v2.now.sh) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | A [express](https://expressjs.com/) | 19.9M |
| [ocaml-graphql](https://ocaml-graphql-example.now.sh/graphql) | [OCaml](https://en.wikipedia.org/wiki/OCaml) | Deploys an OCaml GraphQL server using [ocaml-graphql-server](https://github.com/andreas/ocaml-graphql-server) | 2.8M |
| [php-7-hello-world](https://php-7-hello-world-v2.now.sh) | [PHP](https://en.wikipedia.org/wiki/PHP) | A tiny website served using [php-fpm](https://php-fpm.org/) | 6.4M |
| [php-wordpress](https://php-wordpress-v2.now.sh) | [PHP](https://en.wikipedia.org/wiki/PHP) | An example running [WordPress](https://wordpress.org/) backed by a SQLite database| 45.3M |
| [php-laravel](https://php-laravel-v2.now.sh) | [PHP](https://en.wikipedia.org/wiki/PHP) | A [Laravel](https://laravel.com) app | 38.8M |
| [python-django](https://python-django-v2.now.sh) | [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) | A [Django](https://www.djangoproject.com/) app | 49.1M |
| [python-flask](https://python-flask-v2.now.sh) | [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) | A [Flask](http://flask.pocoo.org/) app | 38.1M |
| [python-hello-world](https://python-hello-world-v2.now.sh) | [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) | A webserver powered by the built-in [http.server](https://docs.python.org/3/library/http.server.html) module | 33.1M |
| [ruby-http-sinatra](https://ruby-http-sinatra-v2.now.sh) | [Ruby](https://en.wikipedia.org/wiki/Ruby_(programming_language)) | A [Sinatra](http://sinatrarb.com/) app | 58.7M |
| [rust-http-microservice](https://rust-http-microservice-v2.now.sh) | [Rust](https://en.wikipedia.org/wiki/Rust_(programming_language)) | A webserver powered by [hyper](https://hyper.rs/) | 2.3M |
| [rust-rocket](https://rust-rocket-v2.now.sh) | [Rust](https://en.wikipedia.org/wiki/Rust_(programming_language)) | A webserver powered by [Rocket](https://rocket.rs/) | 2.7M |
| [swift-http-server](https://swift-http-server-v2.now.sh) | [Swift](https://swift.org/) | Example Swift hello world using [HTTP Server](https://swift-server.github.io/http/) | 33.0M |
| [swift-kitura](https://swift-kitura-v2.now.sh) | [Swift](https://swift.org/) | Swift server written with IBM's [Kitura](https://github.com/IBM-Swift/Kitura) | 33.9M |
| [swift-vapor](https://swift-vapor-v2.now.sh) | [Swift](https://swift.org/) | Server-side Swift example using [Vapor](https://vapor.codes/) | 35.7M |
