const SSE = require("sse-channel");
const sse = new SSE();
const html = require("fs").readFileSync(__dirname + "/index.html", "utf8");

setInterval(() => {
  sse.send(new Date().toISOString());
}, 1000);

module.exports = (req, res) => {
  if (req.url === "/") {
    res.writeHead(200, {
      "Content-Type": "text/html; charset=utf-8",
      "Content-Length": Buffer.byteLength(html)
    });
    res.end(html);
  } else if (req.url === "/channel") {
    sse.addClient(req, res);
  } else {
    res.writeHead(404);
    res.end("Not found");
  }
};
