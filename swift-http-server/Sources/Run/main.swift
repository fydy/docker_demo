import Foundation
import HTTP

func hello(request: HTTPRequest, response: HTTPResponseWriter ) -> HTTPBodyProcessing {
    response.writeHeader(status: .ok)
    response.writeBody("Hello from Swift HTTP Server")
    response.done()
    return .discardBody
}

let server = HTTPServer()
try! server.start(port: 8080, handler: hello)

RunLoop.current.run()