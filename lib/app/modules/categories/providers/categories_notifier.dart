import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'categories_state.dart';
import '../../../data/models/common/category.dart';

class CategoriesNotifier extends StateNotifier<CategoriesState> {
 List<Category> categories; 
  CategoriesNotifier(this.categories) : super(const CategoriesState(categories: [], currentCategory: null));

  void fetchCategories() {
   
    state = state.copyWith(categories: categories,currentCategory: categories.first );
  }

  void setCurrentCategory(Category category) {

    state = state.copyWith(currentCategory: category);
  }
}

