import '../Product.dart';

class FeaturedCategoryModel {
  final int id;
  final String title;
  final String slug;
  final String image;
  final int parent;

  FeaturedCategoryModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.parent,
  });

  factory FeaturedCategoryModel.fromJson(Map<String, dynamic> json) {
    return FeaturedCategoryModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      image: json['image'],
      parent: json['parent'],
    );
  }
}

class FeaturedBrandModel {
  final int id;
  final String title;
  final String image;
  final String slug;
  final int productsCount;

  FeaturedBrandModel({
    required this.id,
    required this.title,
    required this.image,
    required this.slug,
    required this.productsCount,
  });

  factory FeaturedBrandModel.fromJson(Map<String, dynamic> json) {
    return FeaturedBrandModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      slug: json['slug'],
      productsCount: json['products_count'],
    );
  }
}
