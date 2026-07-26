import '../models/lesson_item.dart';

/// Full phrase/knowledge-card catalogue for every lesson category, keyed
/// by category id (matches the id field in lib/data/lesson_categories.dart).
///
/// - あいさつと自己紹介, 困ったときのひとこと, 食事の基本, 日本料理の名前,
///   レストランで注文, 買い物とコンビニ, 交通機関, 仕事・職場,
///   アルバイト面接・履歴書, 役所・在留手続き, 病院・体調不良, 給与・税金・保険,
///   道案内, 時間・曜日・日付, 数字・お金, 電話・メール, 趣味・雑談,
///   美容院・買い物(衣類) → phrase-based flashcards (some mixed with knowledge cards)
/// - 日本の作法, 日本の文化, 生活でよくある場面, 引っ越し・部屋探し, 学校・勉強,
///   天気・季節のあいさつ, 災害・緊急時対応 → knowledge/etiquette cards

final Map<String, List<LessonItem>> lessonItemsByCategory = {
  // 1. あいさつと自己紹介 -----------------------------------------------
  'greetings': const [
    LessonItem(
      primary: 'おはようございます',
      romaji: 'Ohayou gozaimasu',
      meaning: 'शुभ प्रभात (बिहान)',
      note: 'बिहान १०ः०० बजेसम्म प्रयोग हुन्छ',
    ),
    LessonItem(
      primary: 'こんにちは',
      romaji: 'Konnichiwa',
      meaning: 'नमस्ते (दिउँसो)',
      note: 'दिउँसो प्रयोग गरिने सामान्य अभिवादन',
    ),
    LessonItem(
      primary: 'こんばんは',
      romaji: 'Konbanwa',
      meaning: 'नमस्ते (साँझ)',
      note: 'साँझपछि प्रयोग गरिने सामान्य अभिवादन',
    ),
    LessonItem(
      primary: 'はじめまして',
      romaji: 'Hajimemashite',
      meaning: 'पहिलो पटक भेट्दा भन्ने वाक्य',
      note: 'नयाँ व्यक्तिसँग भेट्दा सुरुमा भन्ने',
    ),
    LessonItem(
      primary: 'わたしは［　］です',
      romaji: 'Watashi wa [___] desu',
      meaning: 'म ___ हुँ',
      note: 'नाम/पेशा भर्ने ढाँचा — self-intro core pattern',
    ),
    LessonItem(
      primary: 'どうぞよろしくお願いします',
      romaji: 'Douzo yoroshiku onegaishimasu',
      meaning: 'धेरै धेरै धन्यवाद र साथसाथै मेरो लागि सहयोग गर्नुहोस्',
      note: 'परिचयपछि झुकेर भन्ने अत्यन्त महत्त्वपूर्ण वाक्य',
    ),
    LessonItem(
      primary: 'ありがとうございます',
      romaji: 'Arigatou gozaimasu',
      meaning: 'धन्यवाद (औपचारिक)',
      note: 'जुनसुकै बेला प्रयोग हुने सम्मानित धन्यवाद',
    ),
    LessonItem(
      primary: 'さようなら／またね',
      romaji: 'Sayounara / Mata ne',
      meaning: 'बिदा हुँदा / छुट्टिंदा  — औपचारिक/अनौपचारिक',
      note: 'Sayounara=औपचारिक बिदाइ, Mata ne=साथीसँग फेरि भेटौँला',
    ),
  ],

  // 2. 困ったときのひとこと -----------------------------------------------
  'emergency_phrases': const [
    LessonItem(
      primary: 'すみません',
      romaji: 'Sumimasen',
      meaning: 'माफ गर्नुहोस् / ध्यान दिनुहोस्',
      note: 'ध्यान तान्न वा माफी माग्न दुवैमा प्रयोग',
    ),
    LessonItem(
      primary: 'わかりません',
      romaji: 'Wakarimasen',
      meaning: 'मैले बुझिन / मलाई थाहाछैन',
      note: 'इमानदारीपूर्वक भन्नु राम्रो — नबुझी टाउको हल्लाउनु भन्दा',
    ),
    LessonItem(
      primary: 'もう一度お願いします',
      romaji: 'Mou ichido onegaishimasu',
      meaning: 'फेरि एक पटक भन्नुहोस्',
      note: 'कुरा नबुझेमा दोहोर्याउन अनुरोध',
    ),
    LessonItem(
      primary: 'ゆっくり話してください',
      romaji: 'Yukkuri hanashite kudasai',
      meaning: 'बिस्तारै बोल्नुहोस्',
      note: 'छिटोछिटो बोलिएको बेलामा प्रयोग',
    ),
    LessonItem(
      primary: 'これはなんですか',
      romaji: 'Kore wa nan desu ka',
      meaning: 'यो के हो?',
      note: 'कुनै चिज नबुझेमा',
    ),
    LessonItem(
      primary: '英語を話せますか',
      romaji: 'Eigo o hanasemasu ka',
      meaning: 'तपाईं अंग्रेजी बोल्नुहुन्छ?',
      note: 'भाषा अवरोध हुँदा सहायताको लागि',
    ),
    LessonItem(
      primary: 'トイレはどこですか',
      romaji: 'Toire wa doko desu ka',
      meaning: 'शौचालय कहाँ छ?',
      note: 'अत्यन्त जरुरी व्यावहारिक वाक्य',
    ),
    LessonItem(
      primary: '助けてください',
      romaji: 'Tasukete kudasai',
      meaning: 'कृपया मदत गर्नुहोस्',
      note: 'आपतकालीन अवस्थामा मात्र — गम्भीर टोनमा',
    ),
  ],

  // 3. 日本の作法 (knowledge/etiquette) ------------------------------------
  'manners': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'お辞儀 (Ojigi)',
      meaning: '३ तह: झुकाव (नमस्कार), सामान्य (धन्यवाद), गहिरो (माफी/सम्मान)',
      note: 'नेपालीमा हात जोड्ने जस्तै हो तर झुक्ने कोण फरक हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '玄関で靴を脱ぐ (Genkan)',
      meaning: 'घर, कतिपय रेस्टुरेन्ट, मन्दिरमा प्रवेश गर्दा जुत्ता फुकालिन्छ',
      note: 'यो नबुझ्दा ठूलो असभ्यता ठानिन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'チップの習慣なし',
      meaning: 'जापानमा टिप दिने चलन छैन, दिँदा अप्ठ्यारो पर्न सक्छ',
      note: 'अन्य देशमा भन्दा फरक — याद राख्नुपर्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '電車・バスでは静かに',
      meaning: 'फोनमा ठूलो स्वरमा कुरा नगर्ने, साइलेन्ट मोड राख्ने',
      note: 'सार्वजनिक व्यवहारको आधारभूत नियम',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'お土産 (Omiyage)',
      meaning: 'भेट्न जाँदा सानो उपहार लैजाने सामान्य चलन ',
      note: 'व्यापारिक/सामाजिक सम्बन्धमा उपयोगी',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '列に並ぶ文化',
      meaning: 'जुनसुकै ठाउँमा (स्टेशन, पसल) क्रमबद्ध लाइन लाग्ने',
      note: 'जापानी समाजको आधारभूत मूल्य मान्यता',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '「さん」の使い方 (San)',
      meaning: 'नामको पछाडि "-san" राखी सम्मान देखाउने',
      note: 'Mr./Ms. भन्दा फराकिलो रुपमा प्रयोग हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '両手で渡す習慣',
      meaning: 'पैसा, कार्ड, उपहार दिँदा दुवै हातले दिने ',
      note: 'एक हातले दिनु अशिष्ट ठानिन्छ',
    ),
  ],

  // 4. 食事の基本 -----------------------------------------------------------
  'meal_basics': const [
    LessonItem(
      primary: 'いただきます',
      romaji: 'Itadakimasu',
      meaning: 'खानुअघि भन्ने वाक्य (धन्यवादसहित)',
      note: 'खाना खानु अघि सबैले भन्ने अनिवार्य वाक्य',
    ),
    LessonItem(
      primary: 'ごちそうさまでした',
      romaji: 'Gochisousama deshita',
      meaning: 'खाइसकेपछि धन्यवाद ज्ञापन गर्ने वाक्य',
      note: 'खाना सकेपछि नभनी उठ्नु अशिष्ट ठानिन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '箸の使い方',
      meaning: 'चप्स्टिक भाँडोमा ठाडो नअड्काउने, अरूलाई चप्स्टिकबाट खाना नबाँड्ने',
      note: 'धार्मिक/शुभ अवसरसँग जोडिएको संवेदनशील नियम',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '麺をすする',
      meaning: 'नुडल्स सुरुप्प्याई खानु सामान्य र स्वीकार्य',
      note: 'नेपाली संस्कारमा नराम्रो तर जापानमा ठीक',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '割り勘 (Warikan)',
      meaning: 'साथीहरूसँग खाँदा बिल बराबरी तिर्ने सामान्य चलन  ',
      note: 'कसैले पुरै तिर्ने अपेक्षा नगर्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'お通し (Otoshi)',
      meaning: 'Izakaya (जापानी बार) मा नमगाई नै आउने सानो खाजा र पैसा तिर्न पर्ने पनि हुन सक्छ',
      note: 'नयाँ आगन्तुकलाई अचम्म लाग्ने सामान्य कुरा',
    ),
    LessonItem(
      primary: '苦手な食べ物はありますか',
      romaji: 'Nigate na tabemono wa arimasu ka',
      meaning: 'मन न पर्ने/नखाने खाना छ?',
      note: 'रेस्टुरेन्ट वा घरमा खाना दिनुअघि सोधिने प्रश्न',
    ),
    LessonItem(
      primary: 'ベジタリアンです',
      romaji: 'Bejitarian desu',
      meaning: 'म शाकाहारी हुँ',
    ),
    LessonItem(
      primary: '牛肉は食べません',
      romaji: 'Gyuuniku wa tabemasen',
      meaning: 'म गाईको मासु खाँदिन',
      note: 'हिन्दू धर्मावलम्बीका लागि महत्त्वपूर्ण वाक्य — मेनुमा 牛肉/ビーフ नलेखिएको भए पनि अरु चिजमा हुन सक्ने भएकाले सोध्नु राम्रो',
    ),
    LessonItem(
      primary: '豚肉は食べません',
      romaji: 'Butaniku wa tabemasen',
      meaning: 'म सुँगुरको मासु खाँदिन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'ハラール (Haraaru)',
      meaning: 'हलाल खाना — जापानमा पाउन अलि गाह्रो, हलाल-प्रमाणित रेस्टुरेन्ट/पसल खोज्नुपर्ने',
      note: 'ठूला शहरमा हलाल रेस्टुरेन्ट/स्टोर बढ्दै गएको छ',
    ),
    LessonItem(
      primary: 'お代わりできますか',
      romaji: 'Okawari dekimasu ka',
      meaning: 'थप्न सकिन्छ की ?',
    ),
    LessonItem(
      primary: 'おいしいです',
      romaji: 'Oishii desu',
      meaning: 'मिठो छ',
    ),
  ],

  // 5. 日本料理の名前 --------------------------------------------------------
  'food_names': const [
    LessonItem(primary: '寿司', romaji: 'Sushi', meaning: 'भातको डल्लो माथि काँचो माछा को परिकार  '),
    LessonItem(primary: 'ラーメン', romaji: 'Raamen', meaning: 'सुप सहित को नुडल '),
    LessonItem(primary: 'うどん', romaji: 'Udon', meaning: 'गहुँ को पिठो को मोटो नुडल '),
    LessonItem(primary: 'そば', romaji: 'Soba', meaning: 'पातलो फापरको नुडल'),
    LessonItem(primary: '天ぷら', romaji: 'Tempura', meaning: 'भेजिटेबल  वा माछा को पकोड़ा जस्तो परिकार '),
    LessonItem(primary: '焼き鳥', romaji: 'Yakitori', meaning: 'कुखुरा पोलेको '),
    LessonItem(primary: '味噌汁', romaji: 'Miso shiru', meaning: 'मिसो सुप'),
    LessonItem(primary: 'おにぎり', romaji: 'Onigiri', meaning: 'भात को भित्र माछा आदि राखेको  त्रिकोण आकार को परिकार '),
    LessonItem(primary: 'とんかつ', romaji: 'Tonkatsu', meaning: 'पोर्क (बंन्गुर) को परिकार ु'),
    LessonItem(primary: 'カレーライス', romaji: 'Karee raisu', meaning: 'जापानी करी भात (नेपाली करीभन्दा गुलियो/फिका)'),
    LessonItem(primary: '唐揚げ', romaji: 'Karaage', meaning: 'तारेको कुखुराको मासु (जापानी शैली)'),
    LessonItem(primary: '餃子', romaji: 'Gyouza', meaning: 'मासु/तरकारी भरिएको पिठोको परिकार (मोमो जस्तै)'),
    LessonItem(primary: '親子丼', romaji: 'Oyakodon', meaning: 'कुखुराको मासु र अन्डा भातमाथि राखेको परिकार'),
    LessonItem(primary: 'カツ丼', romaji: 'Katsudon', meaning: 'तारेको कटलेट र अन्डा भातमाथि राखेको परिकार'),
    LessonItem(primary: 'お好み焼き', romaji: 'Okonomiyaki', meaning: 'तरकारी/मासु/शिफ़ुड मिसाएको पिठोको परिकार (जापानी पिज्जा जस्तो)'),
    LessonItem(primary: 'たこ焼き', romaji: 'Takoyaki', meaning: 'अक्टोपस भरिएको सानो बल आकारको खाजा'),
    LessonItem(
      primary: '刺身',
      romaji: 'Sashimi',
      meaning: 'काँचो माछा मात्र (भात बिना)',
      note: 'भात नभएको काँचो माछाको टुक्रा',
    ),
    LessonItem(primary: 'パン', romaji: 'Pan', meaning: 'रोटी / ब्रेड'),
    LessonItem(primary: 'カレーパン', romaji: 'Kareepan', meaning: 'करी भरिएको ब्रेड'),
    LessonItem(
      primary: '抹茶',
      romaji: 'Matcha',
      meaning: 'ग्रिन टि को धुलो — मिठाई, आइसक्रिम, पेयमा पनि प्रयोग हुन्छ',
    ),
  ],

  // 6. レストランで注文 -------------------------------------------------------
  'restaurant_order': const [
    LessonItem(
      primary: 'いらっしゃいませ',
      romaji: 'Irasshaimase',
      meaning: 'स्वागत छ (पसलमा छिर्दा सुनिने शब्द)',
      note: 'स्टाफले भन्ने — जवाफ फर्काउन जरुरी छैन',
    ),
    LessonItem(
      primary: '何名様ですか',
      romaji: 'Nan mei sama desu ka',
      meaning: 'कति जना हुनुहुन्छ?',
    ),
    LessonItem(
      primary: 'メニューをお願いします',
      romaji: 'Menyuu o onegaishimasu',
      meaning: 'मेनू दिनुहोस्',
    ),
    LessonItem(
      primary: 'これをお願いします',
      romaji: 'Kore o onegaishimasu',
      meaning: 'यो चाहियो',
      note: 'देखाएर अर्डर गर्दा प्रयोग गर्ने सजिलो वाक्य',
    ),
    LessonItem(
      primary: 'おすすめは何ですか',
      romaji: 'Osusume wa nan desu ka',
      meaning: 'तपाईंको सुझाव के हो?',
    ),
    LessonItem(
      primary: '辛くしないでください',
      romaji: 'Karaku shinaide kudasai',
      meaning: 'पिरो नबनाउनुहोस्',
    ),
    LessonItem(
      primary: 'お会計お願いします',
      romaji: 'Okaikei onegaishimasu',
      meaning: 'बिल दिनुहोस्',
    ),
    LessonItem(
      primary: 'ごちそうさまでした',
      romaji: 'Gochisousama deshita',
      meaning: 'धन्यवाद, खाना मीठो थियो',
      note: 'रेस्टुराँ बाट बाहिर जाँदा भन्ने',
    ),
  ],

  // 7. 買い物とコンビニ -------------------------------------------------------
  'shopping_convenience': const [
    LessonItem(
      primary: '袋は要りますか',
      romaji: 'Fukuro wa irimasu ka',
      meaning: 'झोला चाहिन्छ?',
      note: 'स्टाफले सोध्ने प्रश्न',
    ),
    LessonItem(
      primary: '袋はいりません',
      romaji: 'Fukuro wa irimasen',
      meaning: 'झोला चाहिँदैन',
    ),
    LessonItem(
      primary: '温めますか',
      romaji: 'Atatamemasu ka',
      meaning: 'तताउन पर्छ ?',
      note: 'स्टाफले  सोध्ने प्रश्न',
    ),
    LessonItem(
      primary: 'お願いします',
      romaji: 'Onegaishimasu',
      meaning: 'हजुर, गर्नुहोस्',
    ),
    LessonItem(
      primary: '支払いは何になさいますか',
      romaji: 'Shiharai wa nani ni nasaimasu ka',
      meaning: 'बिल कसरी तिर्नु हुन्छ?',
    ),
    LessonItem(
      primary: 'カードでお願いします',
      romaji: 'Kaado de onegaishimasu',
      meaning: 'कार्डबाट तिर्छु',
    ),
    LessonItem(
      primary: 'これはいくらですか',
      romaji: 'Kore wa ikura desu ka',
      meaning: 'येस्को कति हो?',
    ),
    LessonItem(
      primary: 'ポイントカードはありますか',
      romaji: 'Pointo kaado wa arimasu ka',
      meaning: 'पोइण्ट कार्ड छ ?',
    ),
  ],

  // 8. 日本の文化 (knowledge) -------------------------------------------------
  'culture': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '温泉 (Onsen)',
      meaning: 'नुहाएर सफा भएपछि मात्र तातोपानीमा बस्ने, पूरै नाङ्गो हुनु सामान्य',
      note: 'तातोपानीमा नुहाउने चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '桜 (Sakura) / Hanami',
      meaning: 'वसन्तमा फूल हेर्दै पिकनिक गर्ने राष्ट्रिय परम्परा',
      note: 'पैयुँ फूल हेर्ने चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '時間厳守',
      meaning: 'जापानमा ढिलो हुनु ठूलो असभ्यता — ५ मिनेट अगाडि नै पुग्ने चलन',
      note: 'समयको पालना',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '神社とお寺',
      meaning: '神社=शिन्तो, お寺=बुद्ध धर्म — दुवैको फरक अनुष्ठान',
      note: 'Shrine र Temple को फरक',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '敬語 (Keigo)',
      meaning: 'उमेर/तह अनुसार प्रयोग गरिने भाषा — नेपालीको "तपाईं/तिमी" भन्दा जटिल',
      note: 'आदरार्थी भाषा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'ゴミの分別',
      meaning: 'फोहोर लाइ जल्ने ,नजल्ने,पुनः प्रयोग हुने गरि छुट्टयाउने ',
      note: 'फोहोर छुट्टयाउने चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '花火大会 (Hanabi taikai)',
      meaning: 'गर्मी याममा हुने ठूलो आतिशबाजी उत्सव, धेरै मानिस युकाता लगाएर हेर्न जान्छन्',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '盆踊り (Bon odori)',
      meaning: 'お盆बेला गाउँ/शहरको चोकमा गरिने परम्परागत सामूहिक नृत्य',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '初詣 (Hatsumoude)',
      meaning: 'नयाँ वर्षको पहिलो शिन्तो/मन्दिर दर्शन, वर्षभरिको शुभकामना माग्ने चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'カラオケ (Karaoke)',
      meaning: 'सानो कोठामा गीत गाउने लोकप्रिय मनोरञ्जन, साथी/सहकर्मीसँग जाने सामान्य चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '本音と建前 (Honne to tatemae)',
      meaning: '本音=वास्तविक भावना, 建前=सामाजिक शिष्टाचारका लागि भनिने कुरा — दुईबीचको भिन्नता बुझ्न जरुरी',
      note: 'सीधै "होइन" नभनी घुमाएर जवाफ दिने जापानी संवाद शैली बुझ्न सहयोगी अवधारणा',
    ),
  ],

  // 9. 生活でよくある場面 (knowledge/situations) --------------------------------
  'daily_life': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'ゴミの日',
      meaning: 'फोहोर फ्याँक्ने बार',
      note: ' गलत दिनमा फ्याँक्नु प्रतिबन्धित छ ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '電車の遅延',
      meaning: '遅延証明書 (ढिलाइ प्रमाणपत्र) अफिसमा देखाउनुपर्ने',
      note: 'ट्रेन ढिलो हुँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '病院に行く',
      meaning: '保険証がありますか (बीमा कार्ड छ?) भन्ने प्रश्न सामान्य',
      note: 'बिरामी हुँदा अस्पताल जाँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '郵便局・宅配便',
      meaning: 'साइन/छाप चाहिने प्रक्रिया',
      note: 'हुलाक/पार्सल पठाउँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '銀行・ATM',
      meaning: 'धेरै ATM रातिमा बन्द वा शुल्क लाग्ने',
      note: 'बैंक/ATM प्रयोग गर्दा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '地震のとき',
      meaning: 'तत्काल के गर्ने भन्ने आधारभूत सुरक्षा ज्ञान',
      note: 'भूकम्प आउँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '携帯電話の契約',
      meaning: 'विदेशीका लागि आवश्यक कागजात',
      note: 'मोबाइल सिम/प्लान लिँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'アパートを借りる',
      meaning: '保証人 (ग्यारेन्टी लिने व्यक्ति) चाहिने जापानी चलन',
      note: 'घर भाडामा लिँदा',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '指定ゴミ袋 (Shitei gomi bukuro)',
      meaning: 'धेरै नगरपालिकामा तोकिएको प्रकारको (प्रायः पैसा तिरेर किन्ने) फोहोर झोला मात्र प्रयोग गर्नुपर्छ',
      note: 'सामान्य प्लास्टिक झोला प्रयोग गरे फोहोर नलैजान सक्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '回覧板 (Kairanban)',
      meaning: 'छिमेकबाट छिमेकमा घुम्ने सूचना पत्र, पढेर छिट्टै अर्को घरमा पुर्याइदिनुपर्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '自治会 (Jichikai)',
      meaning: 'स्थानीय छिमेक संघ, सरसफाइ/उत्सव आयोजना गर्ने र सानो शुल्क लाग्न सक्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'コインランドリー (Koin randorii)',
      meaning: 'सिक्का वा IC कार्ड चलाई लुगा धुने/सुकाउने पसल',
      note: 'ठूला लुगा (सिरक, ज्याकेट) धुनु पर्दा उपयोगी',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '印鑑・ハンコ (Inkan / Hanko)',
      meaning: 'हस्ताक्षर (साइन)को सट्टा प्रयोग हुने व्यक्तिगत छाप, बैंक/सम्झौतामा चाहिन सक्छ',
      note: 'केही ठाउँमा अहिले साइन पनि मान्य भएको छ, तर परम्परागत रूपमा छाप नै मुख्य',
    ),
  ],

  // 10. 交通機関 -----------------------------------------------------------
  'transportation': const [
    LessonItem(
      primary: '切符売り場はどこですか',
      romaji: 'Kippu-uriba wa doko desu ka',
      meaning: 'टिकट काउन्टर कहाँ छ?',
    ),
    LessonItem(
      primary: 'この電車は［　］に行きますか',
      romaji: 'Kono densha wa [___] ni ikimasu ka',
      meaning: 'यो रेल ___ जान्छ?',
      note: 'गन्तव्यको नाम भरेर सोध्ने ढाँचा',
    ),
    LessonItem(
      primary: '乗り換えが必要です',
      romaji: 'Norikae ga hitsuyou desu',
      meaning: 'बदल्नु (ट्रान्सफर) आवश्यक छ',
      note: 'प्लेटफर्म वा लाइन परिवर्तन गर्नुपर्दा प्रयोग हुने वाक्य',
    ),
    LessonItem(
      primary: '何番線ですか',
      romaji: 'Nanban-sen desu ka',
      meaning: 'कति नम्बर प्लेटफर्म हो?',
    ),
    LessonItem(
      primary: '終電は何時ですか',
      romaji: 'Shuuden wa nanji desu ka',
      meaning: 'आखिरी रेल कति बजे हो?',
      note: 'रातिको आखिरी रेल छुटे ट्याक्सी धेरै महँगो पर्छ',
    ),
    LessonItem(
      primary: 'バス停はどこですか',
      romaji: 'Basutei wa doko desu ka',
      meaning: 'बस स्टप कहाँ छ?',
    ),
    LessonItem(
      primary: '運賃はいくらですか',
      romaji: 'Unchin wa ikura desu ka',
      meaning: 'भाडा कति हो?',
    ),
    LessonItem(
      primary: 'タクシーを呼んでください',
      romaji: 'Takushii o yonde kudasai',
      meaning: 'ट्याक्सी बोलाइदिनुहोस्',
    ),
    LessonItem(
      primary: '遅延証明書をください',
      romaji: 'Chien shoumeisho o kudasai',
      meaning: 'ढिलाइ प्रमाणपत्र दिनुहोस्',
      note: 'रेल ढिलो भएमा स्टेशनमा माग्ने र अफिस/स्कुलमा देखाउने कागज',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'Suica・PASMO (ICカード)',
      meaning: 'रिचार्ज गरेर प्रयोग गर्ने IC कार्ड, रेल/बस/कन्भिनिमा पनि प्रयोग हुन्छ',
      note: 'टिकट किन्नुभन्दा सजिलो र छिटो',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '定期券 (Teikiken)',
      meaning: 'नियमित रुटमा दैनिक यात्रा गर्नेका लागि सस्तो महिना/मौसमी पास',
      note: 'काम/स्कुल जाने बाटो निश्चित भएमा किफायती',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '優先席 (Yuusenseki)',
      meaning: 'वृद्ध, अपाङ्ग, गर्भवती, साना बच्चा भएकाका लागि छुट्टै सिट',
      note: 'खाली भए पनि आवश्यक पर्नेलाई छोडिदिने चलन',
    ),
  ],

  // 11. 仕事・職場 -----------------------------------------------------------
  'workplace': const [
    LessonItem(
      primary: 'お先に失礼します',
      romaji: 'Osaki ni shitsurei shimasu',
      meaning: 'म पहिले जान्छु (माफ गर्नुहोस्)',
      note: 'काम सकेर अफिसबाट निस्कँदा भन्ने विनम्र वाक्य',
    ),
    LessonItem(
      primary: 'お疲れ様でした',
      romaji: 'Otsukaresama deshita',
      meaning: 'तपाईंको कडा परिश्रमको लागि धन्यवाद।',
      note: 'सहकर्मीलाई जुनसुकै बेला भन्न सकिने सामान्य अभिवादन',
    ),
    LessonItem(
      primary: '遅刻して申し訳ありません',
      romaji: 'Chikoku shite moushiwake arimasen',
      meaning: 'ढिलो भएकोमा माफी चाहन्छु',
    ),
    LessonItem(
      primary: '休みをいただけますか',
      romaji: 'Yasumi o itadakemasu ka',
      meaning: 'बिदा लिन सक्छु?',
    ),
    LessonItem(
      primary: '体調が悪いので休みます',
      romaji: 'Taichou ga warui node yasumimasu',
      meaning: 'स्वस्थ नराम्रो (बिग्रेको)ले आज बिदा बस्छु',
      note: 'फोनबाट अफिसमा जानकारी दिँदा प्रयोग हुने वाक्य',
    ),
    LessonItem(
      primary: 'もう一度説明してください',
      romaji: 'Mou ichido setsumei shite kudasai',
      meaning: 'फेरि व्याख्या गर्नुहोस्',
    ),
    LessonItem(
      primary: '承知しました',
      romaji: 'Shouchi shimashita',
      meaning: 'बुझें, ठीक छ',
      note: '「わかりました」भन्दा औपचारिक स्वीकृति',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '報・連・相 (Hourensou)',
      meaning: '報告(जानकारी)・連絡(सम्पर्क)・相談(सल्लाह) — जापानी कार्यसंस्कृतिको आधारभूत नियम',
      note: 'समस्या आउनुअघि नै माथिल्लो व्यक्तिलाई भन्ने बानी',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '名刺交換 (Meishi koukan)',
      meaning: 'व्यापारिक कार्ड दुवै हातले साट्ने र तुरुन्तै नराख्ने चलन',
      note: 'पहिलो भेटमा हुने औपचारिक प्रक्रिया',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'タイムカード',
      meaning: 'आगमन/प्रस्थान समय रेकर्ड गर्ने मेसिन वा एप',
      note: 'तलब गणनाको आधार हुने भएकाले सही समयमा पंच गर्नुपर्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '有給休暇 (Yuukyuu kyuuka)',
      meaning: 'तलबसहितको बिदाको कानुनी अधिकार',
      note: 'काम सुरु गरेको ६ महिनापछि पाइने, कर्मचारीले माग्न हिचकिचाउनु पर्दैन',
    ),
  ],

  // 12. アルバイト面接・履歴書 --------------------------------------------------
  'job_interview': const [
    LessonItem(
      primary: '志望動機は何ですか',
      romaji: 'Shibou douki wa nan desu ka',
      meaning: 'आवेदन गर्नुको कारण के हो?',
      note: 'प्रायः सोधिने पहिलो प्रश्न',
    ),
    LessonItem(
      primary: 'いつから働けますか',
      romaji: 'Itsu kara hatarakemasu ka',
      meaning: 'कहिलेदेखि काम गर्न सक्नुहुन्छ?',
    ),
    LessonItem(
      primary: '週に何日働けますか',
      romaji: 'Shuu ni nan-nichi hatarakemasu ka',
      meaning: 'हप्तामा कति दिन काम गर्न सक्नुहुन्छ?',
    ),
    LessonItem(
      primary: '経験はありますか',
      romaji: 'Keiken wa arimasu ka',
      meaning: 'यस क्षेत्रमा अनुभव छ?',
    ),
    LessonItem(
      primary: '自己PRをお願いします',
      romaji: 'Jiko PR o onegaishimasu',
      meaning: 'आफ्नो बारेमा (राम्रो पक्ष) बताउनुहोस्',
    ),
    LessonItem(
      primary: '時給はいくらですか',
      romaji: 'Jikyuu wa ikura desu ka',
      meaning: 'प्रति घण्टा तलब कति हो?',
    ),
    LessonItem(
      primary: '交通費は支給されますか',
      romaji: 'Koutsuuhi wa shikyuu saremasu ka',
      meaning: 'यातायात खर्च छुट्टै दिइन्छ?',
    ),
    LessonItem(
      primary: 'よろしくお願いいたします',
      romaji: 'Yoroshiku onegai itashimasu',
      meaning: 'धेरै धेरै धन्यवाद।',
      note: '面接の最後に言う、より丁寧な締めの一言',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '履歴書 (Rirekisho)',
      meaning: 'जापानी शैलीको निर्धारित ढाँचाको बायोडाटा, प्रायः फोटो टाँस्नुपर्ने',
      note: 'हस्तलिखित वा टाइप गरेको हुन सक्छ, कन्भिनि/स्टेशनरी पसलमा फारम पाइन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'シフト希望',
      meaning: 'काम गर्न चाहेको समय/दिन (शिफ्ट) अगावै बताउने प्रणाली',
      note: 'प्रायः महिनाको सुरुमा वा अन्त्यमा अर्को महिनाको शिफ्ट सबमिट गर्नुपर्छ',
    ),
  ],

  // 13. 役所・在留手続き -------------------------------------------------------
  'city_office': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '在留カード (Zairyuu kaado)',
      meaning: 'विदेशीको आधिकारिक परिचयपत्र, जापानमा सधैं साथमा राख्नुपर्ने कानुनी दायित्व',
      note: 'नबोकेमा जरिवाना हुन सक्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '住民票 (Juuminhyou)',
      meaning: 'बसोबास प्रमाणपत्र, बैंक/मोबाइल/भाडा प्रक्रियामा प्रायः चाहिने कागज',
      note: 'सिटी अफिसबाट सानो शुल्कमा लिन सकिन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'マイナンバー (My Number)',
      meaning: '१२ अंकको व्यक्तिगत पहिचान नम्बर, कर/सामाजिक सुरक्षा/रोजगारमा प्रयोग हुन्छ',
      note: 'कामदार भएपछि कम्पनीलाई दिनुपर्ने महत्त्वपूर्ण नम्बर',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '転入届・転出届',
      meaning: 'बसाई सर्दा नयाँ ठाउँमा १४ दिनभित्र दर्ता गर्नुपर्ने कानुनी प्रक्रिया',
      note: 'नगरपालिका/सिटी अफिसमा गरिने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '国民健康保険 (Kokumin kenkou hoken)',
      meaning: 'कम्पनीको बीमा नभएकाका लागि राष्ट्रिय स्वास्थ्य बीमा दर्ता',
      note: 'अस्पताल खर्चको ठूलो हिस्सा यसले बेहोर्छ',
    ),
    LessonItem(
      primary: 'どこで手続きできますか',
      romaji: 'Doko de tetsuzuki dekimasu ka',
      meaning: 'यो प्रक्रिया कहाँ गर्न सकिन्छ?',
    ),
    LessonItem(
      primary: '必要な書類は何ですか',
      romaji: 'Hitsuyouna shorui wa nan desu ka',
      meaning: 'कुन कुन कागजात आवश्यक छ?',
    ),
    LessonItem(
      primary: '番号札を取ってください',
      romaji: 'Bangoufuda o totte kudasai',
      meaning: 'नम्बर टिकट लिनुहोस्',
      note: 'धेरै सरकारी अफिसमा लाइनको सट्टा नम्बर बोलाउने प्रणाली हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '在留期間の更新 (Zairyuu kikan no koushin)',
      meaning: 'भिसाको म्याद नसकिँदै नवीकरण गर्नुपर्ने प्रक्रिया',
      note: 'म्याद सकिनु ३ महिना अगाडिदेखि आवेदन दिन सकिन्छ, ढिलो भए ठूलो समस्या',
    ),
  ],

  // 14. 病院・体調不良 ---------------------------------------------------------
  'health': const [
    LessonItem(
      primary: '頭が痛いです',
      romaji: 'Atama ga itai desu',
      meaning: 'टाउको दुख्यो',
    ),
    LessonItem(
      primary: 'お腹が痛いです',
      romaji: 'Onaka ga itai desu',
      meaning: 'पेट दुख्यो',
    ),
    LessonItem(
      primary: '熱があります',
      romaji: 'Netsu ga arimasu',
      meaning: 'ज्वरो आएको छ',
    ),
    LessonItem(
      primary: '気分が悪いです',
      romaji: 'Kibun ga warui desu',
      meaning: 'अस्वस्थ महसुस भइरहेको छ',
    ),
    LessonItem(
      primary: '薬をください',
      romaji: 'Kusuri o kudasai',
      meaning: 'औषधि दिनुहोस्',
    ),
    LessonItem(
      primary: '保険証を持っていますか',
      romaji: 'Hokenshou wa motte imasu ka',
      meaning: 'बीमा कार्ड ल्याउनुभएको छ?',
      note: 'अस्पतालको काउन्टरमा सोधिने प्रश्न',
    ),
    LessonItem(
      primary: '病院の予約をしたいです',
      romaji: 'Byouin no yoyaku o shitai desu',
      meaning: 'अस्पतालमा एपोइन्टमेन्ट लिन चाहन्छु',
    ),
    LessonItem(
      primary: '救急車を呼んでください',
      romaji: 'Kyuukyuusha o yonde kudasai',
      meaning: 'एम्बुलेन्स बोलाउनुहोस्',
      note: 'आपतकालीन अवस्थामा मात्र — 119 मा फोन गर्दा पनि प्रयोग हुन्छ',
    ),
    LessonItem(
      primary: 'アレルギーがあります',
      romaji: 'Arerugii ga arimasu',
      meaning: 'मलाई एलर्जी छ',
      note: 'खाना वा औषधि लिनुअघि जानकारी दिन महत्त्वपूर्ण',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '薬局 (Yakkyoku)',
      meaning: 'फार्मेसी — केही औषधिलाई डाक्टरको प्रेस्क्रिप्सन चाहिन्छ, केही सीधै किन्न सकिन्छ',
      note: '処方箋(प्रेस्क्रिप्सन) र 市販薬(ओभर-द-काउन्टर) फरक हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '母子手帳 (Boshi techou)',
      meaning: 'गर्भवती महिला र बच्चाको स्वास्थ्य रेकर्ड राख्ने आधिकारिक पुस्तिका',
      note: 'गर्भावस्था दर्ता गर्दा सिटी अफिसबाट पाइन्छ, खोप/जाँचमा सधैं लैजानुपर्ने',
    ),
  ],

  // 15. 給与・税金・保険 ---------------------------------------------------------
  'salary_tax': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '給料明細 (Kyuuryou meisai)',
      meaning: 'तलब विवरण पर्चा — कति कट्टा भयो भन्ने कुरा बुझ्न महत्त्वपूर्ण',
      note: 'हरेक महिना कम्पनीले दिने कागज, नफ्याल्नु',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '所得税 (Shotokuzei)',
      meaning: 'आम्दानीमा लाग्ने राष्ट्रिय कर, तलबबाटै स्वतः कट्टा हुन्छ',
      note: '源泉徴収 (gensen choushuu) भनिने प्रणालीबाट कट्टा हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '住民税 (Juuminzei)',
      meaning: 'बसोबास गरेको स्थानीय सरकारलाई तिर्ने कर',
      note: 'जापान आएको पहिलो वर्ष लाग्दैन, दोस्रो वर्षदेखि कट्टा सुरु हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '厚生年金 (Kousei nenkin)',
      meaning: 'कम्पनीमार्फत तिरिने पेन्सन (अवकाश कोष)',
      note: 'तलबबाट स्वतः कट्टा हुने, कम्पनीले पनि बराबर रकम थप्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '雇用保険 (Koyou hoken)',
      meaning: 'रोजगार बीमा — जागिर गुम्दा केही रकम पाउन सकिने बीमा',
      note: 'नियमित कामदारका लागि अनिवार्य कट्टी',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '年末調整 (Nenmatsu chousei)',
      meaning: 'वर्षको अन्त्यमा कम्पनीले कर हिसाब मिलाउने प्रक्रिया',
      note: 'धेरै तिरेको कर भए फिर्ता आउन सक्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '確定申告 (Kakutei shinkoku)',
      meaning: 'आफैंले वार्षिक आम्दानी विवरण कर कार्यालयमा पेस गर्ने प्रक्रिया',
      note: 'साइड इनकम वा कम्पनी परिवर्तन गरेकाहरूले गर्नुपर्ने हुन सक्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '脱退一時金 (Dattai ichijikin)',
      meaning: 'जापान स्थायी रूपमा छोडेपछि तिरेको पेन्सन केही रकम फिर्ता माग्ने प्रणाली',
      note: 'धेरै विदेशी कामदारलाई थाहै नहुने महत्त्वपूर्ण अधिकार — फर्किएको २ वर्षभित्र आवेदन दिनुपर्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '銀行振込 (Ginkou furikomi)',
      meaning: 'तलब सामान्यतया नगदमा नभई बैंक खातामा सिधै जान्छ',
      note: 'काम सुरु गर्नुअघि बैंक खाता खोल्नु आवश्यक',
    ),
  ],

  // 16. 数字・お金の数え方 ------------------------------------------------------
  'numbers_money': const [
    LessonItem(primary: '一 (いち)', romaji: 'Ichi', meaning: '१ (एक)'),
    LessonItem(primary: '十 (じゅう)', romaji: 'Juu', meaning: '१० (दस)'),
    LessonItem(primary: '百 (ひゃく)', romaji: 'Hyaku', meaning: '१०० (सय)'),
    LessonItem(primary: '千 (せん)', romaji: 'Sen', meaning: '१,००० (हजार)'),
    LessonItem(
      primary: '一万 (いちまん)',
      romaji: 'Ichiman',
      meaning: '१०,००० (दस हजार)',
      note: 'जापानी संख्या पद्धति १०,०००बाट नयाँ एकाइ (万) थाल्छ — नेपाली "लाख" भन्दा फरक ठाउँमा एकाइ बदलिन्छ',
    ),
    LessonItem(
      primary: 'いくらですか',
      romaji: 'Ikura desu ka',
      meaning: 'कति हो? (मूल्य सोध्दा)',
    ),
    LessonItem(
      primary: '○○円です',
      romaji: '○○ en desu',
      meaning: '○○ येन हो',
    ),
    LessonItem(
      primary: 'お釣り',
      romaji: 'Otsuri',
      meaning: 'फिर्ता पैसा (चेन्ज)',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '割引 (Waribiki)',
      meaning: 'छुट — प्रायः साँझपछि सुपरमार्केटको खानामा ठूलो छुट पाइन्छ',
      note: 'किन्नुअघि हेर्ने राम्रो बानी',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '税込み・税抜き (Zeikomi / Zeinuki)',
      meaning: 'कर सहितको मूल्य / कर बिनाको मूल्य — मूल्य ट्यागमा दुवै देखिन सक्छ',
      note: 'रसिदमा देखिने मूल्य फरक हुन सक्ने भएकाले ध्यान दिनु राम्रो',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'クレジットカード / 現金',
      meaning: 'क्रेडिट कार्ड / नगद — साना पसलमा अझै नगद मात्र चल्न सक्छ',
      note: 'भुक्तानी तरिका पहिले नै सोध्नु राम्रो',
    ),
  ],

  // 17. 時間・曜日・日付 --------------------------------------------------------
  'time_date': const [
    LessonItem(
      primary: '今何時ですか',
      romaji: 'Ima nanji desu ka',
      meaning: 'अहिले कति बज्यो ?',
    ),
    LessonItem(
      primary: '何時に会いましょうか',
      romaji: 'Nanji ni aimashou ka',
      meaning: 'कति बजे भेटौं?',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '月・火・水・木・金・土・日',
      meaning: 'सोम, मंगल, बुध, बिहि, शुक्र, शनि, आइत — हप्ताका सातै दिन',
      note: 'क्यालेन्डर/शिफ्ट तालिका बुझ्न आधारभूत',
    ),
    LessonItem(
      primary: '今日は何曜日ですか',
      romaji: 'Kyou wa nan youbi desu ka',
      meaning: 'आज कुन बार हो?',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '今週・来週・先週',
      meaning: 'यो हप्ता / अर्को हप्ता / गएको हप्ता',
      note: 'काम/अपोइन्टमेन्ट तय गर्दा धेरै प्रयोग हुने शब्द',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '○月○日',
      meaning: 'महिना-दिन भन्ने ढाँचा',
      note: 'जापानीमा वर्ष→महिना→दिनको क्रममा लेखिन्छ (नेपाली क्रमभन्दा फरक)',
    ),
    LessonItem(
      primary: '遅れます',
      romaji: 'Okuremasu',
      meaning: 'म ढिलो हुन्छु',
      note: 'भेटघाट/कामको समयमा ढिलो हुँदा फोन/मेसेजबाट जानकारी दिने वाक्य',
    ),
    LessonItem(
      primary: '予定を変更したいです',
      romaji: 'Yotei o henkou shitai desu',
      meaning: 'समय परिवर्तन गर्न चाहन्छु',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '午前・午後 (Gozen / Gogo)',
      meaning: 'बिहान (AM) / बेलुका (PM)',
      note: 'जापानमा प्रायः २४ घण्टा ढाँचा (例: 15時) पनि सामान्य रूपमा प्रयोग हुन्छ',
    ),
  ],

  // 18. 道案内・場所を尋ねる ------------------------------------------------------
  'directions': const [
    LessonItem(
      primary: '［　］はどこですか',
      romaji: '[___] wa doko desu ka',
      meaning: '___ कहाँ छ?',
      note: 'ठाउँको नाम भरेर सोध्ने आधारभूत ढाँचा',
    ),
    LessonItem(
      primary: 'まっすぐ行ってください',
      romaji: 'Massugu itte kudasai',
      meaning: 'सीधा जानुहोस्',
    ),
    LessonItem(
      primary: '右に曲がってください',
      romaji: 'Migi ni magatte kudasai',
      meaning: 'दायाँ मोड्नुहोस्',
    ),
    LessonItem(
      primary: '左に曲がってください',
      romaji: 'Hidari ni magatte kudasai',
      meaning: 'बायाँ मोड्नुहोस्',
    ),
    LessonItem(
      primary: 'ここから遠いですか',
      romaji: 'Koko kara tooi desu ka',
      meaning: 'यहाँबाट टाढा छ?',
    ),
    LessonItem(
      primary: '歩いて何分ですか',
      romaji: 'Aruite nanpun desu ka',
      meaning: 'हिँडेर कति मिनेट लाग्छ?',
    ),
    LessonItem(
      primary: '地図を書いてもらえますか',
      romaji: 'Chizu o kaite moraemasu ka',
      meaning: 'नक्सा बनाइदिन सक्नुहुन्छ?',
    ),
    LessonItem(
      primary: 'この住所はどこですか',
      romaji: 'Kono juusho wa doko desu ka',
      meaning: 'यो ठेगाना कहाँ हो?',
      note: 'ट्याक्सी वा कसैलाई देखाएर सोध्दा उपयोगी',
    ),
  ],

  // 19. 電話・メールの基本 -------------------------------------------------------
  'phone_email': const [
    LessonItem(
      primary: 'もしもし',
      romaji: 'Moshi moshi',
      meaning: 'हेलो (फोनमा मात्र प्रयोग हुने)',
    ),
    LessonItem(
      primary: '［会社名］の［名前］です',
      romaji: '[Company] no [Name] desu',
      meaning: '[कम्पनी]को [नाम] बोल्दैछु',
      note: 'फोन उठाउँदा/गर्दा आफ्नो परिचय दिने ढाँचा',
    ),
    LessonItem(
      primary: '少々お待ちください',
      romaji: 'Shoushou omachi kudasai',
      meaning: 'एकछिन  पर्खनुहोस्',
    ),
    LessonItem(
      primary: '折り返しお電話します',
      romaji: 'Orikaeshi odenwa shimasu',
      meaning: 'म पछि फोन गर्छु',
      note: 'अहिले जवाफ दिन नसक्दा प्रयोग गरिने विनम्र वाक्य',
    ),
    LessonItem(
      primary: 'メールアドレスを教えてください',
      romaji: 'Meeru adoresu o oshiete kudasai',
      meaning: 'इमेल ठेगाना बताउनुहोस्',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '添付ファイル (Tenpu fairu)',
      meaning: 'संलग्न फाइल — इमेलमा कागजात/फोटो जोड्दा प्रयोग हुने शब्द',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '件名 (Kenmei)',
      meaning: 'इमेलको विषय (Subject) — खाली नराख्नु राम्रो, छोटो र स्पष्ट लेख्ने चलन',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '敬具 (Keigu)',
      meaning: 'औपचारिक इमेल/चिठ्ठीको अन्त्यमा लेखिने विनम्र समापन शब्द',
      note: 'व्यापारिक इमेलमा प्रयोग हुने, साथीलाई पठाउँदा चाहिँदैन',
    ),
  ],

  // 20. 天気・季節のあいさつ ------------------------------------------------------
  'weather_seasons': const [
    LessonItem(
      primary: '今日はいい天気ですね',
      romaji: 'Kyou wa ii tenki desu ne',
      meaning: 'आज राम्रो मौसम छ नि',
      note: 'जापानीहरूले चिनजान नभएकासँग पनि मौसमको कुरा गरेर वार्तालाप सुरु गर्छन्',
    ),
    LessonItem(
      primary: '雨が降っています',
      romaji: 'Ame ga futte imasu',
      meaning: 'पानी परिरहेको छ',
    ),
    LessonItem(
      primary: '暑いです',
      romaji: 'Atsui desu',
      meaning: 'गर्मी छ',
    ),
    LessonItem(
      primary: '寒いです',
      romaji: 'Samui desu',
      meaning: 'जाडो छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '台風 (Taifuu)',
      meaning: 'टाइफुन — गर्मी/शरद ऋतुमा आउने ठूलो आँधी-हुरी, ट्रेन/स्कुल/काम बन्द हुन सक्छ',
      note: 'पूर्वानुमान हेरेर पहिल्यै तयारी गर्नु राम्रो',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '梅雨 (Tsuyu)',
      meaning: 'जुन-जुलाईतिर हुने लामो वर्षायाम, लगातार पानी पर्छ',
      note: 'छाता सधैं साथमा राख्नुपर्ने महिना',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'お正月 (Oshougatsu)',
      meaning: 'जापानी नयाँ वर्ष (जनवरी १-३), धेरै पसल/अफिस बन्द हुन्छन्',
      note: 'वर्षको सबैभन्दा ठूलो पारिवारिक पर्व',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'お盆 (Obon)',
      meaning: 'अगस्ट महिनातिर हुने पितृ सम्झना पर्व, धेरैले आफ्नो गाउँ फर्कन्छन्',
      note: 'यात्रा/ट्रेन धेरै भीडभाड हुने समय',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '年末年始 (Nenmatsu nenshi)',
      meaning: 'वर्षको अन्त्य र सुरुको बिदा अवधि (प्रायः १२/२९–१/३)',
      note: 'यस बेला धेरै कम्पनी, बैंक, र सरकारी अफिस बन्द हुन्छन्',
    ),
  ],

  // 21. 美容院・買い物(衣類) ------------------------------------------------------
  'beauty_clothes': const [
    LessonItem(
      primary: '髪を切ってください',
      romaji: 'Kami o kitte kudasai',
      meaning: 'कपाल काट्नुहोस्',
    ),
    LessonItem(
      primary: '少しだけ切ってください',
      romaji: 'Sukoshi dake kitte kudasai',
      meaning: 'अलिकति मात्र काट्नुहोस्',
    ),
    LessonItem(
      primary: 'シャンプーをお願いします',
      romaji: 'Shanpuu o onegaishimasu',
      meaning: 'कपाल धुनुहोस् (शैम्पू गर्नुहोस्)',
    ),
    LessonItem(
      primary: '試着してもいいですか',
      romaji: 'Shichaku shite mo ii desu ka',
      meaning: 'लगाएर हेर्न सक्छु?',
      note: 'लुगा पसलमा लगाएर मिलेको हेर्दा सोध्ने वाक्य',
    ),
    LessonItem(
      primary: 'サイズは何ですか',
      romaji: 'Saizu wa nan desu ka',
      meaning: 'साइज के हो?',
    ),
    LessonItem(
      primary: 'もっと大きいサイズはありますか',
      romaji: 'Motto ookii saizu wa arimasu ka',
      meaning: 'अझ ठूलो साइज छैन ?',
    ),
    LessonItem(
      primary: '色違いはありますか',
      romaji: 'Iro chigai wa arimasu ka',
      meaning: 'अर्को रङ छ?',
    ),
    LessonItem(
      primary: 'これにします',
      romaji: 'Kore ni shimasu',
      meaning: 'यो लिन्छु',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '美容院・理髪店 (Biyouin / Rihatsuten)',
      meaning: '美容院=प्रायः महिलाका लागि, 理髪店=प्रायः पुरुषका लागि — मूल्य र सेवा फरक हुन्छ',
      note: 'धेरै ठाउँमा पहिल्यै फोन/नेटबाट एपोइन्टमेन्ट लिनुपर्छ',
    ),
  ],

  // 22. 引っ越し・部屋探し -------------------------------------------------------
  'moving': const [
    LessonItem(
      primary: '部屋を探しています',
      romaji: 'Heya o sagashite imasu',
      meaning: 'कोठा खोजिरहेको छु',
    ),
    LessonItem(
      primary: '家賃はいくらですか',
      romaji: 'Yachin wa ikura desu ka',
      meaning: 'भाडा कति हो?',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '敷金・礼金 (Shikikin / Reikin)',
      meaning: '敷金(सिकिकिन )=फिर्ता हुने जमानती रकम, 礼金(रेइकिन )=फिर्ता नहुने धन्यवाद-रकम',
      note: 'सुरुमा भाडाको ४-६ महिना बराबर एकमुष्ट रकम चाहिन सक्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '保証人・保証会社 (Hoshounin / Hoshou gaisha)',
      meaning: 'ग्यारेन्टी दिने व्यक्ति वा ग्यारेन्टी कम्पनी — विदेशीका लागि प्रायः अनिवार्य',
      note: 'नभेटे कम्पनी प्रयोग गर्दा छुट्टै शुल्क लाग्छ',
    ),
    LessonItem(
      primary: '契約書にサインしてください',
      romaji: 'Keiyakusho ni sain shite kudasai',
      meaning: 'सम्झौता पत्रमा साइन गर्नुहोस्',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '電気・ガス・水道の契約',
      meaning: 'बिजुली, ग्यास, पानी छुट्टाछुट्टै कम्पनीसँग आफैं साइन अप गर्नुपर्छ',
      note: 'भाडामा सामेल नहुने खर्च, बसाइ सराइ को बेला मा मिलाउनुपर्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '引っ越し業者 (Hikkoshi gyousha)',
      meaning: 'बसाइ सराइ को ढुवानी कम्पनी, अगावै बुक गर्नुपर्ने र भारी/दूरी अनुसार मूल्य फरक हुने',
    ),
    LessonItem(
      primary: 'いつ入居できますか',
      romaji: 'Itsu nyuukyo dekimasu ka',
      meaning: 'कहिलेदेखि बस्न सकिन्छ?',
    ),
  ],

  // 23. 災害・緊急時対応 --------------------------------------------------------
  'disaster': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '緊急地震速報 (Kinkyuu jishin sokuhou)',
      meaning: 'ठूलो भूकम्प आउनुअघि फोन/टिभीमा आउने चेतावनी अलर्ट',
      note: 'ठूलो आवाज सुनेमा तुरुन्तै टेबलमुनि लुक्ने वा टाउको जोगाउने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '避難所 (Hinanjo)',
      meaning: 'विपद्को बेला जाने सुरक्षित आश्रयस्थल, प्रायः स्थानीय स्कुल हुन्छ',
      note: 'आफ्नो नजिकको避難所(हिनान् ज्यो ) पहिल्यै थाहा पाइराख्नु राम्रो',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: 'ハザードマップ (Hazaado mappu)',
      meaning: 'आफ्नो क्षेत्रको बाढी/भूकम्प जोखिम देखाउने नक्सा',
      note: 'सिटी अफिस वा नगरपालिकाको वेबसाइटबाट हेर्न सकिन्छ',
    ),
    LessonItem(
      primary: '火事です！',
      romaji: 'Kaji desu!',
      meaning: 'आगो लाग्यो!',
      note: 'वरपरका मानिसलाई सचेत गराउन ठूलो स्वरमा भन्ने',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '119番',
      meaning: 'एम्बुलेन्स र दमकल बोलाउने आपतकालीन नम्बर',
      note: 'ठेगाना र के भएको हो भनेर स्पष्ट बताउनुपर्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '110番',
      meaning: 'प्रहरी बोलाउने आपतकालीन नम्बर',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '非常持ち出し袋 (Hijou mochidashi bukuro)',
      meaning: 'भूकम्प/विपद्को बेला तुरुन्तै लैजान तयार राखिने आपतकालीन झोला (पानी, टर्च, औषधि आदि)',
      note: 'घरमा सजिलै भेटिने ठाउँमा राख्नु राम्रो',
    ),
  ],

  // 24. 学校・勉強 -------------------------------------------------------------
  'school': const [
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '日本語学校 (Nihongo gakkou)',
      meaning: 'विदेशीलाई जापानी भाषा सिकाउने विद्यालय',
    ),
    LessonItem(
      primary: '宿題があります',
      romaji: 'Shukudai ga arimasu',
      meaning: 'गृहकार्य छ',
    ),
    LessonItem(
      primary: 'わからないところを教えてください',
      romaji: 'Wakaranai tokoro o oshiete kudasai',
      meaning: 'नबुझेको ठाउँ सिकाइदिनुहोस्',
    ),
    LessonItem(
      primary: 'テストはいつですか',
      romaji: 'Tesuto wa itsu desu ka',
      meaning: 'परीक्षा कहिले हो?',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '出席・欠席 (Shusseki / Kesseki)',
      meaning: 'उपस्थिति / अनुपस्थिति — भिसा नवीकरणमा पनि असर पर्न सक्ने महत्त्वपूर्ण रेकर्ड',
      note: 'धेरै पटक अनुपस्थित हुनु गम्भीर समस्या मानिन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '奨学金 (Shougakukin)',
      meaning: 'छात्रवृत्ति — केही फिर्ता तिर्नुपर्ने र केही फिर्ता नतिर्ने प्रकार हुन्छ',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '専門学校 (Senmon gakkou)',
      meaning: 'व्यावसायिक/प्राविधिक सीप सिकाउने कलेज (नर्सिङ, आईटी, कुकिङ आदि)',
    ),
    LessonItem(
      kind: ContentKind.knowledge,
      primary: '卒業 (Sotsugyou)',
      meaning: 'स्नातक/पास आउट हुने कार्यक्रम',
    ),
  ],

  // 25. 趣味・雑談 -------------------------------------------------------------
  'small_talk': const [
    LessonItem(
      primary: '趣味は何ですか',
      romaji: 'Shumi wa nan desu ka',
      meaning: 'तपाईंको शौख के हो?',
    ),
    LessonItem(
      primary: '休みの日は何をしますか',
      romaji: 'Yasumi no hi wa nani o shimasu ka',
      meaning: 'बिदाको दिन के गर्नुहुन्छ?',
    ),
    LessonItem(
      primary: '日本はどうですか',
      romaji: 'Nihon wa dou desu ka',
      meaning: 'जापान कस्तो लाग्यो?',
    ),
    LessonItem(
      primary: 'ネパールはどんな国ですか',
      romaji: 'Nepal wa donna kuni desu ka',
      meaning: 'नेपाल कस्तो देश हो?',
      note: 'जापानी सहकर्मीले सोध्न सक्ने प्रश्न — आफ्नो देश चिनाउने राम्रो मौका',
    ),
    LessonItem(
      primary: '好きな食べ物は何ですか',
      romaji: 'Suki na tabemono wa nan desu ka',
      meaning: 'मन पर्ने खाना के हो?',
    ),
    LessonItem(
      primary: 'いいですね',
      romaji: 'Ii desu ne',
      meaning: 'राम्रो छ नि',
      note: 'सहमति/रुचि देखाउँदा प्रयोग हुने सामान्य प्रतिक्रिया',
    ),
    LessonItem(
      primary: 'そうですか',
      romaji: 'Sou desu ka',
      meaning: 'हो र ? , त्यस्तो हो',
      note: 'कुरा सुनिरहेको संकेत दिने महत्त्वपूर्ण प्रतिक्रिया शब्द (相槌)',
    ),
    LessonItem(
      primary: 'がんばってください',
      romaji: 'Ganbatte kudasai',
      meaning: 'जाँगर(कोशिस ) गर्नुहोस् / शुभकामना',
      note: 'जापानीहरूले धेरै बेला प्रोत्साहनको रूपमा प्रयोग गर्ने वाक्य',
    ),
  ],

  // 26. JLPT N5 語彙 (trial batch — vocabulary, more to follow) ----------------
  'jlpt_n5_vocab': const [
    // 名詞 (संज्ञा / nouns)
    LessonItem(primary: '学校 (がっこう)', romaji: 'Gakkou', meaning: 'विद्यालय', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '先生 (せんせい)', romaji: 'Sensei', meaning: 'शिक्षक/शिक्षिका', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '学生 (がくせい)', romaji: 'Gakusei', meaning: 'विद्यार्थी', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '友達 (ともだち)', romaji: 'Tomodachi', meaning: 'साथी', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '家族 (かぞく)', romaji: 'Kazoku', meaning: 'परिवार', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '部屋 (へや)', romaji: 'Heya', meaning: 'कोठा', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '本 (ほん)', romaji: 'Hon', meaning: 'किताब', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '天気 (てんき)', romaji: 'Tenki', meaning: 'मौसम', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '音楽 (おんがく)', romaji: 'Ongaku', meaning: 'संगीत', note: '名詞 (संज्ञा)'),
    LessonItem(primary: '映画 (えいが)', romaji: 'Eiga', meaning: 'चलचित्र (फिल्म)', note: '名詞 (संज्ञा)'),

    // 動詞 (क्रिया / verbs, dictionary form — ます形 in note)
    LessonItem(
      primary: '食べる (たべる)',
      romaji: 'Taberu',
      meaning: 'खानु',
      note: '動詞 (क्रिया)・グループ2(る-verb) / ます形: 食べます',
    ),
    LessonItem(
      primary: '飲む (のむ)',
      romaji: 'Nomu',
      meaning: 'पिउनु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 飲みます',
    ),
    LessonItem(
      primary: '行く (いく)',
      romaji: 'Iku',
      meaning: 'जानु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 行きます',
    ),
    LessonItem(
      primary: '来る (くる)',
      romaji: 'Kuru',
      meaning: 'आउनु',
      note: '動詞 (क्रिया)・グループ3(不規則) / ます形: 来ます',
    ),
    LessonItem(
      primary: '見る (みる)',
      romaji: 'Miru',
      meaning: 'हेर्नु',
      note: '動詞 (क्रिया)・グループ2(る-verb) / ます形: 見ます',
    ),
    LessonItem(
      primary: '聞く (きく)',
      romaji: 'Kiku',
      meaning: 'सुन्नु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 聞きます',
    ),
    LessonItem(
      primary: '話す (はなす)',
      romaji: 'Hanasu',
      meaning: 'बोल्नु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 話します',
    ),
    LessonItem(
      primary: '読む (よむ)',
      romaji: 'Yomu',
      meaning: 'पढ्नु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 読みます',
    ),
    LessonItem(
      primary: '書く (かく)',
      romaji: 'Kaku',
      meaning: 'लेख्नु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 書きます',
    ),
    LessonItem(
      primary: '買う (かう)',
      romaji: 'Kau',
      meaning: 'किन्नु',
      note: '動詞 (क्रिया)・グループ1(う-verb) / ます形: 買います',
    ),

    // 形容詞 (विशेषण / adjectives)
    LessonItem(primary: '大きい (おおきい)', romaji: 'Ookii', meaning: 'ठूलो', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '小さい (ちいさい)', romaji: 'Chiisai', meaning: 'सानो', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '新しい (あたらしい)', romaji: 'Atarashii', meaning: 'नयाँ', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '古い (ふるい)', romaji: 'Furui', meaning: 'पुरानो', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '忙しい (いそがしい)', romaji: 'Isogashii', meaning: 'व्यस्त', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '難しい (むずかしい)', romaji: 'Muzukashii', meaning: 'गाह्रो', note: 'い形容詞 (विशेषण)'),
    LessonItem(primary: '簡単 (かんたん)', romaji: 'Kantan', meaning: 'सजिलो', note: 'な形容詞 (विशेषण)'),

    // 副詞 (क्रियाविशेषण / adverbs)
    LessonItem(primary: '少し', romaji: 'Sukoshi', meaning: 'अलिकति', note: '副詞 (क्रियाविशेषण)'),
    LessonItem(primary: '全部', romaji: 'Zenbu', meaning: 'सबै/जम्मै', note: '副詞・名詞 (क्रियाविशेषण/संज्ञा)'),
    LessonItem(primary: 'とても', romaji: 'Totemo', meaning: 'धेरै', note: '副詞 (क्रियाविशेषण)'),
  ],
};

/// Whether a category's content is knowledge-based (etiquette/culture)
/// rather than phrase-based (flashcard-style).
bool isKnowledgeCategory(String categoryId) {
  final items = lessonItemsByCategory[categoryId];
  if (items == null || items.isEmpty) return false;
  return items.first.kind == ContentKind.knowledge;
}
