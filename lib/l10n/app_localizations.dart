import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
    Locale('id'),
    Locale('ur')
  ];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'ومضة'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In ar, this message translates to:
  /// **'آية تضيء يومك'**
  String get appSlogan;

  /// No description provided for @today.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get today;

  /// No description provided for @categories.
  ///
  /// In ar, this message translates to:
  /// **'الفئات'**
  String get categories;

  /// No description provided for @favorites.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get favorites;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'بحث'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @verseOfTheDay.
  ///
  /// In ar, this message translates to:
  /// **'آية اليوم'**
  String get verseOfTheDay;

  /// No description provided for @reflection.
  ///
  /// In ar, this message translates to:
  /// **'التدبر'**
  String get reflection;

  /// No description provided for @dua.
  ///
  /// In ar, this message translates to:
  /// **'الدعاء'**
  String get dua;

  /// No description provided for @share.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get share;

  /// No description provided for @copy.
  ///
  /// In ar, this message translates to:
  /// **'نسخ'**
  String get copy;

  /// No description provided for @addToFavorites.
  ///
  /// In ar, this message translates to:
  /// **'إضافة للمفضلة'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In ar, this message translates to:
  /// **'إزالة من المفضلة'**
  String get removeFromFavorites;

  /// No description provided for @copiedToClipboard.
  ///
  /// In ar, this message translates to:
  /// **'تم النسخ'**
  String get copiedToClipboard;

  /// No description provided for @addedToFavorites.
  ///
  /// In ar, this message translates to:
  /// **'تمت الإضافة للمفضلة'**
  String get addedToFavorites;

  /// No description provided for @removedFromFavorites.
  ///
  /// In ar, this message translates to:
  /// **'تمت الإزالة من المفضلة'**
  String get removedFromFavorites;

  /// No description provided for @noVerses.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد آيات'**
  String get noVerses;

  /// No description provided for @noFavorites.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد آيات مفضلة'**
  String get noFavorites;

  /// No description provided for @noFavoritesSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ بإضافة آياتك المفضلة لتظهر هنا'**
  String get noFavoritesSubtitle;

  /// No description provided for @noSearchResults.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على نتائج'**
  String get noSearchResults;

  /// No description provided for @noSearchResultsSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'جرّب كلمات بحث مختلفة'**
  String get noSearchResultsSubtitle;

  /// No description provided for @searchHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث في الآيات، التدبر، أو السور...'**
  String get searchHint;

  /// No description provided for @searchInVerses.
  ///
  /// In ar, this message translates to:
  /// **'ابحث في الآيات'**
  String get searchInVerses;

  /// No description provided for @searchStartMessage.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ بالبحث عن آية'**
  String get searchStartMessage;

  /// No description provided for @searchStartSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك البحث في نص الآية، التدبر، الدعاء، أو اسم السورة'**
  String get searchStartSubtitle;

  /// No description provided for @darkMode.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الليلي'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الفاتح'**
  String get lightMode;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @fontSize.
  ///
  /// In ar, this message translates to:
  /// **'حجم الخط'**
  String get fontSize;

  /// No description provided for @fontSmall.
  ///
  /// In ar, this message translates to:
  /// **'صغير'**
  String get fontSmall;

  /// No description provided for @fontMedium.
  ///
  /// In ar, this message translates to:
  /// **'متوسط'**
  String get fontMedium;

  /// No description provided for @fontLarge.
  ///
  /// In ar, this message translates to:
  /// **'كبير'**
  String get fontLarge;

  /// No description provided for @selectLanguage.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get selectLanguage;

  /// No description provided for @selectLanguageMessage.
  ///
  /// In ar, this message translates to:
  /// **'اختر لغتك المفضلة'**
  String get selectLanguageMessage;

  /// No description provided for @continueButton.
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueButton;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In ar, this message translates to:
  /// **'حسناً'**
  String get ok;

  /// No description provided for @delete.
  ///
  /// In ar, this message translates to:
  /// **'حذف'**
  String get delete;

  /// No description provided for @deleteAll.
  ///
  /// In ar, this message translates to:
  /// **'مسح الكل'**
  String get deleteAll;

  /// No description provided for @confirmDelete.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الحذف'**
  String get confirmDelete;

  /// No description provided for @confirmDeleteMessage.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد إزالة هذه الآية من المفضلة؟'**
  String get confirmDeleteMessage;

  /// No description provided for @confirmDeleteAllMessage.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من حذف جميع الآيات المفضلة؟\nلن تتمكن من التراجع عن هذا الإجراء.'**
  String get confirmDeleteAllMessage;

  /// No description provided for @clearAllFavorites.
  ///
  /// In ar, this message translates to:
  /// **'مسح جميع المفضلة'**
  String get clearAllFavorites;

  /// No description provided for @allFavoritesCleared.
  ///
  /// In ar, this message translates to:
  /// **'تم مسح جميع المفضلة'**
  String get allFavoritesCleared;

  /// No description provided for @appearance.
  ///
  /// In ar, this message translates to:
  /// **'المظهر'**
  String get appearance;

  /// No description provided for @statistics.
  ///
  /// In ar, this message translates to:
  /// **'الإحصائيات'**
  String get statistics;

  /// No description provided for @about.
  ///
  /// In ar, this message translates to:
  /// **'عن التطبيق'**
  String get about;

  /// No description provided for @totalVerses.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي الآيات'**
  String get totalVerses;

  /// No description provided for @categoriesCount.
  ///
  /// In ar, this message translates to:
  /// **'عدد الفئات'**
  String get categoriesCount;

  /// No description provided for @favoritesCount.
  ///
  /// In ar, this message translates to:
  /// **'الآيات المفضلة'**
  String get favoritesCount;

  /// No description provided for @youHaveFavorites.
  ///
  /// In ar, this message translates to:
  /// **'لديك {count} آية مفضلة'**
  String youHaveFavorites(int count);

  /// No description provided for @versesInCategory.
  ///
  /// In ar, this message translates to:
  /// **'{count} آية في هذه الفئة'**
  String versesInCategory(int count);

  /// No description provided for @searchResults.
  ///
  /// In ar, this message translates to:
  /// **'تم العثور على {count} نتيجة'**
  String searchResults(int count);

  /// No description provided for @shareApp.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة التطبيق'**
  String get shareApp;

  /// No description provided for @shareAppMessage.
  ///
  /// In ar, this message translates to:
  /// **'جرّب تطبيق {appName} - {appSlogan}\n\nتطبيق تأملي رائع لعرض آيات القرآن الكريم مع التدبر والأدعية.'**
  String shareAppMessage(String appName, String appSlogan);

  /// No description provided for @rateApp.
  ///
  /// In ar, this message translates to:
  /// **'تقييم التطبيق'**
  String get rateApp;

  /// No description provided for @privacyPolicy.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyContent.
  ///
  /// In ar, this message translates to:
  /// **'نحن نحترم خصوصيتك. هذا التطبيق:\n\n• لا يجمع أي بيانات شخصية\n• لا يتطلب اتصال بالإنترنت للعمل\n• جميع البيانات محفوظة محلياً على جهازك\n• لا نشارك أي معلومات مع أطراف ثالثة\n\nالتطبيق مفتوح المصدر ومجاني بالكامل.'**
  String get privacyPolicyContent;

  /// No description provided for @version.
  ///
  /// In ar, this message translates to:
  /// **'الإصدار {version}'**
  String version(String version);

  /// No description provided for @exploreMore.
  ///
  /// In ar, this message translates to:
  /// **'استكشف المزيد'**
  String get exploreMore;

  /// No description provided for @exploreMessage.
  ///
  /// In ar, this message translates to:
  /// **'تصفح الآيات حسب الفئات أو ابحث عن آية معينة'**
  String get exploreMessage;

  /// No description provided for @verseDetails.
  ///
  /// In ar, this message translates to:
  /// **'الآية والتدبر'**
  String get verseDetails;

  /// No description provided for @detailsAndReflection.
  ///
  /// In ar, this message translates to:
  /// **'التفاصيل والتدبر'**
  String get detailsAndReflection;

  /// No description provided for @previousVerse.
  ///
  /// In ar, this message translates to:
  /// **'السابقة'**
  String get previousVerse;

  /// No description provided for @nextVerse.
  ///
  /// In ar, this message translates to:
  /// **'التالية'**
  String get nextVerse;

  /// No description provided for @copyVerse.
  ///
  /// In ar, this message translates to:
  /// **'نسخ الآية'**
  String get copyVerse;

  /// No description provided for @back.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get back;

  /// No description provided for @verse.
  ///
  /// In ar, this message translates to:
  /// **'آية'**
  String get verse;

  /// No description provided for @verses.
  ///
  /// In ar, this message translates to:
  /// **'آيات'**
  String get verses;

  /// No description provided for @surah.
  ///
  /// In ar, this message translates to:
  /// **'سورة'**
  String get surah;

  /// No description provided for @thanks.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لاهتمامك! سيتم إضافة رابط التقييم قريباً'**
  String get thanks;

  /// No description provided for @noCategoryVerses.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد آيات في هذه الفئة'**
  String get noCategoryVerses;

  /// No description provided for @noCategoryVersesSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'جرّب البحث في فئات أخرى'**
  String get noCategoryVersesSubtitle;

  /// No description provided for @backToCategories.
  ///
  /// In ar, this message translates to:
  /// **'رجوع للفئات'**
  String get backToCategories;

  /// No description provided for @exploreCategories.
  ///
  /// In ar, this message translates to:
  /// **'استكشف الفئات'**
  String get exploreCategories;

  /// No description provided for @colorTheme.
  ///
  /// In ar, this message translates to:
  /// **'ثيم الألوان'**
  String get colorTheme;

  /// No description provided for @selectColorTheme.
  ///
  /// In ar, this message translates to:
  /// **'اختر ثيم الألوان'**
  String get selectColorTheme;

  /// No description provided for @classicTheme.
  ///
  /// In ar, this message translates to:
  /// **'الكلاسيكي'**
  String get classicTheme;

  /// No description provided for @nightTheme.
  ///
  /// In ar, this message translates to:
  /// **'الليلي'**
  String get nightTheme;

  /// No description provided for @roseTheme.
  ///
  /// In ar, this message translates to:
  /// **'الوردي'**
  String get roseTheme;

  /// No description provided for @classicThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'أخضر وذهبي'**
  String get classicThemeDesc;

  /// No description provided for @nightThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'أزرق وفضي'**
  String get nightThemeDesc;

  /// No description provided for @roseThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'وردي وبنفسجي'**
  String get roseThemeDesc;

  /// No description provided for @sageTheme.
  ///
  /// In ar, this message translates to:
  /// **'الأخضر المريح'**
  String get sageTheme;

  /// No description provided for @goldenTheme.
  ///
  /// In ar, this message translates to:
  /// **'الذهبي'**
  String get goldenTheme;

  /// No description provided for @beigeTheme.
  ///
  /// In ar, this message translates to:
  /// **'البيج'**
  String get beigeTheme;

  /// No description provided for @sageThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'أخضر هادئ مريح للعين'**
  String get sageThemeDesc;

  /// No description provided for @goldenThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'ذهبي دافئ'**
  String get goldenThemeDesc;

  /// No description provided for @beigeThemeDesc.
  ///
  /// In ar, this message translates to:
  /// **'رملي مريح للعين'**
  String get beigeThemeDesc;

  /// No description provided for @duaOfTheDay.
  ///
  /// In ar, this message translates to:
  /// **'دعاء اليوم'**
  String get duaOfTheDay;

  /// No description provided for @allDuas.
  ///
  /// In ar, this message translates to:
  /// **'جميع الأدعية'**
  String get allDuas;

  /// No description provided for @duaDetails.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الدعاء'**
  String get duaDetails;

  /// No description provided for @duaCategories.
  ///
  /// In ar, this message translates to:
  /// **'فئات الأدعية'**
  String get duaCategories;

  /// No description provided for @duaOccasions.
  ///
  /// In ar, this message translates to:
  /// **'المناسبات'**
  String get duaOccasions;

  /// No description provided for @benefits.
  ///
  /// In ar, this message translates to:
  /// **'الفائدة'**
  String get benefits;

  /// No description provided for @source.
  ///
  /// In ar, this message translates to:
  /// **'المصدر'**
  String get source;

  /// No description provided for @shareAsImage.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة كصورة'**
  String get shareAsImage;

  /// No description provided for @shareAsText.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة كنص'**
  String get shareAsText;

  /// No description provided for @selectTemplate.
  ///
  /// In ar, this message translates to:
  /// **'اختر القالب'**
  String get selectTemplate;

  /// No description provided for @classicTemplate.
  ///
  /// In ar, this message translates to:
  /// **'كلاسيكي'**
  String get classicTemplate;

  /// No description provided for @modernTemplate.
  ///
  /// In ar, this message translates to:
  /// **'عصري'**
  String get modernTemplate;

  /// No description provided for @minimalTemplate.
  ///
  /// In ar, this message translates to:
  /// **'بسيط'**
  String get minimalTemplate;

  /// No description provided for @islamicTemplate.
  ///
  /// In ar, this message translates to:
  /// **'إسلامي'**
  String get islamicTemplate;

  /// No description provided for @dailyWird.
  ///
  /// In ar, this message translates to:
  /// **'الورد اليومي'**
  String get dailyWird;

  /// No description provided for @myDailyWird.
  ///
  /// In ar, this message translates to:
  /// **'وردي اليومي'**
  String get myDailyWird;

  /// No description provided for @createWird.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء ورد يومي'**
  String get createWird;

  /// No description provided for @wirdProgress.
  ///
  /// In ar, this message translates to:
  /// **'التقدم اليومي'**
  String get wirdProgress;

  /// No description provided for @consecutiveDays.
  ///
  /// In ar, this message translates to:
  /// **'أيام متتالية'**
  String get consecutiveDays;

  /// No description provided for @wirdCompleted.
  ///
  /// In ar, this message translates to:
  /// **'تم إكمال الورد اليوم - بارك الله فيك'**
  String get wirdCompleted;

  /// No description provided for @resetWird.
  ///
  /// In ar, this message translates to:
  /// **'إعادة التعيين'**
  String get resetWird;

  /// No description provided for @addVerses.
  ///
  /// In ar, this message translates to:
  /// **'إضافة آيات'**
  String get addVerses;

  /// No description provided for @addDuas.
  ///
  /// In ar, this message translates to:
  /// **'إضافة أدعية'**
  String get addDuas;

  /// No description provided for @wirdName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الورد'**
  String get wirdName;

  /// No description provided for @preferredTime.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المفضل'**
  String get preferredTime;

  /// No description provided for @morning.
  ///
  /// In ar, this message translates to:
  /// **'الصباح'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In ar, this message translates to:
  /// **'الظهر'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In ar, this message translates to:
  /// **'المساء'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In ar, this message translates to:
  /// **'الليل'**
  String get night;

  /// No description provided for @anytime.
  ///
  /// In ar, this message translates to:
  /// **'أي وقت'**
  String get anytime;

  /// No description provided for @contentSync.
  ///
  /// In ar, this message translates to:
  /// **'مزامنة المحتوى'**
  String get contentSync;

  /// No description provided for @checkForUpdates.
  ///
  /// In ar, this message translates to:
  /// **'التحقق من التحديثات'**
  String get checkForUpdates;

  /// No description provided for @syncSettings.
  ///
  /// In ar, this message translates to:
  /// **'إعدادات المزامنة'**
  String get syncSettings;

  /// No description provided for @autoSync.
  ///
  /// In ar, this message translates to:
  /// **'مزامنة تلقائية'**
  String get autoSync;

  /// No description provided for @syncFrequency.
  ///
  /// In ar, this message translates to:
  /// **'تكرار المزامنة'**
  String get syncFrequency;

  /// No description provided for @manual.
  ///
  /// In ar, this message translates to:
  /// **'يدوي'**
  String get manual;

  /// No description provided for @daily.
  ///
  /// In ar, this message translates to:
  /// **'يومي'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In ar, this message translates to:
  /// **'أسبوعي'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In ar, this message translates to:
  /// **'شهري'**
  String get monthly;

  /// No description provided for @currentVersion.
  ///
  /// In ar, this message translates to:
  /// **'النسخة الحالية'**
  String get currentVersion;

  /// No description provided for @lastSync.
  ///
  /// In ar, this message translates to:
  /// **'آخر تحديث'**
  String get lastSync;

  /// No description provided for @updateAvailable.
  ///
  /// In ar, this message translates to:
  /// **'تحديث جديد متاح'**
  String get updateAvailable;

  /// No description provided for @downloadAndInstall.
  ///
  /// In ar, this message translates to:
  /// **'تحميل وتثبيت التحديث'**
  String get downloadAndInstall;

  /// No description provided for @newFeatures.
  ///
  /// In ar, this message translates to:
  /// **'المميزات الجديدة'**
  String get newFeatures;

  /// No description provided for @syncInProgress.
  ///
  /// In ar, this message translates to:
  /// **'جاري المزامنة...'**
  String get syncInProgress;

  /// No description provided for @syncCompleted.
  ///
  /// In ar, this message translates to:
  /// **'تم التحديث بنجاح'**
  String get syncCompleted;

  /// No description provided for @syncError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في المزامنة'**
  String get syncError;

  /// No description provided for @upToDate.
  ///
  /// In ar, this message translates to:
  /// **'أنت تستخدم أحدث نسخة'**
  String get upToDate;

  /// No description provided for @points.
  ///
  /// In ar, this message translates to:
  /// **'النقاط'**
  String get points;

  /// No description provided for @rank.
  ///
  /// In ar, this message translates to:
  /// **'الرتبة'**
  String get rank;

  /// No description provided for @yourRank.
  ///
  /// In ar, this message translates to:
  /// **'رتبتك'**
  String get yourRank;

  /// No description provided for @nextRank.
  ///
  /// In ar, this message translates to:
  /// **'الرتبة التالية'**
  String get nextRank;

  /// No description provided for @pointsNeeded.
  ///
  /// In ar, this message translates to:
  /// **'نقاط مطلوبة'**
  String get pointsNeeded;

  /// No description provided for @progress.
  ///
  /// In ar, this message translates to:
  /// **'التقدم'**
  String get progress;

  /// No description provided for @beginner.
  ///
  /// In ar, this message translates to:
  /// **'مبتدئ'**
  String get beginner;

  /// No description provided for @learner.
  ///
  /// In ar, this message translates to:
  /// **'متعلم'**
  String get learner;

  /// No description provided for @scholar.
  ///
  /// In ar, this message translates to:
  /// **'عالم'**
  String get scholar;

  /// No description provided for @advanced.
  ///
  /// In ar, this message translates to:
  /// **'متقدم'**
  String get advanced;

  /// No description provided for @expert.
  ///
  /// In ar, this message translates to:
  /// **'خبير'**
  String get expert;

  /// No description provided for @master.
  ///
  /// In ar, this message translates to:
  /// **'أستاذ'**
  String get master;

  /// No description provided for @sheikh.
  ///
  /// In ar, this message translates to:
  /// **'شيخ'**
  String get sheikh;

  /// No description provided for @playRecitation.
  ///
  /// In ar, this message translates to:
  /// **'تشغيل التلاوة'**
  String get playRecitation;

  /// No description provided for @pauseRecitation.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف التلاوة'**
  String get pauseRecitation;

  /// No description provided for @stopRecitation.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف نهائي'**
  String get stopRecitation;

  /// No description provided for @selectReciter.
  ///
  /// In ar, this message translates to:
  /// **'اختر القارئ'**
  String get selectReciter;

  /// No description provided for @reciter.
  ///
  /// In ar, this message translates to:
  /// **'القارئ'**
  String get reciter;

  /// No description provided for @changeReciter.
  ///
  /// In ar, this message translates to:
  /// **'تغيير القارئ'**
  String get changeReciter;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr', 'id', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
