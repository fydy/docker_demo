const path = require('path');

const executablePath = path.join('usr', 'bin', 'chromium-browser');
const launchOptions = [
  // error when launch(); No usable sandbox! Update your kernel
  '--no-sandbox',
  // error when launch(); Failed to load libosmesa.so
  '--disable-gpu',
  // freeze when newPage()
  '--single-process',
  '--headless',
];

const chromeLibSrc = 'chromium_lib.tar.zst';
const chromeLibDst = path.join('usr', 'bin', 'chromium');

module.exports = {
  executablePath,
  launchOptions,
  chromeLibSrc,
  chromeLibDst,
};
