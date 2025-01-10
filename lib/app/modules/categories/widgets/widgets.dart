import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/common/category.dart';
import '../../../widget/SideBarWidget.dart';
import '../../../widget/sidebar/td_sidebar.dart';
import '../providers/categories_provider.dart';

class categoriesSideBar extends ConsumerWidget {
  const categoriesSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final categoriesState = ref.watch(categoriesProvider);
    final categories = categoriesState.data ?? [];
    final currentCategory = categoriesState.currentCategory;
    final categoryNotifier = ref.read(categoriesProvider.notifier);


    final List<SideItemProps> sideItems = categories.asMap().entries.map((entry) {
      int index = entry.key;
      Category category = entry.value;

      return SideItemProps(
        index: index,
        textStyle: TextStyle(fontSize: 12),
        label: category.title,
        value: index,
      );
    }).toList();

   
    int currentCategoryIndex = currentCategory != null
        ? categories.indexWhere((cat) => cat.id == currentCategory.id)
        : 0;

    return SideBarWidget(
      sideItems: sideItems,
      itemHeight: 200,
      currentValue: currentCategoryIndex,
      onSelected: (index) {
        categoryNotifier.setCurrentCategory(categories[index]);
     
      },
      onChanged: (value) {},
    );
  }
}
