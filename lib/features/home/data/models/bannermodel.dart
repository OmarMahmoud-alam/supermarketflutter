class BannerModel {
  int id;
  String alt;
  String image;

  BannerModel({
    required this.id,
    required this.alt,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      alt: json['alt'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alt': alt,
      'image': image,
    };
  }
}
