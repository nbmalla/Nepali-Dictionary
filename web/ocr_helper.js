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

  // A stuck OCR/conversion call previously looked like the app "freezing"
  // (no error, no way out). Every slow step below is bounded so it always
  // resolves to either a result or a clear error.
  function withTimeout(promise, ms, label) {
    return Promise.race([
      promise,
      new Promise((_, reject) =>
        setTimeout(() => reject(new Error(`${label} timed out after ${ms / 1000}s`)), ms)
      ),
    ]);
  }

  function loadImage(dataUrl) {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = () => resolve(img);
      img.onerror = () => reject(new Error('image failed to decode'));
      img.src = dataUrl;
    });
  }

  // Downscales a data URL to at most maxDim on its longest side. Full-res
  // phone photos otherwise make Tesseract very slow (or exhaust memory) on
  // mobile browsers. Bounded by withTimeout; falls back to the original
  // image (via the caller's catch) if decoding/drawing ever hangs or fails.
  async function resizeDataUrl(dataUrl, maxDim) {
    const img = await loadImage(dataUrl);
    const scale = Math.min(1, maxDim / Math.max(img.width, img.height));
    if (scale >= 1) return dataUrl;
    const canvas = document.createElement('canvas');
    canvas.width = Math.round(img.width * scale);
    canvas.height = Math.round(img.height * scale);
    const ctx = canvas.getContext('2d');
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    return canvas.toDataURL('image/jpeg', 0.85);
  }

  function ensureKuroshiro() {
    if (!kuroshiroReadyPromise) {
      kuroshiroReadyPromise = withTimeout(
        (async () => {
          const analyzer = new KuromojiAnalyzer({
            dictPath: 'https://cdn.jsdelivr.net/npm/kuromoji@0.1.2/dict/',
          });
          const k = new Kuroshiro();
          await k.init(analyzer);
          kuroshiroInstance = k;
        })(),
        30000,
        'kuroshiro init'
      ).catch((e) => {
        kuroshiroReadyPromise = null; // allow retrying on the next photo
        throw e;
      });
    }
    return kuroshiroReadyPromise;
  }

  async function recognizeAndRomanize(imageDataUrl) {
    let ocrInput = imageDataUrl;
    try {
      ocrInput = await withTimeout(resizeDataUrl(imageDataUrl, 1600), 12000, 'image resize');
    } catch (e) {
      ocrInput = imageDataUrl; // fall back to the original photo
    }

    const result = await withTimeout(Tesseract.recognize(ocrInput, 'jpn'), 45000, 'OCR');
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
          hiragana = await withTimeout(
            kuroshiroInstance.convert(japanese, { to: 'hiragana', mode: 'normal' }),
            15000,
            'hiragana convert'
          );
        } catch (e) {
          romajiError = 'hiragana convert: ' + String((e && e.message) || e);
        }

        try {
          romaji = await withTimeout(
            kuroshiroInstance.convert(japanese, {
              to: 'romaji',
              mode: 'spaced',
              romajiSystem: 'hepburn',
            }),
            15000,
            'romaji convert'
          );
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
