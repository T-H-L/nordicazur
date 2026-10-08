const fs = require('fs');
const https = require('https');

const DEEPL_API_KEY = process.env.DEEPL_API_KEY;
const HTML_FILE = 'index.html';

if (!DEEPL_API_KEY) {
  console.error("Fejl: DEEPL_API_KEY mangler.");
  process.exit(1);
}

// Funktion til at kalde DeepL API
function translateText(text, targetLang) {
  return new Promise((resolve, reject) => {
    const data = new URLSearchParams({
      auth_key: DEEPL_API_KEY,
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
            reject(`Fejl fra DeepL API: ${body}`);
          }
        } catch (e) {
          reject(`Kunne ikke parse DeepL svar: ${body}`);
        }
      });
    });

    req.on('error', (e) => reject(e));
    req.write(data);
    req.end();
  });
}

async function run() {
  let content = fs.readFileSync(HTML_FILE, 'utf8');

  // Fleksibel RegEx der fanger i18nTranslations uanset mellemrum/linjeskift
  const regex = /(const\s+i18nTranslations\s*=\s*)({[\s\S]*?});/;
  const match = content.match(regex);

  if (!match) {
    console.error("Kunne ikke finde translations-objektet i index.html");
    process.exit(1);
  }

  let translations;
  try {
    translations = eval('(' + match[2] + ')');
  } catch (e) {
    console.error("Fejl ved læsning af i18nTranslations JSON/JS struktur:", e);
    process.exit(1);
  }

  const enKeys = translations.en || {};
  const languages = ['da', 'fr', 'nl', 'de', 'sv', 'no'];

  console.log("Starter oversættelse af nye/ændrede nøgler...");

  // --- HER ER DET INDSAT ---
  for (const lang of languages) {
    if (!translations[lang]) translations[lang] = {};

    for (const [key, enValue] of Object.entries(enKeys)) {
      const currentTranslation = translations[lang][key];

      if (!currentTranslation || currentTranslation === enValue) {
        try {
          const deeplLang = lang === 'no' ? 'NB' : lang.toUpperCase();
          const translatedText = await translateText(enValue, deeplLang);
          translations[lang][key] = translatedText;
          console.log(`[${lang.toUpperCase()}] ${key} -> ${translatedText}`);
        } catch (err) {
          console.error(`Fejl ved oversættelse af ${key} til ${lang}:`, err);
        }
      }
    }
  }
  // --------------------------

  // Gem det opdaterede objekt tilbage i index.html
  const updatedTranslationsJs = JSON.stringify(translations, null, 2);
  const updatedContent = content.replace(regex, `$1${updatedTranslationsJs};`);

  fs.writeFileSync(HTML_FILE, updatedContent, 'utf8');
  console.log("Succes! index.html er opdateret med nye oversættelser.");
}

run();
