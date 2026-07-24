# 発音を自分の録音に差し替える

各フレーズの🔊ボタンは、対応する録音ファイルがあればそれを再生し、
なければ自動的に端末/ブラウザの音声合成(TTS)にフォールバックします。
コードの変更は不要です。

## ファイルの置き方

```
assets/audio/<categoryId>/<index>.mp3
```

- `<categoryId>` … `lib/data/lesson_categories.dart` の `id`(例: `greetings`, `transportation`)
- `<index>` … そのカテゴリー内でのフレーズの並び順(0番目から)。
  `lib/data/lesson_items_data.dart` の `lessonItemsByCategory['<categoryId>']` リストで
  上から数えた位置(0-indexed)と一致させてください。

### 例

`greetings` カテゴリーの1番目(`おはようございます`)を差し替える場合:

```
assets/audio/greetings/0.mp3
```

## 録音のコツ

- 形式: mp3(wav/aacでも動作しますが、拡張子は `.mp3` に統一してください。他形式を使う場合は
  `lib/services/audio_service.dart` の拡張子指定も合わせて変更してください)
- はっきり、少しゆっくりめに発音する(学習者向けのため)
- 前後の無音を短くトリミングする(タップしてから発音が始まるまでの間延びを防ぐため)
- ファイルサイズはできるだけ小さく(数百KB程度が目安。サイト全体の読み込み速度に影響します)

## 反映方法

1. 録音ファイルを上記の命名規則で `assets/audio/` 以下に追加
2. `flutter pub get` → `flutter build web` でビルドし直す
3. GitHubにpush(`main`ブランチ)
4. `gh-pages` ブランチも再ビルド・再デプロイして公開サイトに反映

ファイルが存在しない項目は、これまで通りTTSで読み上げられます。
