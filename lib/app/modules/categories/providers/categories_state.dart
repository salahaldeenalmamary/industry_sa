import 'package:equatable/equatable.dart';
import '../../../data/models/common/category.dart';

class CategoriesState extends Equatable {
  final List<Category>? categories;
  final Category? currentCategory;

  const CategoriesState({this.categories, this.currentCategory});

  @override
  List<Object?> get props => [categories, currentCategory];

  CategoriesState copyWith({
    List<Category>? categories,
    Category? currentCategory,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      currentCategory: currentCategory ?? this.currentCategory,
    );
  }
}
