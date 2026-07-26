import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/ocr_service.dart';
import '../theme/app_theme.dart';

/// "カメラで読む" (क्यामेराबाट पढ्नुहोस्): photograph a sign/menu/handout and
/// get the Japanese text plus a romaji reading, using free client-side OCR
/// (Tesseract.js) and romanization (kuroshiro) — no server, no API key.
///
/// Accuracy is noticeably below a commercial app like Google Lens, especially
/// on handwriting, glare, or an angled shot. It's a free starting point, not
/// a precise translator.
class OcrReaderScreen extends StatefulWidget {
  const OcrReaderScreen({super.key});

  @override
  State<OcrReaderScreen> createState() => _OcrReaderScreenState();
}

class _OcrReaderScreenState extends State<OcrReaderScreen> {
  final ImagePicker _picker = ImagePicker();

  Uint8List? _imageBytes;
  bool _loading = false;
  OcrResult? _result;
  String? _error;

  Future<void> _pick(ImageSource source) async {
    XFile? file;
    try {
      // Note: resizing is done on the JS side (with its own timeout) instead
      // of via image_picker's maxWidth/maxHeight — that option runs a canvas
      // resize inside the plugin that isn't timeout-bound and has been known
      // to hang on large iOS Safari photos.
      file = await _picker.pickImage(source: source, imageQuality: 85);
    } catch (e) {
      setState(() => _error = '画像を取得できませんでした / फोटो लिन सकिएन: $e');
      return;
    }
    if (file == null) return;

    final bytes = await file.readAsBytes();
    setState(() {
      _imageBytes = bytes;
      _loading = true;
      _result = null;
      _error = null;
    });

    try {
      final mime = file.mimeType ?? 'image/jpeg';
      final dataUrl = 'data:$mime;base64,${base64Encode(bytes)}';
      final result = await OcrService.instance.recognizeAndRomanize(dataUrl);
      if (!mounted) return;
      setState(() {
        _result = result;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = '読み取りに失敗しました / पढ्न सकिएन: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.pageBackground(context),
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground(context),
        title: const Text('カメラで読む (क्यामेराबाट पढ्नुहोस्)'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardBackground(context),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '看板やメニューなど、印刷された漢字を撮影すると読み方(ローマ字)を表示します。\n'
                'फोटो खिचेर जापानी अक्षर (कान्जी) को उच्चारण (रोमाजी) हेर्नुहोस्।\n'
                '※無料のOCRを使っているため、認識精度には限界があります。手書き文字には対応していません。\n'
                '※ह्यान्डराइटिङ (हस्तलिखित अक्षर) मा काम गर्दैन — छापिएको अक्षरमा मात्र प्रयोग गर्नुहोस्।',
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _loading ? null : () => _pick(ImageSource.camera),
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: const Text('写真を撮る'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _loading ? null : () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.image_outlined),
                    label: const Text('画像を選ぶ'),
                  ),
                ),
              ],
            ),
            if (_imageBytes != null) ...[
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(_imageBytes!, fit: BoxFit.contain),
              ),
            ],
            if (_loading) ...[
              const SizedBox(height: 20),
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  '解析中… (少し時間がかかります) / विश्लेषण गर्दै…',
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 16),
              Text(_error!, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
            ],
            if (_result != null) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('認識した文字 / पहिचान भएको अक्षर', style: theme.textTheme.labelMedium),
                    const SizedBox(height: 6),
                    SelectableText(
                      _result!.japanese.isEmpty ? '(認識できませんでした)' : _result!.japanese,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 14),
                    Text('ひらがな / हिरागाना', style: theme.textTheme.labelMedium),
                    const SizedBox(height: 6),
                    SelectableText(
                      _result!.hiragana.isEmpty ? '(変換できませんでした)' : _result!.hiragana,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 14),
                    Text('ローマ字 / रोमाजी', style: theme.textTheme.labelMedium),
                    const SizedBox(height: 6),
                    SelectableText(
                      _result!.romaji.isEmpty ? '(変換できませんでした)' : _result!.romaji,
                      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary),
                    ),
                    if (_result!.romajiError != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'ローマ字変換エラー: ${_result!.romajiError}',
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
