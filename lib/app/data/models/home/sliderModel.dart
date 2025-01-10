class SliderModel {
  final List<SliderMainModel> main;
  final SliderItemModel? rightTop;
  final SliderItemModel ?rightBottom;

  SliderModel({
    required this.main,
    required this.rightTop,
    required this.rightBottom,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      main: (json['main'] as List)
          .map((item) => SliderMainModel.fromJson(item))
          .toList(),
      rightTop: SliderItemModel.fromJson(json['right_top']??{}),
      rightBottom: SliderItemModel.fromJson(json['right_bottom']??{}),
    );
  }

  
  
}




class SliderItemModel {
  final int ?id;
  final String ?image;
  final String ?largeImage;
  final String ?smallImage;
  final String ?title;
  final int ?type;
  final int? sourceType;
  final String? slug;

  SliderItemModel({
    required this.id,
    required this.image,
    required this.largeImage,
    required this.smallImage,
    required this.title,
    required this.type,
    required this.sourceType,
    required this.slug,
  });

  factory SliderItemModel.fromJson(Map<String, dynamic> json) {
    return SliderItemModel(
      id: json['id'],
      image: json['image'],
      largeImage: json['large_image'],
      smallImage: json['small_image'],
      title: json['title'],
      type: json['type'],
      sourceType: json['source_type'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'large_image': largeImage,
      'small_image': smallImage,
      'title': title,
      'type': type,
      'source_type': sourceType,
      'slug': slug,
    };
  }
}


class SliderMainModel {
  final int id;
  final String image;
  final String largeImage;
  final String smallImage;
  final String title;
  final int type;
  final int sourceType;
  final String slug;

  SliderMainModel({
    required this.id,
    required this.image,
    required this.largeImage,
    required this.smallImage,
    required this.title,
    required this.type,
    required this.sourceType,
    required this.slug,
  });

  factory SliderMainModel.fromJson(Map<String, dynamic> json) {
    return SliderMainModel(
      id: json['id'],
      image: json['image'],
      largeImage: json['large_image'],
      smallImage: json['small_image'],
      title: json['title'],
      type: json['type'],
      sourceType: json['source_type'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'large_image': largeImage,
      'small_image': smallImage,
      'title': title,
      'type': type,
      'source_type': sourceType,
      'slug': slug,
    };
  }
}
