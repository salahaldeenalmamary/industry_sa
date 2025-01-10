

class BannerModel {
  final int id;
  final int type;
  final int sourceType;
  final List<String>? tags;
  final String? url;
  final String title;
  final int status;
  final int closable;
  final DateTime ?createdAt;
  final DateTime? updatedAt;
  final int? adminId;
  final String slug;
  final String ?image;
  final String? largeImage;
  final String ?smallImage;

  const BannerModel({
    required this.id,
    required this.type,
    required this.sourceType,
    this.tags,
    this.url,
    required this.title,
    required this.status,
    required this.closable,
    required this.createdAt,
    required this.updatedAt,
    required this.adminId,
    required this.slug,
    required this.image,
    required this.largeImage,
    required this.smallImage,
  });

  /// Factory method to create a `BannerModel` from JSON
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      type: json['type'],
      sourceType: json['source_type'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      url: json['url'],
      title: json['title'],
      status: json['status'],
      closable: json['closable'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      adminId: json['admin_id'],
      slug: json['slug'],
      image: json['image'],
      largeImage: json['large_image'],
      smallImage: json['small_image'],
    );
  }
}
