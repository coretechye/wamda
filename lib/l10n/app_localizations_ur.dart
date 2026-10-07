// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'نور آیہ';

  @override
  String get appSlogan => 'ہر آیت سے نور اور ہدایت';

  @override
  String get today => 'آج';

  @override
  String get categories => 'زمرے';

  @override
  String get favorites => 'پسندیدہ';

  @override
  String get search => 'تلاش کریں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get verseOfTheDay => 'آج کی آیت';

  @override
  String get reflection => 'غور و فکر';

  @override
  String get dua => 'دعا';

  @override
  String get share => 'شیئر کریں';

  @override
  String get copy => 'کاپی کریں';

  @override
  String get addToFavorites => 'پسندیدہ میں شامل کریں';

  @override
  String get removeFromFavorites => 'پسندیدہ سے ہٹائیں';

  @override
  String get copiedToClipboard => 'کاپی ہو گیا';

  @override
  String get addedToFavorites => 'پسندیدہ میں شامل کر دیا گیا';

  @override
  String get removedFromFavorites => 'پسندیدہ سے ہٹا دیا گیا';

  @override
  String get noVerses => 'کوئی آیت دستیاب نہیں';

  @override
  String get noFavorites => 'ابھی تک کوئی پسندیدہ آیت نہیں';

  @override
  String get noFavoritesSubtitle => 'اپنی پسندیدہ آیات شامل کرنا شروع کریں';

  @override
  String get noSearchResults => 'کوئی نتیجہ نہیں ملا';

  @override
  String get noSearchResultsSubtitle => 'مختلف تلاش کی اصطلاحات آزمائیں';

  @override
  String get searchHint => 'آیات، غور و فکر، یا سورتوں میں تلاش کریں...';

  @override
  String get searchInVerses => 'آیات میں تلاش کریں';

  @override
  String get searchStartMessage => 'آیت تلاش کرنا شروع کریں';

  @override
  String get searchStartSubtitle =>
      'آپ آیت کے متن، غور و فکر، دعا، یا سورہ کے نام میں تلاش کر سکتے ہیں';

  @override
  String get darkMode => 'ڈارک موڈ';

  @override
  String get lightMode => 'لائٹ موڈ';

  @override
  String get language => 'زبان';

  @override
  String get fontSize => 'فونٹ کا سائز';

  @override
  String get fontSmall => 'چھوٹا';

  @override
  String get fontMedium => 'درمیانہ';

  @override
  String get fontLarge => 'بڑا';

  @override
  String get selectLanguage => 'زبان منتخب کریں';

  @override
  String get selectLanguageMessage => 'اپنی پسندیدہ زبان منتخب کریں';

  @override
  String get continueButton => 'جاری رکھیں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get delete => 'حذف کریں';

  @override
  String get deleteAll => 'سب حذف کریں';

  @override
  String get confirmDelete => 'حذف کی تصدیق کریں';

  @override
  String get confirmDeleteMessage =>
      'کیا آپ اس آیت کو پسندیدہ سے ہٹانا چاہتے ہیں؟';

  @override
  String get confirmDeleteAllMessage =>
      'کیا آپ واقعی تمام پسندیدہ آیات حذف کرنا چاہتے ہیں؟\nاس عمل کو واپس نہیں کیا جا سکتا.';

  @override
  String get clearAllFavorites => 'تمام پسندیدہ صاف کریں';

  @override
  String get allFavoritesCleared => 'تمام پسندیدہ صاف ہو گئے';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get statistics => 'اعدادوشمار';

  @override
  String get about => 'کے بارے میں';

  @override
  String get totalVerses => 'کل آیات';

  @override
  String get categoriesCount => 'زمرے';

  @override
  String get favoritesCount => 'پسندیدہ آیات';

  @override
  String youHaveFavorites(int count) {
    return 'آپ کے پاس $count پسندیدہ آیات ہیں';
  }

  @override
  String versesInCategory(int count) {
    return 'اس زمرے میں $count آیات ہیں';
  }

  @override
  String searchResults(int count) {
    return '$count نتائج ملے';
  }

  @override
  String get shareApp => 'ایپ شیئر کریں';

  @override
  String shareAppMessage(String appName, String appSlogan) {
    return '$appName آزمائیں - $appSlogan\n\nقرآنی آیات کو غور و فکر اور دعاؤں کے ساتھ ظاہر کرنے کے لیے ایک بہترین ایپ۔';
  }

  @override
  String get rateApp => 'ایپ کی درجہ بندی کریں';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get privacyPolicyTitle => 'رازداری کی پالیسی';

  @override
  String get privacyPolicyContent =>
      'ہم آپ کی رازداری کا احترام کرتے ہیں۔ یہ ایپ:\n\n• کوئی ذاتی ڈیٹا جمع نہیں کرتی\n• کام کرنے کے لیے انٹرنیٹ کنکشن کی ضرورت نہیں\n• تمام ڈیٹا آپ کے ڈیوائس پر مقامی طور پر محفوظ ہے\n• ہم تیسرے فریق کے ساتھ کوئی معلومات شیئر نہیں کرتے\n\nیہ ایپ اوپن سورس اور مکمل طور پر مفت ہے۔';

  @override
  String version(String version) {
    return 'ورژن $version';
  }

  @override
  String get exploreMore => 'مزید دریافت کریں';

  @override
  String get exploreMessage =>
      'زمروں کے لحاظ سے آیات براؤز کریں یا مخصوص آیت تلاش کریں';

  @override
  String get verseDetails => 'آیت اور غور و فکر';

  @override
  String get detailsAndReflection => 'تفصیلات اور غور و فکر';

  @override
  String get previousVerse => 'پچھلی';

  @override
  String get nextVerse => 'اگلی';

  @override
  String get copyVerse => 'آیت کاپی کریں';

  @override
  String get back => 'واپس';

  @override
  String get verse => 'آیت';

  @override
  String get verses => 'آیات';

  @override
  String get surah => 'سورہ';

  @override
  String get thanks =>
      'آپ کی دلچسپی کا شکریہ! درجہ بندی کا لنک جلد شامل کیا جائے گا';

  @override
  String get noCategoryVerses => 'اس زمرے میں کوئی آیت نہیں';

  @override
  String get noCategoryVersesSubtitle =>
      'دوسرے زمروں میں تلاش کرنے کی کوشش کریں';

  @override
  String get backToCategories => 'زمروں پر واپس جائیں';

  @override
  String get exploreCategories => 'زمرے دریافت کریں';

  @override
  String get colorTheme => 'رنگ تھیم';

  @override
  String get selectColorTheme => 'رنگ تھیم منتخب کریں';

  @override
  String get classicTheme => 'کلاسیکی';

  @override
  String get nightTheme => 'رات';

  @override
  String get roseTheme => 'گلابی';

  @override
  String get classicThemeDesc => 'سبز اور سنہری';

  @override
  String get nightThemeDesc => 'نیلا اور چاندی';

  @override
  String get roseThemeDesc => 'گلابی اور جامنی';

  @override
  String get sageTheme => 'نرم سبز';

  @override
  String get goldenTheme => 'سنہری';

  @override
  String get beigeTheme => 'بیج';

  @override
  String get sageThemeDesc => 'آنکھوں کے لیے آرام دہ نرم سبز';

  @override
  String get goldenThemeDesc => 'گرم سنہری';

  @override
  String get beigeThemeDesc => 'آنکھوں کے لیے آرام دہ ریتلا';

  @override
  String get duaOfTheDay => 'آج کی دعا';

  @override
  String get allDuas => 'تمام دعائیں';

  @override
  String get duaDetails => 'دعا کی تفصیل';

  @override
  String get duaCategories => 'دعا کی اقسام';

  @override
  String get duaOccasions => 'مواقع';

  @override
  String get benefits => 'فائدہ';

  @override
  String get source => 'ماخذ';

  @override
  String get shareAsImage => 'تصویر کے طور پر شیئر کریں';

  @override
  String get shareAsText => 'متن کے طور پر شیئر کریں';

  @override
  String get selectTemplate => 'ٹیمپلیٹ منتخب کریں';

  @override
  String get classicTemplate => 'کلاسیکی';

  @override
  String get modernTemplate => 'جدید';

  @override
  String get minimalTemplate => 'سادہ';

  @override
  String get islamicTemplate => 'اسلامی';

  @override
  String get dailyWird => 'روزانہ کا ورد';

  @override
  String get myDailyWird => 'میرا روزانہ ورد';

  @override
  String get createWird => 'روزانہ ورد بنائیں';

  @override
  String get wirdProgress => 'روزانہ پیش رفت';

  @override
  String get consecutiveDays => 'مسلسل دن';

  @override
  String get wirdCompleted => 'آج کا ورد مکمل ہو گیا - اللہ آپ کو برکت دے';

  @override
  String get resetWird => 'ری سیٹ کریں';

  @override
  String get addVerses => 'آیات شامل کریں';

  @override
  String get addDuas => 'دعائیں شامل کریں';

  @override
  String get wirdName => 'ورد کا نام';

  @override
  String get preferredTime => 'پسندیدہ وقت';

  @override
  String get morning => 'صبح';

  @override
  String get afternoon => 'دوپہر';

  @override
  String get evening => 'شام';

  @override
  String get night => 'رات';

  @override
  String get anytime => 'کسی بھی وقت';

  @override
  String get contentSync => 'مواد کی مطابقت پذیری';

  @override
  String get checkForUpdates => 'اپ ڈیٹس چیک کریں';

  @override
  String get syncSettings => 'سنک ترتیبات';

  @override
  String get autoSync => 'خودکار سنک';

  @override
  String get syncFrequency => 'سنک کی تعدد';

  @override
  String get manual => 'دستی';

  @override
  String get daily => 'روزانہ';

  @override
  String get weekly => 'ہفتہ وار';

  @override
  String get monthly => 'ماہانہ';

  @override
  String get currentVersion => 'موجودہ ورژن';

  @override
  String get lastSync => 'آخری اپ ڈیٹ';

  @override
  String get updateAvailable => 'نیا اپ ڈیٹ دستیاب ہے';

  @override
  String get downloadAndInstall => 'اپ ڈیٹ ڈاؤن لوڈ اور انسٹال کریں';

  @override
  String get newFeatures => 'نئی خصوصیات';

  @override
  String get syncInProgress => 'سنک ہو رہا ہے...';

  @override
  String get syncCompleted => 'کامیابی سے اپ ڈیٹ ہو گیا';

  @override
  String get syncError => 'سنک میں خرابی';

  @override
  String get upToDate => 'آپ تازہ ترین ورژن استعمال کر رہے ہیں';

  @override
  String get points => 'پوائنٹس';

  @override
  String get rank => 'درجہ';

  @override
  String get yourRank => 'آپ کا درجہ';

  @override
  String get nextRank => 'اگلا درجہ';

  @override
  String get pointsNeeded => 'مطلوبہ پوائنٹس';

  @override
  String get progress => 'پیش رفت';

  @override
  String get beginner => 'مبتدی';

  @override
  String get learner => 'سیکھنے والا';

  @override
  String get scholar => 'عالم';

  @override
  String get advanced => 'ماہر';

  @override
  String get expert => 'ماہرِ فن';

  @override
  String get master => 'استاد';

  @override
  String get sheikh => 'شیخ';

  @override
  String get playRecitation => 'تلاوت چلائیں';

  @override
  String get pauseRecitation => 'تلاوت روکیں';

  @override
  String get stopRecitation => 'بند کریں';

  @override
  String get selectReciter => 'قاری منتخب کریں';

  @override
  String get reciter => 'قاری';

  @override
  String get changeReciter => 'قاری تبدیل کریں';
}
