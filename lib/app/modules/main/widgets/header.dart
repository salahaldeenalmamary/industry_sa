import 'package:appriverpod/app/core/extensions/NavigatorExtension.dart';
import 'package:appriverpod/app/core/extensions/widgets.dart';
import 'package:appriverpod/app/modules/home/providers/home_providers.dart';
import 'package:appriverpod/app/modules/main/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/theme/theme_controller.dart';
import '../../../../config/translations/provider.dart';
import '../../../my_app.dart';
import '../../../routes/app_pages.dart';
import '../../categories/providers/categories_provider.dart';
import '../../providers.dart';

class HeaderLanguageAndTheme extends StatelessWidget {
  final bool isLoading;

  const HeaderLanguageAndTheme({Key? key, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeNotifier = ref.read(themeProvider.notifier);
        final isDarkTheme = ref.watch(themeProvider);
        final localizationService = ref.watch(localizationServiceProvider);
        final theme = Theme.of(context);

        Widget content = Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Theme Toggle Button
            _buildIconButton(
              context: context,
              onPressed: themeNotifier.toggleTheme,
              assetPath: isDarkTheme
                  ? 'assets/vectors/sun.svg'
                  : 'assets/vectors/moon.svg',
              tooltip:
                  isDarkTheme ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            ).expanded(),
            10.horizontalSpace,

            _buildIconButton(
              context: context,
              onPressed: () async {
                await localizationService.toggleLanguage();
                ref.invalidate(mainProvider);

                 ref.refresh(appConfigFutureProvider.future);
                ref.invalidate(homeNotifierProvider);
                ref.invalidate(bottomNavIndexProvider);
              ref.invalidate(categoriesProvider);

                context.navigateAndRemoveUntil(RoutePaths.splash);
              },
              assetPath: 'assets/vectors/language.svg',
              tooltip: 'Change Language',
            ).expanded(),
          ],
        );

        // Wrap content with shimmer if isLoading is true
        if (isLoading) {
          content = Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: content,
          );
        }

        return content;
      },
    );
  }

  Widget _buildIconButton(
      {required VoidCallback onPressed,
      required String assetPath,
      required String tooltip,
      BuildContext? context}) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 39.h,
          width: 39.h,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: SvgPicture.asset(
            assetPath,
            fit: BoxFit.contain,
            color: Theme.of(context!).primaryColor,
          ),
        ),
      ),
    );
  }
}
