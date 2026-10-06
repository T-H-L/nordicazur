const axios = require('axios');

// Indsæt din DeepL API-nøgle her:
const DEEPL_API_KEY = 'dbbd0c0a-3eac-4d45-9770-171cfb077fbb:fx';
const fs = require('fs');
// MAPPING: Nøgler fra din index.html til DeepL sprogkoder
const languageMap = {
  fr: 'FR',
  da: 'DA',
  de: 'DE',
  nl: 'NL',
  no: 'NB', // DeepL bruger NB for norsk bokmål
  sv: 'SV',
  it: 'IT',
  es: 'ES',
  fi: 'FI',
  pl: 'PL'
};

async function translateText(text, targetLang) {
  try {
    const response = await axios.post(
      'https://api-free.deepl.com/v2/translate',
      new URLSearchParams({
        auth_key: DEEPL_API_KEY,
        text: text,
        target_lang: targetLang,
        source_lang: 'EN'
      })
    );
    return response.data.translations[0].text;
  } catch (error) {
    console.error(`Fejl ved oversættelse til ${targetLang}:`, error.message);
    return text;
  }
}

async function updateIndexHtml() {
  const filePath = './index.html';
  let htmlContent = fs.readFileSync(filePath, 'utf8');

  // Find 'translations' objektet i din index.html
  const match = htmlContent.match(/const translations = (\{[\s\S]*?\});/);
  if (!match) {
    console.error('Kunne ikke finde translations-objektet i index.html');
    return;
  }

  // Evaluér og læs det eksisterende translations-objekt
  const translationsText = match[1];
  let translations;
  eval(`translations = ${translationsText}`);

  const englishDict = translations.en;
  if (!englishDict) {
    console.error('Mangler engelsk (en) som kildesprog i translations!');
    return;
  }

  console.log('Startede automatisk oversættelse ud fra engelsk...\n');

  for (const [langKey, deeplCode] of Object.entries(languageMap)) {
    if (!translations[langKey]) translations[langKey] = {};
    console.log(`Oversætter til ${langKey.toUpperCase()}...`);

    for (const [key, englishText] of Object.entries(englishDict)) {
      // Oversætter den engelske tekst
      translations[langKey][key] = await translateText(englishText, deeplCode);
    }
  }

  // Erstat den gamle translations-blok i index.html med den opdaterede
  const updatedTranslationsJson = JSON.stringify(translations, null, 2);
  const newHtmlContent = htmlContent.replace(
    /const translations = \{[\s\S]*?\};/,
    `const translations = ${updatedTranslationsJson};`
  );

  fs.writeFileSync(filePath, newHtmlContent, 'utf8');
  console.log('\n Succes! index.html er nu opdateret med de nye oversættelser på alle sprog.');
}

updateIndexHtml();