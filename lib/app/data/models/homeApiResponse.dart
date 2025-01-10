import 'Product.dart';
import 'home/BannerModel.dart';
import 'home/Deal.dart';
import 'home/Featured.dart';
import 'home/collection.dart';
import 'home/sliderModel.dart';


class HomeApiResponse {
  final List<Collection>? collections;
  final List<FeaturedCategoryModel>? featuredCategories;
  final String ?timeZone;
  final List<FeaturedBrandModel>? featuredBrands;
  final List<Deal> ?deals;  
  final SliderModel? slider;
  final List<BannerModel>? banners; // Added banners

  HomeApiResponse({
     this.collections,
     this.featuredCategories,
     this.timeZone,
     this.featuredBrands,
     this.deals,  // Added deals
     this.slider, // Added slider
     this.banners, // Added banners
  });

  factory HomeApiResponse.fromJson(Map<String, dynamic> json) {
    return HomeApiResponse(
      collections: (json['collections'] as List)
          .map((e) => Collection.fromJson(e))
          .toList(),
      featuredCategories: (json['featured_categories'] as List)
          .map((item) => FeaturedCategoryModel.fromJson(item))
          .toList(),
      timeZone: json['time_zone'],
      featuredBrands: (json['featured_brands'] as List)
          .map((item) => FeaturedBrandModel.fromJson(item))
          .toList(),
      deals: (json['deals'] as List) // Added deals parsing
          .map((dealJson) => Deal.fromJson(dealJson))
          .toList(),
      slider: SliderModel.fromJson(json['slider']), // Added slider parsing
      banners: (json['banners'] as List) // Added banners parsing
          .map((bannerJson) => BannerModel.fromJson(bannerJson))
          .toList(),
    );
  }
}
