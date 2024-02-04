import 'package:supermarket/features/home/data/models/productmodel.dart';

class CartModel {
  late List<ProductModel> cartItems;
  late double? total;

  CartModel({required this.cartItems, required this.total});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartItems = [];
    total = json['totalprice'];
    print(json['cart'].toString());

    json['cart'].map((e) {
      print(e.toString());
      cartItems.add(ProductModel.fromJson(e));
    }).toList();
  }
}
