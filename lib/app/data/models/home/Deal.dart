
import '../Product.dart';

class Deal {
  final int id;
  final String categoryName;
  final List<Product> products;

  Deal({
    required this.id,
    required this.categoryName,
    required this.products,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'],
      categoryName: json['category_name'],
      products: (json['products'] as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }
}
