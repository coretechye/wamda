// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Wamda';

  @override
  String get appSlogan => 'Lumière et guidance de chaque verset';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get categories => 'Catégories';

  @override
  String get favorites => 'Favoris';

  @override
  String get search => 'Rechercher';

  @override
  String get settings => 'Paramètres';

  @override
  String get verseOfTheDay => 'Verset du jour';

  @override
  String get reflection => 'Réflexion';

  @override
  String get dua => 'Invocation';

  @override
  String get share => 'Partager';

  @override
  String get copy => 'Copier';

  @override
  String get addToFavorites => 'Ajouter aux favoris';

  @override
  String get removeFromFavorites => 'Retirer des favoris';

  @override
  String get copiedToClipboard => 'Copié';

  @override
  String get addedToFavorites => 'Ajouté aux favoris';

  @override
  String get removedFromFavorites => 'Retiré des favoris';

  @override
  String get noVerses => 'Aucun verset disponible';

  @override
  String get noFavorites => 'Aucun verset favori';

  @override
  String get noFavoritesSubtitle =>
      'Commencez à ajouter vos versets favoris pour les voir ici';

  @override
  String get noSearchResults => 'Aucun résultat trouvé';

  @override
  String get noSearchResultsSubtitle =>
      'Essayez des termes de recherche différents';

  @override
  String get searchHint => 'Rechercher versets, réflexions ou sourates...';

  @override
  String get searchInVerses => 'Rechercher dans les versets';

  @override
  String get searchStartMessage => 'Commencer à rechercher un verset';

  @override
  String get searchStartSubtitle =>
      'Vous pouvez rechercher dans le texte du verset, la réflexion, l\'invocation ou le nom de la sourate';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get lightMode => 'Mode clair';

  @override
  String get language => 'Langue';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get fontSmall => 'Petite';

  @override
  String get fontMedium => 'Moyenne';

  @override
  String get fontLarge => 'Grande';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get selectLanguageMessage => 'Choisissez votre langue préférée';

  @override
  String get continueButton => 'Continuer';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get confirmDelete => 'Confirmer la suppression';

  @override
  String get confirmDeleteMessage =>
      'Voulez-vous retirer ce verset des favoris?';

  @override
  String get confirmDeleteAllMessage =>
      'Êtes-vous sûr de vouloir supprimer tous les versets favoris?\nCette action ne peut pas être annulée.';

  @override
  String get clearAllFavorites => 'Effacer tous les favoris';

  @override
  String get allFavoritesCleared => 'Tous les favoris effacés';

  @override
  String get appearance => 'Apparence';

  @override
  String get statistics => 'Statistiques';

  @override
  String get about => 'À propos';

  @override
  String get totalVerses => 'Total des versets';

  @override
  String get categoriesCount => 'Catégories';

  @override
  String get favoritesCount => 'Versets favoris';

  @override
  String youHaveFavorites(int count) {
    return 'Vous avez $count versets favoris';
  }

  @override
  String versesInCategory(int count) {
    return '$count versets dans cette catégorie';
  }

  @override
  String searchResults(int count) {
    return '$count résultats trouvés';
  }

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String shareAppMessage(String appName, String appSlogan) {
    return 'Essayez $appName - $appSlogan\n\nUne merveilleuse application contemplative pour afficher des versets coraniques avec réflexions et invocations.';
  }

  @override
  String get rateApp => 'Évaluer l\'application';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicyContent =>
      'Nous respectons votre vie privée. Cette application:\n\n• Ne collecte aucune donnée personnelle\n• Ne nécessite pas de connexion Internet pour fonctionner\n• Toutes les données sont stockées localement sur votre appareil\n• Nous ne partageons aucune information avec des tiers\n\nL\'application est open source et entièrement gratuite.';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get exploreMore => 'Explorer plus';

  @override
  String get exploreMessage =>
      'Parcourir les versets par catégories ou rechercher un verset spécifique';

  @override
  String get verseDetails => 'Verset et réflexion';

  @override
  String get detailsAndReflection => 'Détails et réflexion';

  @override
  String get previousVerse => 'Précédent';

  @override
  String get nextVerse => 'Suivant';

  @override
  String get copyVerse => 'Copier le verset';

  @override
  String get back => 'Retour';

  @override
  String get verse => 'Verset';

  @override
  String get verses => 'Versets';

  @override
  String get surah => 'Sourate';

  @override
  String get thanks =>
      'Merci de votre intérêt! Le lien d\'évaluation sera ajouté prochainement';

  @override
  String get noCategoryVerses => 'Aucun verset dans cette catégorie';

  @override
  String get noCategoryVersesSubtitle =>
      'Essayez de rechercher dans d\'autres catégories';

  @override
  String get backToCategories => 'Retour aux catégories';

  @override
  String get exploreCategories => 'Explorer les catégories';

  @override
  String get colorTheme => 'Thème de couleur';

  @override
  String get selectColorTheme => 'Sélectionner un thème';

  @override
  String get classicTheme => 'Classique';

  @override
  String get nightTheme => 'Nuit';

  @override
  String get roseTheme => 'Rose';

  @override
  String get classicThemeDesc => 'Vert et Or';

  @override
  String get nightThemeDesc => 'Bleu et Argent';

  @override
  String get roseThemeDesc => 'Rose et Violet';

  @override
  String get sageTheme => 'Vert Apaisant';

  @override
  String get goldenTheme => 'Doré';

  @override
  String get beigeTheme => 'Beige';

  @override
  String get sageThemeDesc => 'Vert doux et reposant';

  @override
  String get goldenThemeDesc => 'Or chaleureux';

  @override
  String get beigeThemeDesc => 'Sable reposant';

  @override
  String get duaOfTheDay => 'Invocation du jour';

  @override
  String get allDuas => 'Toutes les invocations';

  @override
  String get duaDetails => 'Détails de l\'invocation';

  @override
  String get duaCategories => 'Catégories d\'invocations';

  @override
  String get duaOccasions => 'Occasions';

  @override
  String get benefits => 'Bienfait';

  @override
  String get source => 'Source';

  @override
  String get shareAsImage => 'Partager en image';

  @override
  String get shareAsText => 'Partager en texte';

  @override
  String get selectTemplate => 'Choisir le modèle';

  @override
  String get classicTemplate => 'Classique';

  @override
  String get modernTemplate => 'Moderne';

  @override
  String get minimalTemplate => 'Minimaliste';

  @override
  String get islamicTemplate => 'Islamique';

  @override
  String get dailyWird => 'Wird quotidien';

  @override
  String get myDailyWird => 'Mon wird quotidien';

  @override
  String get createWird => 'Créer un wird quotidien';

  @override
  String get wirdProgress => 'Progression quotidienne';

  @override
  String get consecutiveDays => 'Jours consécutifs';

  @override
  String get wirdCompleted =>
      'Wird accompli aujourd\'hui - Qu\'Allah vous bénisse';

  @override
  String get resetWird => 'Réinitialiser';

  @override
  String get addVerses => 'Ajouter des versets';

  @override
  String get addDuas => 'Ajouter des invocations';

  @override
  String get wirdName => 'Nom du wird';

  @override
  String get preferredTime => 'Heure préférée';

  @override
  String get morning => 'Matin';

  @override
  String get afternoon => 'Midi';

  @override
  String get evening => 'Soir';

  @override
  String get night => 'Nuit';

  @override
  String get anytime => 'À tout moment';

  @override
  String get contentSync => 'Synchronisation du contenu';

  @override
  String get checkForUpdates => 'Vérifier les mises à jour';

  @override
  String get syncSettings => 'Paramètres de synchronisation';

  @override
  String get autoSync => 'Synchronisation automatique';

  @override
  String get syncFrequency => 'Fréquence de synchronisation';

  @override
  String get manual => 'Manuel';

  @override
  String get daily => 'Quotidien';

  @override
  String get weekly => 'Hebdomadaire';

  @override
  String get monthly => 'Mensuel';

  @override
  String get currentVersion => 'Version actuelle';

  @override
  String get lastSync => 'Dernière mise à jour';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get downloadAndInstall => 'Télécharger et installer la mise à jour';

  @override
  String get newFeatures => 'Nouveautés';

  @override
  String get syncInProgress => 'Synchronisation...';

  @override
  String get syncCompleted => 'Mise à jour réussie';

  @override
  String get syncError => 'Erreur de synchronisation';

  @override
  String get upToDate => 'Vous utilisez la dernière version';

  @override
  String get points => 'Points';

  @override
  String get rank => 'Rang';

  @override
  String get yourRank => 'Votre rang';

  @override
  String get nextRank => 'Rang suivant';

  @override
  String get pointsNeeded => 'Points requis';

  @override
  String get progress => 'Progression';

  @override
  String get beginner => 'Débutant';

  @override
  String get learner => 'Apprenant';

  @override
  String get scholar => 'Érudit';

  @override
  String get advanced => 'Avancé';

  @override
  String get expert => 'Expert';

  @override
  String get master => 'Maître';

  @override
  String get sheikh => 'Cheikh';

  @override
  String get playRecitation => 'Lancer la récitation';

  @override
  String get pauseRecitation => 'Mettre en pause';

  @override
  String get stopRecitation => 'Arrêter';

  @override
  String get selectReciter => 'Choisir le récitateur';

  @override
  String get reciter => 'Récitateur';

  @override
  String get changeReciter => 'Changer de récitateur';
}
