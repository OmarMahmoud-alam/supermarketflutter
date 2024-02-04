/*class Favouritemodel {
  late List<FavoureProductmodel> product;
  Favouritemodel({required this.product});
  Favouritemodel.fromJson(Map<String, dynamic> json) {
    product = [];
    if (json['product'] != null) {
      json['product'].forEach((v) {
        product.add(FavoureProductmodel.fromJson(v));
      });
    }
  }
}

class FavoureProductmodel {
  int id;
  String name;
  String brand;
  String price;
  String? type;
  int? quantity;
  String? imageUrl;

  FavoureProductmodel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    this.type,
    this.quantity,
    this.imageUrl,
  });

  factory FavoureProductmodel.fromJson(Map<String, dynamic> json) {
    return FavoureProductmodel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      type: json['type'],
      quantity: json['quantity'],
      imageUrl: json['image_url'],
    );
  }
}
*/