const { parse } = require('url');

const { send } = require('micro');
const UrlPattern = require('url-pattern');

const { getBrowser } = require('./setup.js');

const pattern = new UrlPattern('/:url', {
  segmentValueCharset: 'a-zA-Z0-9-_./&?=%',
});

module.exports = async (req, res) => {
  console.log(1);
  if (req.method !== 'GET') {
    return send(res, 501, 'Use a GET request');
  }
  console.log(2);
  const { pathname } = parse(req.url);
  const params = pattern.match(pathname);
  console.log(3);
  if (!params || !params.url) {
    return send(res, 400, 'A url needs to be passed in like /:url');
  }
  console.log(4);
  if (params.url === 'favicon.ico') {
    return send(res, 404, 'No favicon set');
  }
  console.log(5);

  console.log('Ensuring chrome is up');
  const browser = await getBrowser();
  console.log('Taking a screenshot of', params.url);
  res.setHeader('Content-type', 'image/png');
  const page = await browser.newPage();
  await page.goto(`http://${params.url}`, { waitUntil: ['domcontentloaded', 'networkidle0'] });
  return page.screenshot();
};
