import 'package:aic_lll/home/products/models/product_variation_model.dart';

class ProductModel {
  final int factoryId;
  final String name;
  final String description;
  final int categoryId;
  final String status;
  final DateTime? dateCreated;
  final DateTime? dateUpdated;
  final List<ProductVariationModel> variations;

  ProductModel({
    required this.factoryId,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.status,
    required this.variations,
    this.dateCreated,
    this.dateUpdated,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      factoryId: json['factoryId'],
      name: json['name'],
      description: json['description'],
      categoryId: json['categoryId'],
      status: json['status'],
      dateCreated: DateTime.parse(json['dateCreated']),
      dateUpdated: DateTime.parse(json['dateUpdated']),
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
