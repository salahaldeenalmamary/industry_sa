import 'package:equatable/equatable.dart';
import '../../../data/models/common/category.dart';
import '../../../core/base/BaseState.dart';
import '../../../core/model/page_state.dart';

class CategoriesState extends BaseState<List<Category>?> with EquatableMixin {
  final Category? currentCategory;

  CategoriesState({
    required List<Category>? data,
    this.currentCategory,
    bool actionLoading = false,
    PageState pageState = PageState.DEFAULT,
    String message = '',
    String errorMessage = '',
    String successMessage = '',
    bool refreshPage = false,
  }) : super(
          data: data,
          actionLoading: actionLoading,
          pageState: pageState,
          message: message,
          errorMessage: errorMessage,
          successMessage: successMessage,
          refreshPage: refreshPage,
        );

  /// Factory method for the initial state
  static CategoriesState initial() {
    return CategoriesState(
      data: null, // Set as null or [] depending on your app logic
      actionLoading: false,
      pageState: PageState.LOADING,
      message: '',
      errorMessage: '',
      successMessage: '',
      refreshPage: false,
    );
  }

  /// Method for creating a copy of the state with updated values
  CategoriesState copyWith({
    List<Category>? data,
    Category? currentCategory,
    bool? actionLoading,
    PageState? pageState,
    String? message,
    String? errorMessage,
    String? successMessage,
    bool? refreshPage,
  }) {
    return CategoriesState(
      data: data ?? this.data,
      currentCategory: currentCategory ?? this.currentCategory,
      actionLoading: actionLoading ?? this.actionLoading,
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      refreshPage: refreshPage ?? this.refreshPage,
    );
  }

  @override
  List<Object?> get props => [
        data,
        currentCategory,
        actionLoading,
        pageState,
        message,
        errorMessage,
        successMessage,
        refreshPage,
        ...super.props,
      ];
}
