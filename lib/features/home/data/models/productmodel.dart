import 'package:supermarket/features/product/data/models/favouritemodel.dart';

class ProductModel {
  int id;
  bool isLoading = false;

  String name;
  String brand;
  String price;
  String type;
  bool favorite;
  int quantity;
  String? category;
  int? categoryId;
  String imageUrl;
  String? total;

  ProductModel(
      {required this.id,
      required this.name,
      required this.brand,
      required this.price,
      required this.type,
      required this.quantity,
      required this.category,
      this.favorite = false,
      required this.categoryId,
      required this.imageUrl,
      this.total});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        brand: json['brand'],
        price: json['price'],
        type: json['type'],
        quantity: json['quantity'],
        category: json['category'],
        favorite: json['favorite'] ?? false,
        categoryId: json['category_id'],
        imageUrl: json['image_url'],
        total: json['total'].toString());
  }

  factory ProductModel.fromfavourite(FavoriteItem item) {
    return ProductModel(
        id: item.id,
        name: item.name,
        brand: item.brand,
        price: item.price,
        type: item.type,
        quantity: item.quantity,
        category: null,
        favorite: true,
        categoryId: null,
        imageUrl: item.imageUrl,
        total: null);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'type': type,
      'quantity': quantity,
      'category': category,
      'category_id': categoryId,
      'image_url': imageUrl,
      'favorite': favorite,
    };
  }
}
