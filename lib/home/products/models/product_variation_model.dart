class ProductVariationModel {
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
      price: json['price'].toDouble(),
      colorName: json['colorName'],
      colorHexCode: json['colorHexCode'],
      material: json['material'],
      length: json['length'].toDouble(),
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      stock: json['stock'],
      image: json['image'],
    );
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
