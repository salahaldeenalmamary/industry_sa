import 'package:flutter/material.dart';
import '../../app/core/data/local/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(

useMaterial3: true,
    
        cardTheme: CardTheme(
          
            color: isLight
                ? LightThemeColors.cardColor
                : null),
       
        primaryColor: isLight
            ? LightThemeColors.primaryColor
            : DarkThemeColors.primaryColor,
            expansionTileTheme: ExpansionTileThemeData(backgroundColor:isLight
              ? Colors.white
              : Color.fromARGB(255, 43, 44, 45) ),

        
        colorScheme: ColorScheme.fromSeed(
          secondary:  isLight
              ? Colors.white
              : Color.fromARGB(255, 43, 44, 45),
              background:  isLight
              ? Colors.white
              : Color.fromARGB(255, 43, 44, 45),
              
        seedColor:  isLight
              ? Colors.white
              : DarkThemeColors.backgroundColor,
          brightness: isLight ? Brightness.light : Brightness.dark,
        ).copyWith(
          
        ),


        brightness: isLight ? Brightness.light : Brightness.dark,
        

        scaffoldBackgroundColor: isLight
            ? LightThemeColors.scaffoldBackgroundColor
            : DarkThemeColors.scaffoldBackgroundColor,

   
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isLight
              ? LightThemeColors.primaryColor
              : DarkThemeColors.primaryColor,
        ),

 
      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),
        iconButtonTheme: MyStyles.iconButtonTheme(isLight),

        iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),


        extensions: [
         
        ]);
  }


  static changeTheme() {
 
    bool isLightTheme = MySharedPref.getThemeIsLight();
    MySharedPref.setThemeIsLight(!isLightTheme);

    

  }

  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
