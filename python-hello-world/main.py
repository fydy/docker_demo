from http.server import BaseHTTPRequestHandler,HTTPServer

class myHandler(BaseHTTPRequestHandler):
	def do_GET(self):
		self.send_response(200)
		self.end_headers()
		self.wfile.write(b'Hello Python!')

server = HTTPServer(('', 3000), myHandler)
server.serve_forever()
