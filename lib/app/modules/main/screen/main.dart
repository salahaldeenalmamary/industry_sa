import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/app/widget/CustomDropdownWidget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../categories/screen/categoriesView.dart';
import '../../home/screens/views/home_view.dart';
import '../../providers.dart';
import '../widgets/SearchField.dart';
import '../widgets/header.dart';
import '../provider/main_provider.dart';
import '../widgets/customBottomNavigationBar.dart';
import '../widgets/logo_App_widget.dart';
import '../widgets/selectableItemBottomSheetCountery.dart';

class MainView extends BaseView {
  final PageController _pageController = PageController();

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    super.bottomNavigationBar(context, ref);
    final currentIndex = ref.watch(bottomNavIndexProvider.state).state;
    return CustomBottomNavigationBar(
      currentIndex: currentIndex,
      bottomNavigationKey: GlobalKey(),
      onTap: (index) {
        ref.read(bottomNavIndexProvider.state).state = index;
        _pageController.jumpToPage(index);
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);

    return PageView(
      pageSnapping: false,
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {},
      children: [HomeView(), CategoriesView()],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);

    return AppBar(
      toolbarHeight: 80,
      title: Row(children: [
       
        LogoAppWidget().expanded(), HeaderLanguageAndTheme().expanded(),
      ]).paddingOnly(top: 2, bottom: 5),
      bottom: PreferredSize(

        preferredSize: Size.fromHeight(80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchField(
              suffix: CustomDropdown(
                  items: state.searchItems,
                  hintText: 'all',
selectedItem: state.selectionSearchItem,
                  backgroundColor: Theme.of(context).primaryColor,
                  onChanged: (selectionSearchItem) {
                    ref.read(mainProvider.notifier)
                    .handleSelectedSearchDropdown(selectionSearchItem);}),
            ).decorated(
              color: Theme.of(context).primaryColor,
            ),
            SelectableItemBottomSheetCountry(),
          ],
        ),
      ),
    );
  }
}
