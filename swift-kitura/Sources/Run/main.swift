import Kitura

let router = Router()

router.get("/") { request, response, next in
    response.send("Hello from Kitura")
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()