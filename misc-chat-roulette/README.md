# Chat Roulette

A simple websocket based chat-roulette app that matches you with a random
person to chat with and randomizes the chats every minute. There is no special
logic in the code itself to perform this action, but instead, we use the limits
in now.json to limit 2 concurrent websockets connections per "room" (instance)
and to kill the instance 60s after it starts. This causes a retry from the
client to trigger a new instance to spin up and satisy that websocket request,
causing new "rooms" to boot up and start new chat conversation.

## Setup

For this, you'll need to deploy this server using `now` and then alias to
a convenient URL (optional). Finally, `cd client` and modify index.html to talk
to your deployed instance of this server and `now` the client as well.
