const micro = require('micro');

const handler = require('./main');
const { getBrowser } = require('./setup.js');

// pre-emptively launch chrome once the http server is up
micro(handler).listen(3000, getBrowser);
