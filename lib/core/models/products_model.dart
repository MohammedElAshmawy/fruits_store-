import '../entities/products_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String sellingCount;
  String? imageUrl;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.sellingCount,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? "",
      code: json['code'] ?? "",
      description: json['description'] ?? "",
      sellingCount: json['sellingCount'] ?? "",
      price: json['price'] ?? "",
      isFeatured: json['isFeatured'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
