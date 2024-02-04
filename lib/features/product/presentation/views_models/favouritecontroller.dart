import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';
import 'package:supermarket/features/product/data/models/favouritemodel.dart';
import 'package:supermarket/features/product/data/models/productdetailsmodel.dart';
import 'package:supermarket/features/product/data/repos/favourite.dart';
import 'package:supermarket/features/product/data/repos/addtocart.dart';
import 'package:supermarket/features/product/presentation/view/productview.dart';
import 'package:supermarket/features/product/presentation/view/widget/favouriteproductwidget.dart';
import 'package:supermarket/features/product/presentation/view/widget/removeanimateditem.dart';

class Favouritecontroller extends GetxController {
  List<FavoriteItem>? favouriteproduct; // The observable product
  // Favouriterepo favouriterepo = Favouriterepo();
  bool favoriteloading = false;

  final mylistkey = GlobalKey<AnimatedListState>();
  Future<void> fetchProduct() async {
    var res = await Favouriterepo.fetchdata();
    res.fold((error) {
      Get.snackbar('Error', error);
    }, (response) {
      favouriteproduct = response.favorites;
    });
  }

  Future<void> delete(FavoriteItem product, index) async {
    var result = await Favouriterepo.removefromfavorite(product.id);
    result.fold(
        (error) =>
            Get.snackbar('Error', error, backgroundColor: Colors.redAccent),
        (res) {
      favouriteproduct?.removeWhere((item) => item.id == product.id);
      Get.snackbar('Success', res, backgroundColor: Colors.green);
    });
    mylistkey.currentState!.removeItem(index, ((context, animation) {
      return RemoveFavouriteproductitem(
        product: product,
        index: index,
        animation: animation,
      );
    }));
    update();
  }

  void movetodetails(FavoriteItem item) {
    Get.to(() => ProductdetialsView(),
        arguments: ProductModel.fromfavourite(item));
  }
}
