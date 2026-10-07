// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Wamda';

  @override
  String get appSlogan => 'Cahaya dan petunjuk dari setiap ayat';

  @override
  String get today => 'Hari Ini';

  @override
  String get categories => 'Kategori';

  @override
  String get favorites => 'Favorit';

  @override
  String get search => 'Cari';

  @override
  String get settings => 'Pengaturan';

  @override
  String get verseOfTheDay => 'Ayat Hari Ini';

  @override
  String get reflection => 'Renungan';

  @override
  String get dua => 'Doa';

  @override
  String get share => 'Bagikan';

  @override
  String get copy => 'Salin';

  @override
  String get addToFavorites => 'Tambah ke Favorit';

  @override
  String get removeFromFavorites => 'Hapus dari Favorit';

  @override
  String get copiedToClipboard => 'Tersalin';

  @override
  String get addedToFavorites => 'Ditambahkan ke favorit';

  @override
  String get removedFromFavorites => 'Dihapus dari favorit';

  @override
  String get noVerses => 'Tidak ada ayat tersedia';

  @override
  String get noFavorites => 'Belum ada ayat favorit';

  @override
  String get noFavoritesSubtitle =>
      'Mulai tambahkan ayat favorit Anda untuk melihatnya di sini';

  @override
  String get noSearchResults => 'Tidak ada hasil ditemukan';

  @override
  String get noSearchResultsSubtitle => 'Coba istilah pencarian yang berbeda';

  @override
  String get searchHint => 'Cari ayat, renungan, atau surah...';

  @override
  String get searchInVerses => 'Cari dalam ayat';

  @override
  String get searchStartMessage => 'Mulai mencari ayat';

  @override
  String get searchStartSubtitle =>
      'Anda dapat mencari dalam teks ayat, renungan, doa, atau nama surah';

  @override
  String get darkMode => 'Mode Gelap';

  @override
  String get lightMode => 'Mode Terang';

  @override
  String get language => 'Bahasa';

  @override
  String get fontSize => 'Ukuran Font';

  @override
  String get fontSmall => 'Kecil';

  @override
  String get fontMedium => 'Sedang';

  @override
  String get fontLarge => 'Besar';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get selectLanguageMessage => 'Pilih bahasa pilihan Anda';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get cancel => 'Batal';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Hapus';

  @override
  String get deleteAll => 'Hapus Semua';

  @override
  String get confirmDelete => 'Konfirmasi Hapus';

  @override
  String get confirmDeleteMessage =>
      'Apakah Anda ingin menghapus ayat ini dari favorit?';

  @override
  String get confirmDeleteAllMessage =>
      'Apakah Anda yakin ingin menghapus semua ayat favorit?\nTindakan ini tidak dapat dibatalkan.';

  @override
  String get clearAllFavorites => 'Hapus Semua Favorit';

  @override
  String get allFavoritesCleared => 'Semua favorit dihapus';

  @override
  String get appearance => 'Tampilan';

  @override
  String get statistics => 'Statistik';

  @override
  String get about => 'Tentang';

  @override
  String get totalVerses => 'Total Ayat';

  @override
  String get categoriesCount => 'Kategori';

  @override
  String get favoritesCount => 'Ayat Favorit';

  @override
  String youHaveFavorites(int count) {
    return 'Anda memiliki $count ayat favorit';
  }

  @override
  String versesInCategory(int count) {
    return '$count ayat dalam kategori ini';
  }

  @override
  String searchResults(int count) {
    return 'Ditemukan $count hasil';
  }

  @override
  String get shareApp => 'Bagikan Aplikasi';

  @override
  String shareAppMessage(String appName, String appSlogan) {
    return 'Coba $appName - $appSlogan\n\nAplikasi kontemplatif yang luar biasa untuk menampilkan ayat-ayat Al-Quran dengan renungan dan doa.';
  }

  @override
  String get rateApp => 'Beri Rating Aplikasi';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get privacyPolicyContent =>
      'Kami menghormati privasi Anda. Aplikasi ini:\n\n• Tidak mengumpulkan data pribadi\n• Tidak memerlukan koneksi internet untuk bekerja\n• Semua data disimpan secara lokal di perangkat Anda\n• Kami tidak membagikan informasi dengan pihak ketiga\n\nAplikasi ini open source dan sepenuhnya gratis.';

  @override
  String version(String version) {
    return 'Versi $version';
  }

  @override
  String get exploreMore => 'Jelajahi Lebih Lanjut';

  @override
  String get exploreMessage =>
      'Jelajahi ayat berdasarkan kategori atau cari ayat tertentu';

  @override
  String get verseDetails => 'Ayat dan Renungan';

  @override
  String get detailsAndReflection => 'Detail dan Renungan';

  @override
  String get previousVerse => 'Sebelumnya';

  @override
  String get nextVerse => 'Selanjutnya';

  @override
  String get copyVerse => 'Salin Ayat';

  @override
  String get back => 'Kembali';

  @override
  String get verse => 'Ayat';

  @override
  String get verses => 'Ayat-ayat';

  @override
  String get surah => 'Surah';

  @override
  String get thanks =>
      'Terima kasih atas minat Anda! Tautan rating akan segera ditambahkan';

  @override
  String get noCategoryVerses => 'Tidak ada ayat dalam kategori ini';

  @override
  String get noCategoryVersesSubtitle => 'Coba cari di kategori lain';

  @override
  String get backToCategories => 'Kembali ke Kategori';

  @override
  String get exploreCategories => 'Jelajahi Kategori';

  @override
  String get colorTheme => 'Tema Warna';

  @override
  String get selectColorTheme => 'Pilih Tema Warna';

  @override
  String get classicTheme => 'Klasik';

  @override
  String get nightTheme => 'Malam';

  @override
  String get roseTheme => 'Mawar';

  @override
  String get classicThemeDesc => 'Hijau dan Emas';

  @override
  String get nightThemeDesc => 'Biru dan Perak';

  @override
  String get roseThemeDesc => 'Merah Muda dan Ungu';

  @override
  String get sageTheme => 'Hijau Lembut';

  @override
  String get goldenTheme => 'Emas';

  @override
  String get beigeTheme => 'Krem';

  @override
  String get sageThemeDesc => 'Hijau lembut nyaman di mata';

  @override
  String get goldenThemeDesc => 'Emas hangat';

  @override
  String get beigeThemeDesc => 'Pasir nyaman di mata';

  @override
  String get duaOfTheDay => 'Doa Hari Ini';

  @override
  String get allDuas => 'Semua Doa';

  @override
  String get duaDetails => 'Detail Doa';

  @override
  String get duaCategories => 'Kategori Doa';

  @override
  String get duaOccasions => 'Kesempatan';

  @override
  String get benefits => 'Manfaat';

  @override
  String get source => 'Sumber';

  @override
  String get shareAsImage => 'Bagikan sebagai Gambar';

  @override
  String get shareAsText => 'Bagikan sebagai Teks';

  @override
  String get selectTemplate => 'Pilih Templat';

  @override
  String get classicTemplate => 'Klasik';

  @override
  String get modernTemplate => 'Modern';

  @override
  String get minimalTemplate => 'Minimalis';

  @override
  String get islamicTemplate => 'Islami';

  @override
  String get dailyWird => 'Wirid Harian';

  @override
  String get myDailyWird => 'Wirid Harian Saya';

  @override
  String get createWird => 'Buat Wirid Harian';

  @override
  String get wirdProgress => 'Kemajuan Harian';

  @override
  String get consecutiveDays => 'Hari Berturut-turut';

  @override
  String get wirdCompleted =>
      'Wirid selesai hari ini - Semoga Allah memberkahimu';

  @override
  String get resetWird => 'Atur Ulang';

  @override
  String get addVerses => 'Tambah Ayat';

  @override
  String get addDuas => 'Tambah Doa';

  @override
  String get wirdName => 'Nama Wirid';

  @override
  String get preferredTime => 'Waktu yang Diinginkan';

  @override
  String get morning => 'Pagi';

  @override
  String get afternoon => 'Siang';

  @override
  String get evening => 'Sore';

  @override
  String get night => 'Malam';

  @override
  String get anytime => 'Kapan Saja';

  @override
  String get contentSync => 'Sinkronisasi Konten';

  @override
  String get checkForUpdates => 'Periksa Pembaruan';

  @override
  String get syncSettings => 'Pengaturan Sinkronisasi';

  @override
  String get autoSync => 'Sinkronisasi Otomatis';

  @override
  String get syncFrequency => 'Frekuensi Sinkronisasi';

  @override
  String get manual => 'Manual';

  @override
  String get daily => 'Harian';

  @override
  String get weekly => 'Mingguan';

  @override
  String get monthly => 'Bulanan';

  @override
  String get currentVersion => 'Versi Saat Ini';

  @override
  String get lastSync => 'Pembaruan Terakhir';

  @override
  String get updateAvailable => 'Pembaruan Tersedia';

  @override
  String get downloadAndInstall => 'Unduh dan Pasang Pembaruan';

  @override
  String get newFeatures => 'Fitur Baru';

  @override
  String get syncInProgress => 'Menyinkronkan...';

  @override
  String get syncCompleted => 'Pembaruan Berhasil';

  @override
  String get syncError => 'Kesalahan Sinkronisasi';

  @override
  String get upToDate => 'Anda menggunakan versi terbaru';

  @override
  String get points => 'Poin';

  @override
  String get rank => 'Peringkat';

  @override
  String get yourRank => 'Peringkat Anda';

  @override
  String get nextRank => 'Peringkat Berikutnya';

  @override
  String get pointsNeeded => 'Poin Dibutuhkan';

  @override
  String get progress => 'Kemajuan';

  @override
  String get beginner => 'Pemula';

  @override
  String get learner => 'Pelajar';

  @override
  String get scholar => 'Cendekiawan';

  @override
  String get advanced => 'Mahir';

  @override
  String get expert => 'Ahli';

  @override
  String get master => 'Master';

  @override
  String get sheikh => 'Syekh';

  @override
  String get playRecitation => 'Putar Bacaan';

  @override
  String get pauseRecitation => 'Jeda Bacaan';

  @override
  String get stopRecitation => 'Hentikan';

  @override
  String get selectReciter => 'Pilih Qari';

  @override
  String get reciter => 'Qari';

  @override
  String get changeReciter => 'Ganti Qari';
}
