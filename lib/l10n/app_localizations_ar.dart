// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'ومضة';

  @override
  String get appSlogan => 'آية تضيء يومك';

  @override
  String get today => 'اليوم';

  @override
  String get categories => 'الفئات';

  @override
  String get favorites => 'المفضلة';

  @override
  String get search => 'بحث';

  @override
  String get settings => 'الإعدادات';

  @override
  String get verseOfTheDay => 'آية اليوم';

  @override
  String get reflection => 'التدبر';

  @override
  String get dua => 'الدعاء';

  @override
  String get share => 'مشاركة';

  @override
  String get copy => 'نسخ';

  @override
  String get addToFavorites => 'إضافة للمفضلة';

  @override
  String get removeFromFavorites => 'إزالة من المفضلة';

  @override
  String get copiedToClipboard => 'تم النسخ';

  @override
  String get addedToFavorites => 'تمت الإضافة للمفضلة';

  @override
  String get removedFromFavorites => 'تمت الإزالة من المفضلة';

  @override
  String get noVerses => 'لا توجد آيات';

  @override
  String get noFavorites => 'لا توجد آيات مفضلة';

  @override
  String get noFavoritesSubtitle => 'ابدأ بإضافة آياتك المفضلة لتظهر هنا';

  @override
  String get noSearchResults => 'لم يتم العثور على نتائج';

  @override
  String get noSearchResultsSubtitle => 'جرّب كلمات بحث مختلفة';

  @override
  String get searchHint => 'ابحث في الآيات، التدبر، أو السور...';

  @override
  String get searchInVerses => 'ابحث في الآيات';

  @override
  String get searchStartMessage => 'ابدأ بالبحث عن آية';

  @override
  String get searchStartSubtitle =>
      'يمكنك البحث في نص الآية، التدبر، الدعاء، أو اسم السورة';

  @override
  String get darkMode => 'الوضع الليلي';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get language => 'اللغة';

  @override
  String get fontSize => 'حجم الخط';

  @override
  String get fontSmall => 'صغير';

  @override
  String get fontMedium => 'متوسط';

  @override
  String get fontLarge => 'كبير';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get selectLanguageMessage => 'اختر لغتك المفضلة';

  @override
  String get continueButton => 'متابعة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'حسناً';

  @override
  String get delete => 'حذف';

  @override
  String get deleteAll => 'مسح الكل';

  @override
  String get confirmDelete => 'تأكيد الحذف';

  @override
  String get confirmDeleteMessage => 'هل تريد إزالة هذه الآية من المفضلة؟';

  @override
  String get confirmDeleteAllMessage =>
      'هل أنت متأكد من حذف جميع الآيات المفضلة؟\nلن تتمكن من التراجع عن هذا الإجراء.';

  @override
  String get clearAllFavorites => 'مسح جميع المفضلة';

  @override
  String get allFavoritesCleared => 'تم مسح جميع المفضلة';

  @override
  String get appearance => 'المظهر';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get about => 'عن التطبيق';

  @override
  String get totalVerses => 'إجمالي الآيات';

  @override
  String get categoriesCount => 'عدد الفئات';

  @override
  String get favoritesCount => 'الآيات المفضلة';

  @override
  String youHaveFavorites(int count) {
    return 'لديك $count آية مفضلة';
  }

  @override
  String versesInCategory(int count) {
    return '$count آية في هذه الفئة';
  }

  @override
  String searchResults(int count) {
    return 'تم العثور على $count نتيجة';
  }

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String shareAppMessage(String appName, String appSlogan) {
    return 'جرّب تطبيق $appName - $appSlogan\n\nتطبيق تأملي رائع لعرض آيات القرآن الكريم مع التدبر والأدعية.';
  }

  @override
  String get rateApp => 'تقييم التطبيق';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';

  @override
  String get privacyPolicyContent =>
      'نحن نحترم خصوصيتك. هذا التطبيق:\n\n• لا يجمع أي بيانات شخصية\n• لا يتطلب اتصال بالإنترنت للعمل\n• جميع البيانات محفوظة محلياً على جهازك\n• لا نشارك أي معلومات مع أطراف ثالثة\n\nالتطبيق مفتوح المصدر ومجاني بالكامل.';

  @override
  String version(String version) {
    return 'الإصدار $version';
  }

  @override
  String get exploreMore => 'استكشف المزيد';

  @override
  String get exploreMessage => 'تصفح الآيات حسب الفئات أو ابحث عن آية معينة';

  @override
  String get verseDetails => 'الآية والتدبر';

  @override
  String get detailsAndReflection => 'التفاصيل والتدبر';

  @override
  String get previousVerse => 'السابقة';

  @override
  String get nextVerse => 'التالية';

  @override
  String get copyVerse => 'نسخ الآية';

  @override
  String get back => 'رجوع';

  @override
  String get verse => 'آية';

  @override
  String get verses => 'آيات';

  @override
  String get surah => 'سورة';

  @override
  String get thanks => 'شكراً لاهتمامك! سيتم إضافة رابط التقييم قريباً';

  @override
  String get noCategoryVerses => 'لا توجد آيات في هذه الفئة';

  @override
  String get noCategoryVersesSubtitle => 'جرّب البحث في فئات أخرى';

  @override
  String get backToCategories => 'رجوع للفئات';

  @override
  String get exploreCategories => 'استكشف الفئات';

  @override
  String get colorTheme => 'ثيم الألوان';

  @override
  String get selectColorTheme => 'اختر ثيم الألوان';

  @override
  String get classicTheme => 'الكلاسيكي';

  @override
  String get nightTheme => 'الليلي';

  @override
  String get roseTheme => 'الوردي';

  @override
  String get classicThemeDesc => 'أخضر وذهبي';

  @override
  String get nightThemeDesc => 'أزرق وفضي';

  @override
  String get roseThemeDesc => 'وردي وبنفسجي';

  @override
  String get sageTheme => 'الأخضر المريح';

  @override
  String get goldenTheme => 'الذهبي';

  @override
  String get beigeTheme => 'البيج';

  @override
  String get sageThemeDesc => 'أخضر هادئ مريح للعين';

  @override
  String get goldenThemeDesc => 'ذهبي دافئ';

  @override
  String get beigeThemeDesc => 'رملي مريح للعين';

  @override
  String get duaOfTheDay => 'دعاء اليوم';

  @override
  String get allDuas => 'جميع الأدعية';

  @override
  String get duaDetails => 'تفاصيل الدعاء';

  @override
  String get duaCategories => 'فئات الأدعية';

  @override
  String get duaOccasions => 'المناسبات';

  @override
  String get benefits => 'الفائدة';

  @override
  String get source => 'المصدر';

  @override
  String get shareAsImage => 'مشاركة كصورة';

  @override
  String get shareAsText => 'مشاركة كنص';

  @override
  String get selectTemplate => 'اختر القالب';

  @override
  String get classicTemplate => 'كلاسيكي';

  @override
  String get modernTemplate => 'عصري';

  @override
  String get minimalTemplate => 'بسيط';

  @override
  String get islamicTemplate => 'إسلامي';

  @override
  String get dailyWird => 'الورد اليومي';

  @override
  String get myDailyWird => 'وردي اليومي';

  @override
  String get createWird => 'إنشاء ورد يومي';

  @override
  String get wirdProgress => 'التقدم اليومي';

  @override
  String get consecutiveDays => 'أيام متتالية';

  @override
  String get wirdCompleted => 'تم إكمال الورد اليوم - بارك الله فيك';

  @override
  String get resetWird => 'إعادة التعيين';

  @override
  String get addVerses => 'إضافة آيات';

  @override
  String get addDuas => 'إضافة أدعية';

  @override
  String get wirdName => 'اسم الورد';

  @override
  String get preferredTime => 'الوقت المفضل';

  @override
  String get morning => 'الصباح';

  @override
  String get afternoon => 'الظهر';

  @override
  String get evening => 'المساء';

  @override
  String get night => 'الليل';

  @override
  String get anytime => 'أي وقت';

  @override
  String get contentSync => 'مزامنة المحتوى';

  @override
  String get checkForUpdates => 'التحقق من التحديثات';

  @override
  String get syncSettings => 'إعدادات المزامنة';

  @override
  String get autoSync => 'مزامنة تلقائية';

  @override
  String get syncFrequency => 'تكرار المزامنة';

  @override
  String get manual => 'يدوي';

  @override
  String get daily => 'يومي';

  @override
  String get weekly => 'أسبوعي';

  @override
  String get monthly => 'شهري';

  @override
  String get currentVersion => 'النسخة الحالية';

  @override
  String get lastSync => 'آخر تحديث';

  @override
  String get updateAvailable => 'تحديث جديد متاح';

  @override
  String get downloadAndInstall => 'تحميل وتثبيت التحديث';

  @override
  String get newFeatures => 'المميزات الجديدة';

  @override
  String get syncInProgress => 'جاري المزامنة...';

  @override
  String get syncCompleted => 'تم التحديث بنجاح';

  @override
  String get syncError => 'حدث خطأ في المزامنة';

  @override
  String get upToDate => 'أنت تستخدم أحدث نسخة';

  @override
  String get points => 'النقاط';

  @override
  String get rank => 'الرتبة';

  @override
  String get yourRank => 'رتبتك';

  @override
  String get nextRank => 'الرتبة التالية';

  @override
  String get pointsNeeded => 'نقاط مطلوبة';

  @override
  String get progress => 'التقدم';

  @override
  String get beginner => 'مبتدئ';

  @override
  String get learner => 'متعلم';

  @override
  String get scholar => 'عالم';

  @override
  String get advanced => 'متقدم';

  @override
  String get expert => 'خبير';

  @override
  String get master => 'أستاذ';

  @override
  String get sheikh => 'شيخ';

  @override
  String get playRecitation => 'تشغيل التلاوة';

  @override
  String get pauseRecitation => 'إيقاف التلاوة';

  @override
  String get stopRecitation => 'إيقاف نهائي';

  @override
  String get selectReciter => 'اختر القارئ';

  @override
  String get reciter => 'القارئ';

  @override
  String get changeReciter => 'تغيير القارئ';
}
