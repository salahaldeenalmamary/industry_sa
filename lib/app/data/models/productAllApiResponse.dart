import 'Product.dart';

class ProductAllApiResponse {
  final Result result;
  final dynamic shipping;
  final List<Brand>? brandsWithProductCount;
  final List<DealsCategory>? dealsCategory;

  ProductAllApiResponse({
    required this.result,
    this.shipping,
    this.brandsWithProductCount,
    this.dealsCategory,
  });

  factory ProductAllApiResponse.fromJson(Map<String, dynamic> json) {
    return ProductAllApiResponse(
      result: Result.fromJson(json['result']),
      shipping: json['shipping'],
      brandsWithProductCount: (json['brands_with_product_count'] as List?)
          ?.map((item) => Brand.fromJson(item))
          .toList(),
      dealsCategory: (json['deals_category'] as List?)
          ?.map((item) => DealsCategory.fromJson(item))
          .toList(),
    );
  }

  
}

class Result {
  final int currentPage;
  final List<Product> data;
  final int lastPage;
  final String? nextPageUrl;
  final String path;

  Result({
    required this.currentPage,
    required this.data,
    required this.lastPage,
    this.nextPageUrl,
    required this.path,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      currentPage: json['current_page'],
      data:
          (json['data'] as List).map((item) => Product.fromJson(item)).toList(),
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
    );
  }

  
}

class Brand {
  final String name;
  final int id;
  final String param;
  final int productCount;

  Brand({
    required this.name,
    required this.id,
    required this.param,
    required this.productCount,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      id: json['id'],
      param: json['param'],
      productCount: json['product_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'param': param,
      'product_count': productCount,
    };
  }
}

class DealsCategory {
  final int id;
  final String name;
  final String title;
  final String param;
  final String slug;
  final int productCount;

  DealsCategory({
    required this.id,
    required this.name,
    required this.title,
    required this.param,
    required this.slug,
    required this.productCount,
  });

  factory DealsCategory.fromJson(Map<String, dynamic> json) {
    return DealsCategory(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      param: json['param'],
      slug: json['slug'],
      productCount: json['product_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'param': param,
      'slug': slug,
      'product_count': productCount,
    };
  }
}
