import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/core/data/local/my_shared_pref.dart';
import 'localization_service.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  final LocalizationService _localizationService;

  LocaleNotifier(this._localizationService)
      : super(_localizationService.getCurrentLocale()) {
    state = _localizationService.getCurrentLocale();
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await MySharedPref.setCurrentLanguage(locale.languageCode);
  }
}
