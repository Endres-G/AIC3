class ProductVariationModel {
  final int? productId;
  final double price;
  final String colorName;
  final String colorHexCode;
  final String material;
  final double length;
  final double width;
  final double height;
  final int stock;
  final String image;

  ProductVariationModel({
    this.productId,
    required this.price,
    required this.colorName,
    required this.colorHexCode,
    required this.material,
    required this.length,
    required this.width,
    required this.height,
    required this.stock,
    required this.image,
  });

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      productId: json['productId'],
      price: _parseToDouble(json['price']),
      colorName: json['colorName'],
      colorHexCode: json['colorHexCode'],
      material: json['material'],
      length: _parseToDouble(json['length']),
      width: _parseToDouble(json['width']),
      height: _parseToDouble(json['height']),
      stock: json['stock'],
      image: json['image'],
    );
  }

  // Função auxiliar para tratar a conversão de String para Double
  static double _parseToDouble(dynamic value) {
    if (value is String) {
      // Tenta converter para double, se falhar retorna 0.0
      return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
    }
    if (value is num) {
      return value.toDouble();
    }
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'colorName': colorName,
      'colorHexCode': colorHexCode,
      'material': material,
      'length': length,
      'width': width,
      'height': height,
      'stock': stock,
      'image': image,
    };
  }
}
