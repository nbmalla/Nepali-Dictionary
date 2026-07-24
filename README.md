# Nep Dictionary

日本で生活・就労するネパール語話者向けの、日本語フレーズ・文化知識 学習Webアプリ(Flutter Web製)。

25カテゴリー・約240項目のコンテンツを収録:あいさつ、緊急時のひとこと、数字・お金、
交通機関、買い物、食事、就労(職場・面接・給与税金保険)、役所・在留手続き、病院、
引っ越し、学校、日本の作法・文化・季節行事、災害対応など。

## 主な機能

- **フレーズカード**: 日本語(ローマ字付き)⇄ネパール語訳をタップでフリップ
- **知識カード**: 作法・文化などの読み物形式コンテンツ
- **🔊 発音読み上げ**: 日本語フレーズをその場で音声再生([flutter_tts](https://pub.dev/packages/flutter_tts))
- **練習モード**: フレーズをスワイプ形式で繰り返し学習、「わかった/もう一度」で習熟管理
- **進捗保存**: 覚えたフレーズをローカルに記録([shared_preferences](https://pub.dev/packages/shared_preferences))
- **検索・今日のフレーズ**: ホーム画面でカテゴリー横断検索、日替わりフレーズ表示
- **設定**: UI言語(日本語/ネパール語)、文字サイズ、読み上げ速度の調整

## プロジェクト構成

```
lib/
  models/lesson_item.dart        LessonItem / ContentKind (phrase, knowledge)
  data/lesson_categories.dart    カテゴリー一覧(id・アイコン・表示順・和訳/ネ訳ラベル)
  data/lesson_items_data.dart    全カテゴリーのコンテンツ本体
  services/tts_service.dart      flutter_tts ラッパー(日本語読み上げ)
  state/app_settings.dart        UI言語・文字サイズ・読み上げ速度(永続化)
  state/progress_store.dart      「覚えた」進捗の永続化
  widgets/phrase_flip_card.dart  フレーズカード(フリップ演出)
  widgets/knowledge_card.dart    知識カード
  screens/home_screen.dart       ホーム(カテゴリー一覧・検索・今日のフレーズ)
  screens/category_detail_screen.dart  カテゴリー詳細(カード一覧)
  screens/practice_screen.dart   練習モード
  screens/settings_screen.dart   設定
```

## セットアップ

```bash
flutter pub get
flutter run -d chrome      # ローカルで確認
flutter build web          # 本番ビルド (build/web に出力)
```

## 補足

- 音声読み上げは日本語フレーズ(`primary`)のみ対応。ブラウザ/OS内蔵の音声合成エンジンを利用するため追加費用は発生しない。ネパール語(`meaning`)側の読み上げは対応ブラウザが少ないため未対応(将来的にクラウドTTSでの対応を検討)。
- コンテンツはすべて `lib/data/lesson_items_data.dart` に集約。新しいカテゴリーを追加する場合は `lib/data/lesson_categories.dart` にもエントリを追加すること。
