import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'LocaleNotifier.dart';
import 'localization_service.dart';

final localizationServiceProvider = Provider<LocalizationService>((ref) {
  return LocalizationService(ref);
});

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final localizationService = ref.watch(localizationServiceProvider);
  return LocaleNotifier(localizationService);
});
