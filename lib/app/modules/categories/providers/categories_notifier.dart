import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base/BaseNotifier.dart';
import '../../../core/model/page_state.dart';
import '../../../data/repositories/remote_data_source.dart';
import 'categories_state.dart';
import '../../../data/models/common/category.dart';

class CategoriesNotifier extends BaseNotifier<CategoriesState> {
 final RemoteDataSource _repository;
  CategoriesNotifier(this._repository) 
: super(
          CategoriesState.initial(),
        );

  
 Future<void> fetchCategoryData({bool refresh = false}) async {
    await callApi(
      _repository.getCategories(),
  
      onComplete: () {
        state = state.copyWith(
          pageState: PageState.DEFAULT,
          currentCategory: state.data?.firstOrNull,
        );
      },
      onSuccess: (response) {
        state = state.copyWith(
          data: response.data,
        );
      },
    );
  }

  void setCurrentCategory(Category category) {

    state = state.copyWith(currentCategory: category);
  }
}

