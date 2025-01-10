import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/core/data/local/my_shared_pref.dart';
import '../../app/modules/home/providers/home_providers.dart';
import '../../app/modules/main/provider/main_provider.dart';
import '../../generated/l10n.dart';
import 'provider.dart';


class LocalizationService {
  final Ref ref;

  LocalizationService(this.ref);

  static Locale defaultLanguage = supportedLanguages['ar']!;

  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'AR'),
  };

  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'en': const TextStyle(fontFamily: 'Poppins'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  

  bool isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  Future<void> updateLanguage(String languageCode) async {
    if (!isLanguageSupported(languageCode)) return;
    await MySharedPref.setCurrentLanguage(languageCode);
    ref.read(localeProvider.notifier).setLocale(supportedLanguages[languageCode]!);
 
}

  bool isItEnglish(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');

  Locale getCurrentLocale() => MySharedPref.getCurrentLocal();


  Future<void> toggleLanguage() async {
    final currentLocale = getCurrentLocale();
    final newLanguageCode = currentLocale.languageCode == 'ar' ? 'en' : 'ar';
    await updateLanguage(newLanguageCode);
    
    
  }
}



extension LocalizationExtension on BuildContext {
  S get l10n => S.of(this);
}

extension LocaleExtensions on Locale {

  bool get isArabic => languageCode.toLowerCase() == 'ar';

 
  bool get isEnglish => languageCode.toLowerCase() == 'en';
}