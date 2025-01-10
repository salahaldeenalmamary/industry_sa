class ProductPrice {
  final int unitPrice;
  final int sellingPrice;
  final int discountPercent;
  final int id;
  final int quantity;

  ProductPrice({
    required this.unitPrice,
    required this.sellingPrice,
    required this.discountPercent,
    required this.id,
    required this.quantity,
  });

  factory ProductPrice.fromJson(Map<String, dynamic> json) {
    return ProductPrice(
      unitPrice: json['unit_price'],
      sellingPrice: json['selling_price'],
      discountPercent: json['discount_percent'],
      id: json['id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_price': unitPrice,
      'selling_price': sellingPrice,
      'discount_percent': discountPercent,
      'id': id,
      'quantity': quantity,
    };
  }
}
