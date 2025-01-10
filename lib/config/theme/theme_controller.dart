import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/core/data/local/my_shared_pref.dart';
import 'my_theme.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(MySharedPref.getThemeIsLight()){
    
  }

  void toggleTheme() {
    state = !state;
    MySharedPref.setThemeIsLight(state);
  }

  ThemeData get themeData => MyTheme.getThemeData(isLight: state);
}


final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
