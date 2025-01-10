class BaseCategory {
  final int id;
  final int? inHeader;
  final String title;
  final int? status;
  final String slug;
  final int? parent;

  BaseCategory({
    required this.id,
    this.inHeader,
    required this.title,
    this.status,
    required this.slug,
    this.parent,
  });

  factory BaseCategory.fromJson(Map<String, dynamic> json) {
    return BaseCategory(
      id: json['id'] ?? 0,
      inHeader: json['in_header'] as int?,
      title: json['title'] ?? '',
      status: json['status'] as int?,
      slug: json['slug'] ?? '',
      parent: json['parent'] as int?,
    );
  }
}

class Category extends BaseCategory {
  final String? image;
  final String? icon;
  final int? productCount;
  final List<ChildCategory>? children;

  Category({
    required int id,
    int? inHeader,
    required String title,
    int? status,
    required String slug,
    int? parent,
    this.image,
    this.icon,
    this.productCount,
    this.children,
  }) : super(
          id: id,
          inHeader: inHeader,
          title: title,
          status: status,
          slug: slug,
          parent: parent,
        );

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      inHeader: json['in_header'] as int?,
      title: json['title'] ?? '',
      status: json['status'] as int?,
      slug: json['slug'] ?? '',
      parent: json['parent'] as int?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      productCount: json['product_count'] as int?,
      children: (json['child'] as List<dynamic>?)
              ?.map((child) => ChildCategory.fromJson(child))
              .toList() ??
          [],
    );
  }
}

class ChildCategory extends BaseCategory {
  final String? image;
  final String? icon;
  final int? productCount;
  final List<SubChildCategory>? children;

  ChildCategory({
    required int id,
    int? inHeader,
    required String title,
    int? status,
    required String slug,
    int? parent,
    this.image,
    this.icon,
    this.productCount,
    this.children,
  }) : super(
          id: id,
          inHeader: inHeader,
          title: title,
          status: status,
          slug: slug,
          parent: parent,
        );

  factory ChildCategory.fromJson(Map<String, dynamic> json) {
    return ChildCategory(
      id: json['id'] ?? 0,
      inHeader: json['in_header'] as int?,
      title: json['title'] ?? '',
      status: json['status'] as int?,
      slug: json['slug'] ?? '',
      parent: json['parent'] as int?,
      image: json['image'] as String?,
      icon: json['icon'] as String?,
      productCount: json['product_count'] as int?,
      children: (json['child'] as List<dynamic>?)
              ?.map((child) => SubChildCategory.fromJson(child))
              .toList() ??
          [],
    );
  }
}

class SubChildCategory extends BaseCategory {
  SubChildCategory({
    required int id,
    int? inHeader,
    required String title,
    int? status,
    required String slug,
    int? parent,
  }) : super(
          id: id,
          inHeader: inHeader,
          title: title,
          status: status,
          slug: slug,
          parent: parent,
        );

  factory SubChildCategory.fromJson(Map<String, dynamic> json) {
    return SubChildCategory(
      id: json['id'] ?? 0,
      inHeader: json['in_header'] as int?,
      title: json['title'] ?? '',
      status: json['status'] as int?,
      slug: json['slug'] ?? '',
      parent: json['parent'] as int?,
    );
  }
}
