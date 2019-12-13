const bootup = Date.now();
const os = require('os');
const ms = require('ms');
const {inspect} = require('util');
const rawBody = require('raw-body');
const env = {};
for (const key of Object.keys(process.env).sort()) {
  if (key === 'AUTH_TOKEN') continue;
  if (key.startsWith('npm_')) continue;
  env[key] = process.env[key];
}
module.exports = async function(req, res) {
  const now = Date.now();
  const uptime = now - bootup;
  const data = {
    now,
    bootup,
    bootupHuman: new Date(bootup).toUTCString(),
    uptime,
    uptimeHuman: ms(uptime),
    request: {
      url: req.url,
      method: req.method,
      headers: req.headers,
      body: String(await rawBody(req))
    },
    process: {
      pid: process.pid,
      ppid: process.ppid,
      versions: process.versions,
      env
    },
    os: {
      hostname: os.hostname(),
      arch: os.arch(),
      platform: os.platform(),
      homedir: os.homedir(),
      hostname: os.hostname(),
      cpus: os.cpus(),
      userInfo: os.userInfo()
    }
  };
  console.log(inspect(data, {colors: true, depth: 5}));
  return data;
};
