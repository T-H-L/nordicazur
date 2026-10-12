const fs = require('fs');
const https = require('https');

const DEEPL_API_KEY = process.env.DEEPL_API_KEY;
const TRANSLATIONS_FILE = 'translations.js';
const HTML_FILE = 'index.html';

if (!DEEPL_API_KEY) {
  console.error("Fejl: DEEPL_API_KEY mangler.");
  process.exit(1);
}

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

function translateText(text, targetLang) {
  return new Promise((resolve, reject) => {
    const data = new URLSearchParams({
      text: text,
      target_lang: targetLang.toUpperCase(),
      source_lang: 'EN'
    }).toString();

    const options = {
      hostname: DEEPL_API_KEY.endsWith(':fx') ? 'api-free.deepl.com' : 'api.deepl.com',
      port: 443,
      path: '/v2/translate',
      method: 'POST',
      headers: {
        'Authorization': `DeepL-Auth-Key ${DEEPL_API_KEY}`,
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(data)
      }
    };

    const req = https.request(options, (res) => {
      let body = '';
      res.on('data', (chunk) => body += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(body);
          if (parsed.translations && parsed.translations[0]) {
            resolve(parsed.translations[0].text);
          } else {
            reject(`Fejl fra DeepL API (${res.statusCode}): ${body}`);
          }
        } catch (e) {
          reject(`Kunne ikke parse DeepL svar (${res.statusCode}): ${body}`);
        }
      });
    });

    req.on('error', (e) => reject(e));
    req.write(data);
    req.end();
  });
}

async function run() {
  const htmlContent = fs.readFileSync(HTML_FILE, 'utf8');
  const enKeys = {};
  const regex = /data-i18n="([^"]+)">([\s\S]*?)<\//g;
  let match;

  while ((match = regex.exec(htmlContent)) !== null) {
    const key = match[1];
    let text = match[2].trim().replace(/\s+/g, ' ');
    if (key && text) {
      enKeys[key] = text;
    }
  }

  console.log(`Fandt ${Object.keys(enKeys).length} nøgler i index.html.`);

  const translations = { en: enKeys };
  const languages = ['da', 'fr', 'nl', 'de', 'sv', 'no'];

  for (const lang of languages) {
    translations[lang] = {};
    for (const [key, enValue] of Object.entries(enKeys)) {
      try {
        const deeplLang = lang === 'no' ? 'NB' : lang.toUpperCase();
        const translatedText = await translateText(enValue, deeplLang);
        translations[lang][key] = translatedText;
        console.log(`[${lang.toUpperCase()}] ${key} -> ${translatedText}`);
        await sleep(150);
      } catch (err) {
        console.error(`Fejl ved oversættelse af ${key} til ${lang}:`, err);
      }
    }
  }

  const updatedJs = 'window.i18nTranslations = ' + JSON.stringify(translations, null, 2) + ';';
  fs.writeFileSync(TRANSLATIONS_FILE, updatedJs, 'utf8');
  console.log("Succes! translations.js er opdateret.");
}

run();
