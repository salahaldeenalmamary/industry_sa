// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get bottomNavHome {
    return Intl.message(
      'Home',
      name: 'bottomNavHome',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get bottomNavFavorite {
    return Intl.message(
      'Favorite',
      name: 'bottomNavFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bottomNavSettings {
    return Intl.message(
      'Settings',
      name: 'bottomNavSettings',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get titleOtherView {
    return Intl.message(
      'Other',
      name: 'titleOtherView',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get bottomNavCategories {
    return Intl.message(
      'Categories',
      name: 'bottomNavCategories',
      desc: '',
      args: [],
    );
  }

  /// `RFQ`
  String get bottomNavPriceOffers {
    return Intl.message(
      'RFQ',
      name: 'bottomNavPriceOffers',
      desc: '',
      args: [],
    );
  }

  /// `Factories`
  String get bottomNavFactories {
    return Intl.message(
      'Factories',
      name: 'bottomNavFactories',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get bottomNavCart {
    return Intl.message(
      'Cart',
      name: 'bottomNavCart',
      desc: '',
      args: [],
    );
  }

  /// `Number of units in the carton`
  String get numberOfCarton {
    return Intl.message(
      'Number of units in the carton',
      name: 'numberOfCarton',
      desc: '',
      args: [],
    );
  }

  /// `Minimum order quantity`
  String get minAllowedQuantityOrder {
    return Intl.message(
      'Minimum order quantity',
      name: 'minAllowedQuantityOrder',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get currency {
    return Intl.message(
      'SAR',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Choose your location`
  String get chooseYourLocation {
    return Intl.message(
      'Choose your location',
      name: 'chooseYourLocation',
      desc: '',
      args: [],
    );
  }

  /// `Shipping to`
  String get shippingTo {
    return Intl.message(
      'Shipping to',
      name: 'shippingTo',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get someThingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'someThingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized Access`
  String get unauthorized {
    return Intl.message(
      'Unauthorized Access',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `No Data Available`
  String get noDataAvailable {
    return Intl.message(
      'No Data Available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Factories`
  String get factories {
    return Intl.message(
      'Factories',
      name: 'factories',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
