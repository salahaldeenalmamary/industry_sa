import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../providers/categories_provider.dart';
import '../widgets/childCategoryWidget.dart';
import '../widgets/widgets.dart';

class CategoriesView extends BaseView {
  @override
  Widget? loadingBuilder(WidgetRef ref) {
    super.loadingBuilder(ref);
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  void onRefreshIndicator(WidgetRef ref) async {
    await ref.read(categoriesProvider.notifier).fetchCategoryData();
    super.onRefreshIndicator(ref);
  }

  @override
  void onRetry(WidgetRef ref) {
    ref.read(categoriesProvider.notifier).fetchCategoryData();
    super.onRetry(ref);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {}

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoriesProvider);
    return PageStateRender(state.pageState, ref,
        child: Row(
          children: [
            categoriesSideBar().expanded(),
            ListView.builder(
              itemCount: state.currentCategory?.children?.length ?? 0,
              itemBuilder: (context, index) {
                final childCategory = state.currentCategory?.children![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ChildCategoryWidget(childCategory: childCategory),
                );
              },
            ).expanded(flex: 2),
          ],
        ));
  }
}
