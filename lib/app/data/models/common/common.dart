
class Language {
  final String name;
  final String code;
  final int defaultValue;
  final String direction;
  final int predefined;

  Language({
    required this.name,
    required this.code,
    required this.defaultValue,
    required this.direction,
    required this.predefined,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      code: json['code'],
      defaultValue: json['default'],
      direction: json['direction'],
      predefined: json['predefined'],
    );
  }
}

class Banner {
  final int id;
  final int type;
  final int sourceType;
  final String? tags;
  final String? url;
  final String title;
  final int status;
  final int closable;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int adminId;
  final String slug;
  final String? image;
  final String? largeImage;
  final String? smallImage;

  Banner({
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
    this.image,
    this.largeImage,
    this.smallImage,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      type: json['type'],
      sourceType: json['source_type'],
      tags: json['tags'],
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

class HeaderLinks {
  final List<dynamic> left;
  final List<dynamic> right;

  HeaderLinks({
    required this.left,
    required this.right,
  });

  factory HeaderLinks.fromJson(Map<String, dynamic> json) {
    return HeaderLinks(
      left: json['left'] ?? [],
      right: json['right'] ?? [],
    );
  }
}

class SiteSetting {
  final int id;
  final String siteName;
  final String siteUrl;
  final String metaTitle;
  final String metaDescription;
  final String emailLogo;
  final String headerLogo;
  final String footerLogo;
  final String? primaryColor;
  final String? primaryHoverColor;
  final String? styling;
  final String privacyPolices;
  final String returnPolices;
  final String vendorsTermsCondition;
  final String customersTermsCondition;
  final String commissions;
  final Links links;

  SiteSetting({
    required this.id,
    required this.siteName,
    required this.siteUrl,
    required this.metaTitle,
    required this.metaDescription,
    required this.emailLogo,
    required this.headerLogo,
    required this.footerLogo,
    this.primaryColor,
    this.primaryHoverColor,
    this.styling,
    required this.privacyPolices,
    required this.returnPolices,
    required this.vendorsTermsCondition,
    required this.customersTermsCondition,
    required this.commissions,
    required this.links,
  });

  factory SiteSetting.fromJson(Map<String, dynamic> json) {
    return SiteSetting(
      id: json['id'],
      siteName: json['site_name'],
      siteUrl: json['site_url'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      emailLogo: json['email_logo'],
      headerLogo: json['header_logo'],
      footerLogo: json['footer_logo'],
      primaryColor: json['primary_color'],
      primaryHoverColor: json['primary_hover_color'],
      styling: json['styling'],
      privacyPolices: json['privacy_polices'],
      returnPolices: json['return_polices'],
      vendorsTermsCondition: json['vendors_terms_condition'],
      customersTermsCondition: json['customers_terms_condition'],
      commissions: json['commissions'],
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  final String phone;
  final String mobile;
  final String twitter;
  final String youtube;
  final String facebook;
  final String? linkedin;
  final String? telegram;
  final String whatsapp;
  final String instagram;
  final String? appleStore;
  final String? googlePlay;

  Links({
    required this.phone,
    required this.mobile,
    required this.twitter,
    required this.youtube,
    required this.facebook,
    this.linkedin,
    this.telegram,
    required this.whatsapp,
    required this.instagram,
    this.appleStore,
    this.googlePlay,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      phone: json['phone'],
      mobile: json['mobile'],
      twitter: json['twitter'],
      youtube: json['youtube'],
      facebook: json['facebook'],
      linkedin: json['linkedin'],
      telegram: json['telegram'],
      whatsapp: json['whatsapp'],
      instagram: json['instagram'],
      appleStore: json['apple_store'],
      googlePlay: json['google_play'],
    );
  }
}

class Setting {
  final String currency;
  final String mapKey;
  final String currencyIcon;
  final String currencyPosition;
  final String decimalFormat;
  final String phone;
  final String email;
  final String address1;
  final String? address2;
  final String city;
  final String state;
  final String zip;
  final String country;
  final int googleLogin;
  final int facebookLogin;
  final int guestCheckout;
  final int enableGa;
  final String gaId;
  final int enablePixel;
  final String? pixelId;
  final Tawk tawk;
  final String defaultState;
  final String defaultCountry;
  final int vendorRegistration;
  final int cookieBanner;

  Setting({
    required this.currency,
    required this.mapKey,
    required this.currencyIcon,
    required this.currencyPosition,
    required this.decimalFormat,
    required this.phone,
    required this.email,
    required this.address1,
    this.address2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.googleLogin,
    required this.facebookLogin,
    required this.guestCheckout,
    required this.enableGa,
    required this.gaId,
    required this.enablePixel,
    this.pixelId,
    required this.tawk,
    required this.defaultState,
    required this.defaultCountry,
    required this.vendorRegistration,
    required this.cookieBanner,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      currency: json['currency'],
      mapKey: json['map_key'],
      currencyIcon: json['currency_icon'],
      currencyPosition: json['currency_position'],
      decimalFormat: json['decimal_format'],
      phone: json['phone'],
      email: json['email'],
      address1: json['address_1'],
      address2: json['address_2'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
      googleLogin: json['google_login'],
      facebookLogin: json['facebook_login'],
      guestCheckout: json['guest_checkout'],
      enableGa: json['enable_ga'],
      gaId: json['ga_id'],
      enablePixel: json['enable_pixel'],
      pixelId: json['pixel_id'],
      tawk: Tawk.fromJson(json['tawk']),
      defaultState: json['default_state'],
      defaultCountry: json['default_country'],
      vendorRegistration: json['vendor_registration'],
      cookieBanner: json['cookie_banner'],
    );
  }
}

class Tawk {
  final int enabled;
  final String widgetId;
  final String propertyId;
  final String widgetIdEn;
  final String propertyIdEn;
  final int vendorEnabled;
  final String vendorWidgetId;
  final String vendorPropertyId;
  final String vendorWidgetIdEn;
  final String vendorPropertyIdEn;

  Tawk({
    required this.enabled,
    required this.widgetId,
    required this.propertyId,
    required this.widgetIdEn,
    required this.propertyIdEn,
    required this.vendorEnabled,
    required this.vendorWidgetId,
    required this.vendorPropertyId,
    required this.vendorWidgetIdEn,
    required this.vendorPropertyIdEn,
  });

  factory Tawk.fromJson(Map<String, dynamic> json) {
    return Tawk(
      enabled: json['enabled'],
      widgetId: json['widget_id'],
      propertyId: json['property_id'],
      widgetIdEn: json['widget_id_en'],
      propertyIdEn: json['property_id_en'],
      vendorEnabled: json['vendor_enabled'],
      vendorWidgetId: json['vendor_widget_id'],
      vendorPropertyId: json['vendor_property_id'],
      vendorWidgetIdEn: json['vendor_widget_id_en'],
      vendorPropertyIdEn: json['vendor_property_id_en'],
    );
  }
}


class Country {
  final int id;
  final String name;
  final String iso;

  Country({
    required this.id,
    required this.name,
    required this.iso,
  });

  // Factory constructor for creating a Country from JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      iso: json['iso'],
    );
  }

  
}
