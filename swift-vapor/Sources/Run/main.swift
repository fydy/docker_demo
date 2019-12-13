import Vapor

public func CreateApp(_ env: Environment) throws -> Application {
    var env = env
    let app = try Application(environment: env)

    return app
}

let app = try CreateApp(.detect())
let router = try app.make(Router.self)

router.get("/") { req in
    return "Hello from Vapor"
}

try app.run()
