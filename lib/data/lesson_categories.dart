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
  LessonCategory(id: 'greetings', icon: Icons.emoji_people_outlined, jpLabel: 'あいさつと自己紹介', neLabel: 'अभिवादन र परिचय', subtitle: 'あいさつ・名前・自己紹介'),
  LessonCategory(id: 'emergency_phrases', icon: Icons.sos_outlined, jpLabel: '困ったときのひとこと', neLabel: 'अप्ठ्यारोमा भन्ने वाक्य', subtitle: '助けを求める・聞き返す'),
  LessonCategory(id: 'numbers_money', icon: Icons.payments_outlined, jpLabel: '数字・お金の数え方', neLabel: 'अंक र पैसा', subtitle: '値段・支払い'),
  LessonCategory(id: 'time_date', icon: Icons.schedule_outlined, jpLabel: '時間・曜日・日付', neLabel: 'समय, बार, मिति', subtitle: '時刻・曜日の言い方'),
  LessonCategory(id: 'directions', icon: Icons.map_outlined, jpLabel: '道案内・場所を尋ねる', neLabel: 'बाटो सोध्ने', subtitle: '道を聞く・案内する'),
  LessonCategory(id: 'transportation', icon: Icons.train_outlined, jpLabel: '交通機関', neLabel: 'यातायात', subtitle: '電車・バス・タクシー'),
  LessonCategory(id: 'shopping_convenience', icon: Icons.storefront_outlined, jpLabel: '買い物とコンビニ', neLabel: 'किनमेल/कन्भिनि', subtitle: 'レジでの会話'),
  LessonCategory(id: 'meal_basics', icon: Icons.restaurant_outlined, jpLabel: '食事の基本', neLabel: 'खानाको आधारभूत कुरा', subtitle: '食事のマナーと表現'),
  LessonCategory(id: 'food_names', icon: Icons.ramen_dining_outlined, jpLabel: '日本料理の名前', neLabel: 'जापानी परिकारका नाम', subtitle: '料理・メニューの名前'),
  LessonCategory(id: 'restaurant_order', icon: Icons.receipt_long_outlined, jpLabel: 'レストランで注文', neLabel: 'रेस्टुरेन्टमा अर्डर', subtitle: '注文・会計'),
  LessonCategory(id: 'phone_email', icon: Icons.call_outlined, jpLabel: '電話・メールの基本', neLabel: 'फोन/इमेल', subtitle: '電話応対・ビジネスメール'),
  LessonCategory(id: 'small_talk', icon: Icons.chat_bubble_outline, jpLabel: '趣味・雑談', neLabel: 'शौक/जमघट कुराकानी', subtitle: '雑談・相槌'),
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
];
