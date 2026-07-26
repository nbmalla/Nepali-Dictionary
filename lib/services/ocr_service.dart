import 'dart:convert';
import 'dart:js_interop';

/// Result of running OCR + romanization on a photo.
class OcrResult {
  final String japanese;
  final String romaji;
  final String? romajiError;

  const OcrResult({required this.japanese, required this.romaji, this.romajiError});
}

@JS('NepaliDictOcr.recognizeAndRomanize')
external JSPromise<JSString> _recognizeAndRomanize(JSString imageDataUrl);

/// Runs Japanese OCR (Tesseract.js) and romanization (kuroshiro) on a photo,
/// entirely in the browser — see web/ocr_helper.js. Requires an internet
/// connection the first time it's used (to fetch the OCR/dictionary data),
/// after which the browser caches it.
class OcrService {
  OcrService._();
  static final OcrService instance = OcrService._();

  Future<OcrResult> recognizeAndRomanize(String imageDataUrl) async {
    final jsResult = await _recognizeAndRomanize(imageDataUrl.toJS).toDart;
    final map = jsonDecode(jsResult.toDart) as Map<String, dynamic>;
    final romajiError = map['romajiError'] as String?;
    return OcrResult(
      japanese: map['japanese'] as String? ?? '',
      romaji: map['romaji'] as String? ?? '',
      romajiError: (romajiError == null || romajiError.isEmpty) ? null : romajiError,
    );
  }
}
