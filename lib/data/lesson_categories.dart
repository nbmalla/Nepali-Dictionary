/// Category display metadata: id, icon, and bilingual labels.
/// Order here is the intended home-screen display order.
class LessonCategory {
  final String id;
  final String icon;
  final String jpLabel;
  final String neLabel;

  const LessonCategory({
    required this.id,
    required this.icon,
    required this.jpLabel,
    required this.neLabel,
  });
}

const List<LessonCategory> lessonCategories = [
  LessonCategory(id: 'greetings', icon: '👋', jpLabel: 'あいさつと自己紹介', neLabel: 'अभिवादन र परिचय'),
  LessonCategory(id: 'emergency_phrases', icon: '🆘', jpLabel: '困ったときのひとこと', neLabel: 'अप्ठ्यारोमा भन्ने वाक्य'),
  LessonCategory(id: 'numbers_money', icon: '🔢', jpLabel: '数字・お金の数え方', neLabel: 'अंक र पैसा'),
  LessonCategory(id: 'time_date', icon: '🕐', jpLabel: '時間・曜日・日付', neLabel: 'समय, बार, मिति'),
  LessonCategory(id: 'directions', icon: '🗺️', jpLabel: '道案内・場所を尋ねる', neLabel: 'बाटो सोध्ने'),
  LessonCategory(id: 'transportation', icon: '🚃', jpLabel: '交通機関', neLabel: 'यातायात'),
  LessonCategory(id: 'shopping_convenience', icon: '🏪', jpLabel: '買い物とコンビニ', neLabel: 'किनमेल/कन्भिनि'),
  LessonCategory(id: 'meal_basics', icon: '🍚', jpLabel: '食事の基本', neLabel: 'खानाको आधारभूत कुरा'),
  LessonCategory(id: 'food_names', icon: '🍣', jpLabel: '日本料理の名前', neLabel: 'जापानी परिकारका नाम'),
  LessonCategory(id: 'restaurant_order', icon: '🍽️', jpLabel: 'レストランで注文', neLabel: 'रेस्टुरेन्टमा अर्डर'),
  LessonCategory(id: 'phone_email', icon: '📞', jpLabel: '電話・メールの基本', neLabel: 'फोन/इमेल'),
  LessonCategory(id: 'small_talk', icon: '💬', jpLabel: '趣味・雑談', neLabel: 'शौक/जमघट कुराकानी'),
  LessonCategory(id: 'beauty_clothes', icon: '💇', jpLabel: '美容院・買い物(衣類)', neLabel: 'सैलुन/लुगा किनमेल'),
  LessonCategory(id: 'workplace', icon: '🏢', jpLabel: '仕事・職場', neLabel: 'कार्यस्थल'),
  LessonCategory(id: 'job_interview', icon: '📝', jpLabel: 'アルバイト面接・履歴書', neLabel: 'अन्तर्वार्ता/बायोडाटा'),
  LessonCategory(id: 'salary_tax', icon: '💰', jpLabel: '給与・税金・保険', neLabel: 'तलब/कर/बीमा'),
  LessonCategory(id: 'city_office', icon: '🏛️', jpLabel: '役所・在留手続き', neLabel: 'सरकारी अफिस/भिसा'),
  LessonCategory(id: 'health', icon: '🏥', jpLabel: '病院・体調不良', neLabel: 'अस्पताल/स्वास्थ्य'),
  LessonCategory(id: 'moving', icon: '🏠', jpLabel: '引っ越し・部屋探し', neLabel: 'घर/कोठा खोज्ने'),
  LessonCategory(id: 'school', icon: '🏫', jpLabel: '学校・勉強', neLabel: 'विद्यालय/अध्ययन'),
  LessonCategory(id: 'manners', icon: '🙇', jpLabel: '日本の作法', neLabel: 'जापानी शिष्टाचार'),
  LessonCategory(id: 'culture', icon: '🎎', jpLabel: '日本の文化', neLabel: 'जापानी संस्कृति'),
  LessonCategory(id: 'weather_seasons', icon: '☀️', jpLabel: '天気・季節のあいさつ', neLabel: 'मौसम/ऋतु चाडपर्व'),
  LessonCategory(id: 'daily_life', icon: '🗑️', jpLabel: '生活でよくある場面', neLabel: 'दैनिक जीवनका दृश्य'),
  LessonCategory(id: 'disaster', icon: '🚨', jpLabel: '災害・緊急時対応', neLabel: 'विपद्/आपतकालीन'),
];
