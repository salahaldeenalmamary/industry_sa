import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  

  void navigateAndReplace(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  void goBack([Object? result]) {
    Navigator.of(this).pop(result);
  }
}
