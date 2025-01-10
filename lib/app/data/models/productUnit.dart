
class ProductUnit {
  final int id;
  final String name;
  final dynamic unitType;

  ProductUnit({
    required this.id,
    required this.name,
    this.unitType,
  });

  factory ProductUnit.fromJson(Map<String, dynamic> json) {
    return ProductUnit(
      id: json['id'],
      name: json['name'],
      unitType: json['unit_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'unit_type': unitType,
    };
  }
}