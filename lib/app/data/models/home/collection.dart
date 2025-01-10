import '../Product.dart';

class Collection {
  final String id;
  final String title;
  final String slug;
  final List<Product> productCollections;

  Collection({
    required this.id,
    required this.title,
    required this.slug,
    required this.productCollections,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      productCollections: (json['product_collections'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}
