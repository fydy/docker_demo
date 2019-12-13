const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

// Broadcast to all.
wss.broadcast = function broadcast(data) {
  wss.clients.forEach(function each(client) {
    if (client.readyState === WebSocket.OPEN) {
      client.send(data);
    }
  });
};

wss.on('connection', function connection(ws) {
	wss.broadcast(`Someone joined this room. There are now ${wss.clients.size} people in this room`)
  ws.on('message', function incoming(data) {
    // Broadcast to everyone else.
    wss.clients.forEach(function each(client) {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(`Them: ${data}`);
      }
    });
  });
  ws.on('close', () => wss.broadcast(`Someone left this room. There are now ${wss.clients.size} people in this room`));
});
