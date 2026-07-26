// Client-side OCR + romanization for the "カメラで読む" feature.
// Everything here runs in the browser (Tesseract.js OCR + kuroshiro/kuromoji
// romanization); no server or API key is involved, so it works on the free
// GitHub Pages hosting this app already uses.
//
// Loaded by web/index.html alongside tesseract.js / kuroshiro / the kuromoji
// analyzer (all from a CDN). See lib/services/ocr_service.dart for the Dart
// side that calls window.NepaliDictOcr.recognizeAndRomanize.
window.NepaliDictOcr = (function () {
  let kuroshiroInstance = null;
  let kuroshiroReadyPromise = null;

  function ensureKuroshiro() {
    if (!kuroshiroReadyPromise) {
      kuroshiroReadyPromise = (async () => {
        const analyzer = new KuromojiAnalyzer({
          dictPath: 'https://cdn.jsdelivr.net/npm/kuromoji@0.1.2/dict/',
        });
        const k = new Kuroshiro.default();
        await k.init(analyzer);
        kuroshiroInstance = k;
      })();
    }
    return kuroshiroReadyPromise;
  }

  async function recognizeAndRomanize(imageDataUrl) {
    const result = await Tesseract.recognize(imageDataUrl, 'jpn');
    const japanese = (result.data.text || '').trim();

    let romaji = '';
    let romajiError = '';
    if (japanese) {
      try {
        await ensureKuroshiro();
        romaji = await kuroshiroInstance.convert(japanese, {
          to: 'romaji',
          mode: 'spaced',
          romajiSystem: 'hepburn',
        });
      } catch (e) {
        romajiError = String((e && e.message) || e);
      }
    }

    return JSON.stringify({ japanese: japanese, romaji: romaji, romajiError: romajiError });
  }

  return { recognizeAndRomanize: recognizeAndRomanize };
})();
