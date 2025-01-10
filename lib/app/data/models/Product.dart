import 'productPrice.dart';

class Product {
  final int id;
  final String ?title;
  final bool express;
  final String sku;
  final String image;
  final String ?slug;
  final String? productUnitName;
  final int ?minQuantity;
  final String? numberOfCarton;
  final bool ?isAvailable;
  final int? maxAllowedQuantity;
  final List<ProductPrice> productPrices;

  Product({
    required this.id,
    required this.title,
    required this.express,
    required this.sku,
    required this.image,
    required this.slug,
    required this.productUnitName,
    required this.minQuantity,
    required this.numberOfCarton,
    required this.isAvailable,
    required this.maxAllowedQuantity,
    required this.productPrices,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      express: json['express'],
      sku: json['sku'],
      image: json['image'],
      slug: json['slug'],
      productUnitName: json['product_unit']['name'],
      minQuantity: json['min_quantity'],
      numberOfCarton: json['number_of_carton'],
      isAvailable: json['is_available'],
      maxAllowedQuantity: json['maxAllowedQuantity'],
      productPrices: (json['product_prices'] as List)
          .map((e) => ProductPrice.fromJson(e))
          .toList(),
    );
  }

  
}
