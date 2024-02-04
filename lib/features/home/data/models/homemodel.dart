import 'package:supermarket/features/home/data/models/bannermodel.dart';
import 'package:supermarket/features/home/data/models/categorymdel.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

class Homemodel {
  String? status;

  late List<BannerModel> banners;
  late List<CategoryModel> categories;
  late List<ProductModel> products;

  Homemodel({
    this.status,
    required this.banners,
    required this.categories,
    required this.products,
  });

  Homemodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    banners = <BannerModel>[];
    categories = <CategoryModel>[];
    products = <ProductModel>[];
    print(33);
    for (var banner in json['banner']) {
      banners.add(BannerModel.fromJson(banner));
    }
    print(44);

    for (var category in json['category']) {
      categories.add(CategoryModel.fromJson(category));
    }
    print(55);

    for (var product in json['product']) {
      products.add(ProductModel.fromJson(product));
    }
    print(66);
    /*categories = (json['category'] as List)
        .map((item) => CategoryModel.fromJson(item))
        .toList();
    products = (json['product'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();*/
  }
}
