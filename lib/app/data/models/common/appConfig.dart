
import 'category.dart';
import 'common.dart';

class AppConfig {
  final SiteSetting? siteSetting;
  final Setting? setting;
  final List<Language>? languages;
  final Language? defaultLanguage;
  final String? imgSrcUrl;
  final String ?thumbPrefix;
  final String? defaultImage;
  final HeaderLinks? headerLinks;
  final Banner? topBanner;
  final Banner? popupBanner;
  final List<Category>? categories;
  final List<Country>? countries;
  AppConfig({
     this.languages,
     this.defaultLanguage,
     this.imgSrcUrl,
     this.siteSetting,
     this.setting,
     this.countries,
     this.thumbPrefix,
     this.defaultImage,
     this.headerLinks,
    this.topBanner,
    this.popupBanner,
    this.categories,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      languages: json['languages'] != null
          ? (json['languages'] as List<dynamic>)
              .map((lang) => Language.fromJson(lang))
              .toList()
          : [],
           countries:json['countries']!=null? List<Country>.from(
        json['countries'].map((country) => Country.fromJson(country)),
      ):[],
      siteSetting: json['site_setting'] != null
          ? SiteSetting.fromJson(json['site_setting'])
          : null,
      setting: json['setting'] != null
          ? Setting.fromJson(json['setting'])
          : null,
      defaultLanguage: Language.fromJson(json['default_language']),
      imgSrcUrl: json['img_src_url'] ?? '',  
      thumbPrefix: json['thumb_prefix'] ?? '',
      defaultImage: json['default_image'] ?? '',
      headerLinks: json['header_links'] != null
          ? HeaderLinks.fromJson(json['header_links'])
          : null,
      topBanner: json['top_banner'] != null
          ? Banner.fromJson(json['top_banner'])
          : null,
      popupBanner: json['popup_banner'] != null
          ? Banner.fromJson(json['popup_banner'])
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List<dynamic>)
              .map((category) => Category.fromJson(category))
              .toList()
          : [],
    );
  }
}
