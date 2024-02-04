class Favouritemodel {
  late String status;
  late List<FavoriteItem> favorites;

  Favouritemodel({required this.status, required this.favorites});

  Favouritemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    favorites = [];

    json['favorites']
        .map((item) => favorites.add(FavoriteItem.fromJson(item)))
        .toList();
  }
}

class FavoriteItem {
  int id;
  String name;
  String brand;
  String price;
  String type;
  int quantity;
  String imageUrl;

  FavoriteItem({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.type,
    required this.quantity,
    required this.imageUrl,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
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
