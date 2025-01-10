import 'package:appriverpod/app/modules/main/provider/main_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'categories_notifier.dart';
import 'categories_state.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) {
    final categories = ref.read(mainProvider).data?.categories ?? [];

    return CategoriesNotifier(categories)..fetchCategories();
  },
);
