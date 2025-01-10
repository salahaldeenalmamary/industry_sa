
import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/theme/theme_controller.dart';
import '../config/translations/provider.dart';

import '../generated/l10n.dart';
import 'routes/app_pages.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        final isLightTheme = ref.watch(themeProvider);
        final themeData = ref.read(themeProvider.notifier).themeData;
        final locale = ref.watch(localeProvider);
     
        return MaterialApp(
   initialRoute: RoutePaths.splash,
      routes: AppRoutes.routes,
 
      navigatorKey: AppRoutes.navigatorKey, 
          scrollBehavior: const MaterialScrollBehavior().copyWith(
         dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
           
    
            physics: BouncingScrollPhysics(),
          

           
          ),
          title: '',
          theme: themeData,
          locale: locale,
        localizationsDelegates: const [
        S.delegate, 
     GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
      ],
    
       
          supportedLocales: _getSupportedLocales(),
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(),
              child: widget!,
            );
          },
        );
      },
    );
  }

  List<Locale> _getSupportedLocales() {
    return [
      const Locale('en', ''),
      const Locale('ar', ''),
    ];
  }
}
