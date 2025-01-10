import 'package:appriverpod/app/modules/main/provider/main_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import 'categories_notifier.dart';
import 'categories_state.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) {
    

    return CategoriesNotifier(ref.read(RemoteDataSourceProvider))..fetchCategoryData();
  },
);
