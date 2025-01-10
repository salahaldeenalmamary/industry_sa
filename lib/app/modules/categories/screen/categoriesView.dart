import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/categories_provider.dart';
import '../widgets/childCategoryWidget.dart';
import '../widgets/widgets.dart';

class CategoriesView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final state = ref.watch(categoriesProvider);


    return Row(
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
              ).expanded(flex: 2)
            ,
           
            
          ],
        );
  }
}
