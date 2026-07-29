import 'package:flutter/material.dart';

/// Category display metadata: id, icon, and bilingual labels.
/// Order here is the intended home-screen display order.
class LessonCategory {
  final String id;
  final IconData icon;
  final String jpLabel;
  final String neLabel;
  final String subtitle;

  const LessonCategory({
    required this.id,
    required this.icon,
    required this.jpLabel,
    required this.neLabel,
    required this.subtitle,
  });
}

const List<LessonCategory> lessonCategories = [
  LessonCategory(id: 'hiragana', icon: Icons.spellcheck_outlined, jpLabel: 'ひらがな', neLabel: 'हिरागाना (जापानी वर्णमाला)', subtitle: '基本の発音(あ〜ん・濁音・半濁音)'),
  LessonCategory(id: 'katakana', icon: Icons.text_fields_outlined, jpLabel: 'カタカナ', neLabel: 'काताकाना (जापानी वर्णमाला)', subtitle: '基本の発音(ア〜ン・濁音・半濁音)'),
  LessonCategory(id: 'greetings', icon: Icons.emoji_people_outlined, jpLabel: 'あいさつと自己紹介', neLabel: 'अभिवादन र परिचय', subtitle: 'あいさつ・名前・自己紹介'),
  LessonCategory(id: 'emergency_phrases', icon: Icons.sos_outlined, jpLabel: '困ったときのひとこと', neLabel: 'अप्ठ्यारोमा प्रयोग हुने शब्द ', subtitle: '助けを求める・聞き返す'),
  LessonCategory(id: 'numbers_money', icon: Icons.payments_outlined, jpLabel: '数字・お金の数え方', neLabel: 'अंक र पैसा', subtitle: '値段・支払い'),
  LessonCategory(id: 'time_date', icon: Icons.schedule_outlined, jpLabel: '時間・曜日・日付', neLabel: 'समय, बार, मिति', subtitle: '時刻・曜日の言い方'),
  LessonCategory(id: 'directions', icon: Icons.map_outlined, jpLabel: '道案内・場所を尋ねる', neLabel: 'बाटो सोध्ने', subtitle: '道を聞く・案内する'),
  LessonCategory(id: 'transportation', icon: Icons.train_outlined, jpLabel: '交通機関', neLabel: 'यातायात', subtitle: '電車・バス・タクシー'),
  LessonCategory(id: 'shopping_convenience', icon: Icons.storefront_outlined, jpLabel: '買い物とコンビニ', neLabel: 'किनमेल/कन्भिनि', subtitle: 'レジでの会話'),
  LessonCategory(id: 'meal_basics', icon: Icons.restaurant_outlined, jpLabel: '食事の基本', neLabel: 'खानाको बारेमा जान्नु पर्ने आधारभुत कुराहरु ', subtitle: '食事のマナーと表現'),
  LessonCategory(id: 'food_names', icon: Icons.ramen_dining_outlined, jpLabel: '日本料理の名前', neLabel: 'जापानी परिकारका नाम', subtitle: '料理・メニューの名前'),
  LessonCategory(id: 'restaurant_order', icon: Icons.receipt_long_outlined, jpLabel: 'レストランで注文', neLabel: 'रेस्टुरेन्टमा अर्डर', subtitle: '注文・会計'),
  LessonCategory(id: 'phone_email', icon: Icons.call_outlined, jpLabel: '電話・メールの基本', neLabel: 'फोन/इमेल', subtitle: '電話応対・ビジネスメール'),
  LessonCategory(id: 'small_talk', icon: Icons.chat_bubble_outline, jpLabel: '趣味・雑談', neLabel: 'जमघट कुराकानी', subtitle: '雑談・相槌'),
  LessonCategory(id: 'beauty_clothes', icon: Icons.content_cut_outlined, jpLabel: '美容院・買い物(衣類)', neLabel: 'सैलुन/लुगा किनमेल', subtitle: '散髪・試着'),
  LessonCategory(id: 'workplace', icon: Icons.business_center_outlined, jpLabel: '仕事・職場', neLabel: 'कार्यस्थल', subtitle: '職場での会話'),
  LessonCategory(id: 'job_interview', icon: Icons.badge_outlined, jpLabel: 'アルバイト面接・履歴書', neLabel: 'अन्तर्वार्ता/बायोडाटा', subtitle: '面接・履歴書'),
  LessonCategory(id: 'salary_tax', icon: Icons.account_balance_wallet_outlined, jpLabel: '給与・税金・保険', neLabel: 'तलब/कर/बीमा', subtitle: '給料・税金の仕組み'),
  LessonCategory(id: 'city_office', icon: Icons.account_balance_outlined, jpLabel: '役所・在留手続き', neLabel: 'सरकारी अफिस/भिसा', subtitle: '在留カード・住民票'),
  LessonCategory(id: 'health', icon: Icons.local_hospital_outlined, jpLabel: '病院・体調不良', neLabel: 'अस्पताल/स्वास्थ्य', subtitle: '症状の伝え方'),
  LessonCategory(id: 'moving', icon: Icons.home_work_outlined, jpLabel: '引っ越し・部屋探し', neLabel: 'घर/कोठा खोज्ने', subtitle: '部屋探し・契約'),
  LessonCategory(id: 'school', icon: Icons.school_outlined, jpLabel: '学校・勉強', neLabel: 'विद्यालय/अध्ययन', subtitle: '授業・奨学金'),
  LessonCategory(id: 'manners', icon: Icons.self_improvement_outlined, jpLabel: '日本の作法', neLabel: 'जापानी शिष्टाचार', subtitle: 'お辞儀・靴・チップ'),
  LessonCategory(id: 'culture', icon: Icons.festival_outlined, jpLabel: '日本の文化', neLabel: 'जापानी संस्कृति', subtitle: '温泉・行事・敬語'),
  LessonCategory(id: 'weather_seasons', icon: Icons.wb_sunny_outlined, jpLabel: '天気・季節のあいさつ', neLabel: 'मौसम/ऋतु चाडपर्व', subtitle: '天気の話・年中行事'),
  LessonCategory(id: 'daily_life', icon: Icons.checklist_outlined, jpLabel: '生活でよくある場面', neLabel: 'दैनिक जीवनका दृश्य', subtitle: 'ゴミ出し・銀行・郵便'),
  LessonCategory(id: 'disaster', icon: Icons.warning_amber_outlined, jpLabel: '災害・緊急時対応', neLabel: 'विपद्/आपतकालीन', subtitle: '地震・避難・119番'),
  LessonCategory(id: 'jlpt_n5_nouns_1', icon: Icons.label_outline, jpLabel: 'JLPT N5 語彙:名詞①', neLabel: 'JLPT N5 शब्दावली: संज्ञा १', subtitle: '基礎名詞(前半)'),
  LessonCategory(id: 'jlpt_n5_nouns_2', icon: Icons.category_outlined, jpLabel: 'JLPT N5 語彙:名詞②', neLabel: 'JLPT N5 शब्दावली: संज्ञा २', subtitle: '基礎名詞(後半)'),
  LessonCategory(id: 'jlpt_n5_verbs', icon: Icons.directions_run_outlined, jpLabel: 'JLPT N5 語彙:動詞', neLabel: 'JLPT N5 शब्दावली: क्रिया', subtitle: 'グループ1・2・3の動詞'),
  LessonCategory(id: 'jlpt_n5_adjectives', icon: Icons.palette_outlined, jpLabel: 'JLPT N5 語彙:形容詞', neLabel: 'JLPT N5 शब्दावली: विशेषण', subtitle: 'い形容詞・な形容詞'),
  LessonCategory(id: 'jlpt_n5_other', icon: Icons.help_outline, jpLabel: 'JLPT N5 語彙:代名詞・副詞など', neLabel: 'JLPT N5 शब्दावली: सर्वनाम/क्रियाविशेषण आदि', subtitle: '代名詞・副詞・接続詞・疑問詞'),
  LessonCategory(id: 'jlpt_n4_nouns', icon: Icons.label_important_outline, jpLabel: 'JLPT N4 語彙:名詞', neLabel: 'JLPT N4 शब्दावली: संज्ञा', subtitle: '抽象的な名詞・社会/自然の言葉'),
  LessonCategory(id: 'jlpt_n4_verbs', icon: Icons.directions_run, jpLabel: 'JLPT N4 語彙:動詞', neLabel: 'JLPT N4 शब्दावली: क्रिया', subtitle: 'グループ1・2・3の動詞'),
  LessonCategory(id: 'jlpt_n4_adjectives', icon: Icons.palette, jpLabel: 'JLPT N4 語彙:形容詞', neLabel: 'JLPT N4 शब्दावली: विशेषण', subtitle: 'い形容詞・な形容詞'),
  LessonCategory(id: 'jlpt_n4_other', icon: Icons.help, jpLabel: 'JLPT N4 語彙:副詞・接続詞など', neLabel: 'JLPT N4 शब्दावली: क्रियाविशेषण/संयोजक आदि', subtitle: '副詞・接続詞'),
  LessonCategory(id: 'jlpt_n4_grammar', icon: Icons.rule_outlined, jpLabel: 'JLPT N4 文法', neLabel: 'JLPT N4 व्याकरण', subtitle: '文の作り方(パターン+例文)'),
  LessonCategory(id: 'jlpt_n4_fill_blank', icon: Icons.edit_note_outlined, jpLabel: 'JLPT N4 穴埋め問題', neLabel: 'JLPT N4 रिक्तस्थान भर्ने अभ्यास', subtitle: '文法の実践問題'),
];
