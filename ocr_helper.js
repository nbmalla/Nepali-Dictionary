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
        const k = new Kuroshiro();
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
    let hiragana = '';
    let romajiError = '';
    if (japanese) {
      try {
        await ensureKuroshiro();
      } catch (e) {
        romajiError = 'kuroshiro init: ' + String((e && e.message) || e);
      }

      if (!romajiError) {
        // Try hiragana too: it's the simplest conversion path (no romaji
        // table lookup), so if this also comes back empty with no error,
        // the input itself (e.g. garbled OCR output) is the problem, not
        // the romaji conversion specifically.
        try {
          hiragana = await kuroshiroInstance.convert(japanese, { to: 'hiragana', mode: 'normal' });
        } catch (e) {
          romajiError = 'hiragana convert: ' + String((e && e.message) || e);
        }

        try {
          romaji = await kuroshiroInstance.convert(japanese, {
            to: 'romaji',
            mode: 'spaced',
            romajiSystem: 'hepburn',
          });
        } catch (e) {
          const msg = 'romaji convert: ' + String((e && e.message) || e);
          romajiError = romajiError ? romajiError + ' | ' + msg : msg;
        }
      }
    }

    return JSON.stringify({
      japanese: japanese,
      romaji: romaji,
      hiragana: hiragana,
      romajiError: romajiError,
    });
  }

  return { recognizeAndRomanize: recognizeAndRomanize };
})();
