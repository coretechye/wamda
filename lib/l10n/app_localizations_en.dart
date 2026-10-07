// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Wamda';

  @override
  String get appSlogan => 'Light and guidance from every verse';

  @override
  String get today => 'Today';

  @override
  String get categories => 'Categories';

  @override
  String get favorites => 'Favorites';

  @override
  String get search => 'Search';

  @override
  String get settings => 'Settings';

  @override
  String get verseOfTheDay => 'Verse of the Day';

  @override
  String get reflection => 'Reflection';

  @override
  String get dua => 'Supplication';

  @override
  String get share => 'Share';

  @override
  String get copy => 'Copy';

  @override
  String get addToFavorites => 'Add to Favorites';

  @override
  String get removeFromFavorites => 'Remove from Favorites';

  @override
  String get copiedToClipboard => 'Copied';

  @override
  String get addedToFavorites => 'Added to favorites';

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get noVerses => 'No verses available';

  @override
  String get noFavorites => 'No favorite verses yet';

  @override
  String get noFavoritesSubtitle =>
      'Start adding your favorite verses to see them here';

  @override
  String get noSearchResults => 'No results found';

  @override
  String get noSearchResultsSubtitle => 'Try different search terms';

  @override
  String get searchHint => 'Search verses, reflections, or surahs...';

  @override
  String get searchInVerses => 'Search in verses';

  @override
  String get searchStartMessage => 'Start searching for a verse';

  @override
  String get searchStartSubtitle =>
      'You can search in verse text, reflection, supplication, or surah name';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get language => 'Language';

  @override
  String get fontSize => 'Font Size';

  @override
  String get fontSmall => 'Small';

  @override
  String get fontMedium => 'Medium';

  @override
  String get fontLarge => 'Large';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get selectLanguageMessage => 'Choose your preferred language';

  @override
  String get continueButton => 'Continue';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Delete';

  @override
  String get deleteAll => 'Delete All';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get confirmDeleteMessage =>
      'Do you want to remove this verse from favorites?';

  @override
  String get confirmDeleteAllMessage =>
      'Are you sure you want to delete all favorite verses?\nThis action cannot be undone.';

  @override
  String get clearAllFavorites => 'Clear All Favorites';

  @override
  String get allFavoritesCleared => 'All favorites cleared';

  @override
  String get appearance => 'Appearance';

  @override
  String get statistics => 'Statistics';

  @override
  String get about => 'About';

  @override
  String get totalVerses => 'Total Verses';

  @override
  String get categoriesCount => 'Categories';

  @override
  String get favoritesCount => 'Favorite Verses';

  @override
  String youHaveFavorites(int count) {
    return 'You have $count favorite verses';
  }

  @override
  String versesInCategory(int count) {
    return '$count verses in this category';
  }

  @override
  String searchResults(int count) {
    return 'Found $count results';
  }

  @override
  String get shareApp => 'Share App';

  @override
  String shareAppMessage(String appName, String appSlogan) {
    return 'Try $appName - $appSlogan\n\nA wonderful contemplative app for displaying Quranic verses with reflections and supplications.';
  }

  @override
  String get rateApp => 'Rate App';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyContent =>
      'We respect your privacy. This app:\n\n• Does not collect any personal data\n• Does not require internet connection to work\n• All data is stored locally on your device\n• We do not share any information with third parties\n\nThe app is open source and completely free.';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get exploreMore => 'Explore More';

  @override
  String get exploreMessage =>
      'Browse verses by categories or search for a specific verse';

  @override
  String get verseDetails => 'Verse and Reflection';

  @override
  String get detailsAndReflection => 'Details and Reflection';

  @override
  String get previousVerse => 'Previous';

  @override
  String get nextVerse => 'Next';

  @override
  String get copyVerse => 'Copy Verse';

  @override
  String get back => 'Back';

  @override
  String get verse => 'Verse';

  @override
  String get verses => 'Verses';

  @override
  String get surah => 'Surah';

  @override
  String get thanks =>
      'Thanks for your interest! Rating link will be added soon';

  @override
  String get noCategoryVerses => 'No verses in this category';

  @override
  String get noCategoryVersesSubtitle => 'Try searching in other categories';

  @override
  String get backToCategories => 'Back to Categories';

  @override
  String get exploreCategories => 'Explore Categories';

  @override
  String get colorTheme => 'Color Theme';

  @override
  String get selectColorTheme => 'Select Color Theme';

  @override
  String get classicTheme => 'Classic';

  @override
  String get nightTheme => 'Night';

  @override
  String get roseTheme => 'Rose';

  @override
  String get classicThemeDesc => 'Green and Gold';

  @override
  String get nightThemeDesc => 'Blue and Silver';

  @override
  String get roseThemeDesc => 'Pink and Purple';

  @override
  String get sageTheme => 'Calm Green';

  @override
  String get goldenTheme => 'Golden';

  @override
  String get beigeTheme => 'Beige';

  @override
  String get sageThemeDesc => 'Soft, eye-friendly green';

  @override
  String get goldenThemeDesc => 'Warm gold';

  @override
  String get beigeThemeDesc => 'Eye-friendly sand';

  @override
  String get duaOfTheDay => 'Dua of the Day';

  @override
  String get allDuas => 'All Duas';

  @override
  String get duaDetails => 'Dua Details';

  @override
  String get duaCategories => 'Dua Categories';

  @override
  String get duaOccasions => 'Occasions';

  @override
  String get benefits => 'Benefits';

  @override
  String get source => 'Source';

  @override
  String get shareAsImage => 'Share as Image';

  @override
  String get shareAsText => 'Share as Text';

  @override
  String get selectTemplate => 'Select Template';

  @override
  String get classicTemplate => 'Classic';

  @override
  String get modernTemplate => 'Modern';

  @override
  String get minimalTemplate => 'Minimal';

  @override
  String get islamicTemplate => 'Islamic';

  @override
  String get dailyWird => 'Daily Wird';

  @override
  String get myDailyWird => 'My Daily Wird';

  @override
  String get createWird => 'Create Daily Wird';

  @override
  String get wirdProgress => 'Daily Progress';

  @override
  String get consecutiveDays => 'Consecutive Days';

  @override
  String get wirdCompleted => 'Wird completed today - May Allah bless you';

  @override
  String get resetWird => 'Reset';

  @override
  String get addVerses => 'Add Verses';

  @override
  String get addDuas => 'Add Duas';

  @override
  String get wirdName => 'Wird Name';

  @override
  String get preferredTime => 'Preferred Time';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get evening => 'Evening';

  @override
  String get night => 'Night';

  @override
  String get anytime => 'Anytime';

  @override
  String get contentSync => 'Content Sync';

  @override
  String get checkForUpdates => 'Check for Updates';

  @override
  String get syncSettings => 'Sync Settings';

  @override
  String get autoSync => 'Auto Sync';

  @override
  String get syncFrequency => 'Sync Frequency';

  @override
  String get manual => 'Manual';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get monthly => 'Monthly';

  @override
  String get currentVersion => 'Current Version';

  @override
  String get lastSync => 'Last Update';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get downloadAndInstall => 'Download and Install Update';

  @override
  String get newFeatures => 'New Features';

  @override
  String get syncInProgress => 'Syncing...';

  @override
  String get syncCompleted => 'Update Completed Successfully';

  @override
  String get syncError => 'Sync Error';

  @override
  String get upToDate => 'You\'re using the latest version';

  @override
  String get points => 'Points';

  @override
  String get rank => 'Rank';

  @override
  String get yourRank => 'Your Rank';

  @override
  String get nextRank => 'Next Rank';

  @override
  String get pointsNeeded => 'Points Needed';

  @override
  String get progress => 'Progress';

  @override
  String get beginner => 'Beginner';

  @override
  String get learner => 'Learner';

  @override
  String get scholar => 'Scholar';

  @override
  String get advanced => 'Advanced';

  @override
  String get expert => 'Expert';

  @override
  String get master => 'Master';

  @override
  String get sheikh => 'Sheikh';

  @override
  String get playRecitation => 'Play Recitation';

  @override
  String get pauseRecitation => 'Pause Recitation';

  @override
  String get stopRecitation => 'Stop';

  @override
  String get selectReciter => 'Select Reciter';

  @override
  String get reciter => 'Reciter';

  @override
  String get changeReciter => 'Change Reciter';
}
