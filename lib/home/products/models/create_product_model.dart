import 'package:aic_lll/home/products/models/product_variation_model.dart';

class ProductModel {
  final int factoryId;
  final String name;
  final String description;
  final int categoryId;
  final String status;
  final List<ProductVariationModel> variations;

  ProductModel({
    required this.factoryId,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.status,
    required this.variations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      factoryId: json['factoryId'],
      name: json['name'],
      description: json['description'],
      categoryId: json['categoryId'],
      status: json['status'],
      variations: (json['variations'] as List)
          .map((item) => ProductVariationModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'factoryId': factoryId,
      'name': name,
      'description': description,
      'categoryId': categoryId,
      'status': status,
      'variations': variations.map((item) => item.toJson()).toList(),
    };
  }
}
