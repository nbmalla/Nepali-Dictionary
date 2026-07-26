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

### どのフレーズが何番か調べる

`assets/audio/index_reference.md` に、全カテゴリー×全フレーズの番号対応表があります。
迷ったらまずここを見てください。新しいフレーズを追加したときは、この表も更新してください
(手動更新でOK。件数が多い場合は「index_reference.mdを更新して」とAIに頼んでも良い)。

## 録音のコツ

- iPhoneの「ボイスメモ」などで1フレーズ1テイクで録音するのが一番簡単(あとで切り出す手間が省ける)
- 形式: mp3(iPhoneは`.m4a`で録音されるので変換が必要。Windowsなら無料の**Audacity**で
  `.m4a`を開いて`.mp3`でエクスポートするのが簡単)
- はっきり、少しゆっくりめに発音する(学習者向けのため)
- 前後の無音を短くトリミングする(タップしてから発音が始まるまでの間延びを防ぐため)
- ファイルサイズはできるだけ小さく(数百KB程度が目安。サイト全体の読み込み速度に影響します)
- **同じ内容のファイルを2箇所にコピーしてしまわないよう注意**(例: 0.mp3と3.mp3が同じ音声になる、など)。
  不安なら `md5sum assets/audio/<categoryId>/*.mp3` で全ファイルのハッシュを比較すると、
  同一ファイルの重複がないか確認できます

## 反映方法(自分で行う場合)

1. 録音ファイル(mp3)を上記の命名規則で `assets/audio/<categoryId>/<index>.mp3` に置く
2. (任意だが推奨)ローカルで軽く確認: プロジェクトフォルダで
   ```
   flutter analyze
   ```
   を実行してエラーがないか確認(音声ファイルだけの変更ならコード側のエラーは基本出ません)
3. コミットしてpush:
   ```
   git add assets/audio/<categoryId>/
   git commit -m "Add/update <categoryId> voice recordings"
   git push origin main
   ```
4. pushすると GitHub Actions が自動でビルド・`gh-pages` へのデプロイまで行います
   (`.github/workflows/deploy.yml`)。数分後に https://nbmalla.github.io/Nepali-Dictionary/ に反映されます。
   進行状況は https://github.com/nbmalla/Nepali-Dictionary/actions で確認できます

ファイルが存在しない項目は、これまで通りTTSで読み上げられます。
