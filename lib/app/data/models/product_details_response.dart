// product_response.dart
import 'productPrice.dart';
import 'productUnit.dart';


class ProductDetailsResponse {
  final int id;
  final String title;
  final EstDeliveryTime estDeliveryTime;
  final String description;
  final DefaultShippingAddress defaultShippingAddress;
  final String? inquireId;
  final String? offerInquireId;
  final String sku;
  final String created;
  final String updated;
  final List<ProductImage> image;
  final String thumbImage;
  final String firstThumbImage;
  final String status;
  final CategoryType category;
  final CategoryType subCategory;
  final CategoryType childCategory;
  final List<ProductPrice> productPrices;
  final ProductUnit productUnit;
  final ProductPackaging packaging;
  final ProductDimension productDimension;
  final ProductDiscount? productDiscount;
  final Vendor vendor;
  final bool isBuyable;
  final int minOrderQuantity;
  final String productBarcode;
  final bool isDangerous;
  final bool isAvailable;
  final int maxAllowedQuantity;
  final Brand brand;
  final StorageTemperature storageTemperature;
  final ProductOrigin productOrigin;
  final bool express;

  ProductDetailsResponse({
    required this.id,
    required this.title,
    required this.estDeliveryTime,
    required this.description,
    required this.defaultShippingAddress,
    this.inquireId,
    this.offerInquireId,
    required this.sku,
    required this.created,
    required this.updated,
    required this.image,
    required this.thumbImage,
    required this.firstThumbImage,
    required this.status,
    required this.category,
    required this.subCategory,
    required this.childCategory,
    required this.productPrices,
    required this.productUnit,
    required this.packaging,
    required this.productDimension,
    this.productDiscount,
    required this.vendor,
    required this.isBuyable,
    required this.minOrderQuantity,
    required this.productBarcode,
    required this.isDangerous,
    required this.isAvailable,
    required this.maxAllowedQuantity,
    required this.brand,
    required this.storageTemperature,
    required this.productOrigin,
    required this.express,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      estDeliveryTime: EstDeliveryTime.fromJson(json['est_delivery_time']),
      description: json['description'] ?? '',
      defaultShippingAddress: DefaultShippingAddress.fromJson(json['defaultShippingAddress']),
      inquireId: json['inquire_id'],
      offerInquireId: json['offer_inquire_id'],
      sku: json['sku'] ?? '',
      created: json['created'] ?? '',
      updated: json['updated'] ?? '',
      image: (json['image'] as List).map((e) => ProductImage.fromJson(e)).toList(),
      thumbImage: json['thumb_image'] ?? '',
      firstThumbImage: json['first_thumb_image'] ?? '',
      status: json['status'] ?? '',
      category: CategoryType.fromJson(json['category']),
      subCategory: CategoryType.fromJson(json['sub_category']),
      childCategory: CategoryType.fromJson(json['child_category']),
      productPrices: (json['product_prices'] as List).map((e) => ProductPrice.fromJson(e)).toList(),
      productUnit: ProductUnit.fromJson(json['product_unit']),
      packaging: ProductPackaging.fromJson(json['packaging']),
      productDimension: ProductDimension.fromJson(json['product_dimension']),
      productDiscount: json['product_discount'] != null ? ProductDiscount.fromJson(json['product_discount']) : null,
      vendor: Vendor.fromJson(json['vendor']),
      isBuyable: json['is_buyable'] ?? false,
      minOrderQuantity: json['minOrderQuantity']['min_quantity'] ?? 1,
      productBarcode: json['product_barcode']['name'] ?? '',
      isDangerous: json['is_dangerous'] ?? false,
      isAvailable: json['is_available'] ?? false,
      maxAllowedQuantity: json['maxAllowedQuantity'] ?? 999999,
      brand: Brand.fromJson(json['brand']),
      storageTemperature: StorageTemperature.fromJson(json['storage_temperature']),
      productOrigin: ProductOrigin.fromJson(json['product_origin']),
      express: json['express'] ?? false,
    );
  }
}

class EstDeliveryTime {
  final String defaultPrice;
  final String shippingByVendor;
  final String dateTime;
  final int estHours;
  final int estDays;
  final String averageLeadTime;
  final String estDateTime;

  EstDeliveryTime({
    required this.defaultPrice,
    required this.shippingByVendor,
    required this.dateTime,
    required this.estHours,
    required this.estDays,
    required this.averageLeadTime,
    required this.estDateTime,
  });

  factory EstDeliveryTime.fromJson(Map<String, dynamic> json) {
    return EstDeliveryTime(
      defaultPrice: json['default_price'] ?? '',
      shippingByVendor: json['shipping_by_vendor'] ?? '',
      dateTime: json['date_time'] ?? '',
      estHours: json['est_hours'] ?? 0,
      estDays: json['est_days'] ?? 0,
      averageLeadTime: json['average_lead_time'] ?? '',
      estDateTime: json['est_date_time'] ?? '',
    );
  }
}

class DefaultShippingAddress {
  final String countryIso;
  final String country;

  DefaultShippingAddress({
    required this.countryIso,
    required this.country,
  });

  factory DefaultShippingAddress.fromJson(Map<String, dynamic> json) {
    return DefaultShippingAddress(
      countryIso: json['country_iso'] ?? '',
      country: json['country'] ?? '',
    );
  }
}

class ProductImage {
  final String id;
  final String fileName;
  final String uploadTime;
  final String image;
  final String url;

  ProductImage({
    required this.id,
    required this.fileName,
    required this.uploadTime,
    required this.image,
    required this.url,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ?? '',
      fileName: json['file_name'] ?? '',
      uploadTime: json['upload_time'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
    );
  }
}


class ProductPackaging {
  final int id;
  final int productId;
  final String size;
  final String numberOfCarton;
  final String averageLeadTime;
  final TransportationMode transportationMode;
  final SizeUnit sizeUnit;

  ProductPackaging({
    required this.id,
    required this.productId,
    required this.size,
    required this.numberOfCarton,
    required this.averageLeadTime,
    required this.transportationMode,
    required this.sizeUnit,
  });

  factory ProductPackaging.fromJson(Map<String, dynamic> json) {
    return ProductPackaging(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      size: json['size'] ?? '',
      numberOfCarton: json['number_of_carton'] ?? '',
      averageLeadTime: json['average_lead_time'] ?? '',
      transportationMode: TransportationMode.fromJson(json['transportation_mode']),
      sizeUnit: SizeUnit.fromJson(json['size_unit']),
    );
  }
}

class TransportationMode {
  final int id;
  final int status;
  final String name;

  TransportationMode({
    required this.id,
    required this.status,
    required this.name,
  });

  factory TransportationMode.fromJson(Map<String, dynamic> json) {
    return TransportationMode(
      id: json['id'] ?? 0,
      status: json['status'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class SizeUnit {
  final int id;
  final String name;
  final String unitType;
  final String unitCode;

  SizeUnit({
    required this.id,
    required this.name,
    required this.unitType,
    required this.unitCode,
  });

  factory SizeUnit.fromJson(Map<String, dynamic> json) {
    return SizeUnit(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      unitType: json['unit_type'] ?? '',
      unitCode: json['unit_code'] ?? '',
    );
  }
}

class ProductDimension {
  final int id;
  final int productId;
  final double weight;
  final DimensionUnit weightUnit;
  final double height;
  final double length;
  final double width;
  final DimensionUnit dimensionUnit;

  ProductDimension({
    required this.id,
    required this.productId,
    required this.weight,
    required this.weightUnit,
    required this.height,
    required this.length,
    required this.width,
    required this.dimensionUnit,
  });

  factory ProductDimension.fromJson(Map<String, dynamic> json) {
    return ProductDimension(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      weight: json['weight'] ?? 0.0,
      weightUnit: DimensionUnit.fromJson(json['weight_unit']),
      height: json['height'] ?? 0.0,
      length: json['length'] ?? 0.0,
      width: json['width'] ?? 0.0,
      dimensionUnit: DimensionUnit.fromJson(json['dimension_unit']),
    );
  }
}

class DimensionUnit {
  final int id;
  final String name;

  DimensionUnit({
    required this.id,
    required this.name,
  });

  factory DimensionUnit.fromJson(Map<String, dynamic> json) {
    return DimensionUnit(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class ProductDiscount {
  final double discountAmount;
  final int discountPercent;
  final String discountType;

  ProductDiscount({
    required this.discountAmount,
    required this.discountPercent,
    required this.discountType,
  });

  factory ProductDiscount.fromJson(Map<String, dynamic> json) {
    return ProductDiscount(
      discountAmount: json['discount_amount'] ?? 0.0,
      discountPercent: json['discount_percent'] ?? 0,
      discountType: json['discount_type'] ?? '',
    );
  }
}

class Vendor {
  final int id;
  final String name;
  final String contactInfo;

  Vendor({
    required this.id,
    required this.name,
    required this.contactInfo,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      contactInfo: json['contact_info'] ?? '',
    );
  }
}

class CategoryType {
  final int id;
  final String name;

  CategoryType({
    required this.id,
    required this.name,
  });

  factory CategoryType.fromJson(Map<String, dynamic> json) {
    return CategoryType(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class Brand {
  final int id;
  final String name;

  Brand({
    required this.id,
    required this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class StorageTemperature {
  final String name;
  final int id;

  StorageTemperature({
    required this.name,
    required this.id,
  });

  factory StorageTemperature.fromJson(Map<String, dynamic> json) {
    return StorageTemperature(
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}

class ProductOrigin {
  final String country;
  final String countryIso;

  ProductOrigin({
    required this.country,
    required this.countryIso,
  });

  factory ProductOrigin.fromJson(Map<String, dynamic> json) {
    return ProductOrigin(
      country: json['country'] ?? '',
      countryIso: json['country_iso'] ?? '',
    );
  }
}
