import 'package:appriverpod/app/modules/main/screen/main.dart';
import 'package:flutter/material.dart';
import '../modules/home/screens/views/home_view.dart';
import '../modules/main/screen/splashScreen.dart';
class AppRoutes {

  static Map<String, WidgetBuilder> get routes {
    return {
      RoutePaths.splash: (_) => const SplashScreen(), // Splash Screen
      RoutePaths.homeView: (_) =>  HomeView(),  // Home Screen
      RoutePaths.main: (_) =>  MainView(),  // Main Screen
    };
  }

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class RoutePaths {

  static const String splash = '/';  
  static const String main = '/main';
  static const String homeView = '/home';
}