import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:appriverpod/utils/image.dart';
import 'package:flutter/material.dart';

import '../../../core/data/local/my_shared_pref.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySharedPref.getCurrentLocal().isArabic
        ? Image.asset(ImageConstants.logo_ar,fit: BoxFit.contain, )
        : Image.asset(ImageConstants.logo_en,fit: BoxFit.contain, );
  }
}
