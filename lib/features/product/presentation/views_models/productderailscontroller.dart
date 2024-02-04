import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/features/product/data/models/productdetailsmodel.dart';
import 'package:supermarket/features/product/data/repos/favourite.dart';
import 'package:supermarket/features/product/data/repos/addtocart.dart';

class ProductController extends GetxController {
  Productdetails? product; // The observable product
  RxInt number = 1.obs;
  Addcartrepo cartrepo = Addcartrepo();
  // Favouriterepo favouriterepo = Favouriterepo();
  bool favoriteloading = false;
  Future<void> fetchProductDetails(int productId) async {
    try {
      print("${productId}mylinnnn");
      var result = await DioHelper.fetchdata(
        url: '${EndPoints.productDetail}/$productId',
        token: Apivar.sendtoken,
      );
      if (result.statusCode == 200) {
        print(result.data['data']);
        // Convert the JSON response to a Product object
        product = Productdetails.fromJson(result.data['data']);
      } else {
        Get.log('Error: ${result.statusCode}');
        // Handle the error as needed
      }
    } catch (e) {
      Get.log('Error: $e');
      // Handle the error as needed
    }
  }

  Future<void> addtocart() async {
    var result = await cartrepo.addprojectcart(product!.id, number.value);
    result.fold(
        (error) => Get.snackbar('Add to cart', error,
            backgroundColor: Colors.redAccent),
        (res) => Get.snackbar('Add to cart', 'success',
            backgroundColor: Colors.green));
  }

  Future<void> changefavouity() async {
    favoriteloading = true;
    update();
    if (product!.isFavorite) {
      var result = await Favouriterepo.removefromfavorite(product!.id);
      result.fold(
          (error) =>
              Get.snackbar('Error', error, backgroundColor: Colors.redAccent),
          (res) {
        product!.isFavorite = false;
        Get.snackbar('Success', res, backgroundColor: Colors.green);
      });
    } else {
      var result = await Favouriterepo.addtofavorite(product!.id);
      result.fold(
          (error) =>
              Get.snackbar('Error', error, backgroundColor: Colors.redAccent),
          (res) {
        product!.isFavorite = true;
        Get.snackbar('Sucess', res, backgroundColor: Colors.green);
      });
    }
    favoriteloading = false;
    update();
  }
}
