import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/common_widget/custom_snackbar.dart';
import 'package:supermarket/features/home/data/models/homemodel.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

import 'package:supermarket/features/home/data/repos/homeresp.dart';
import 'package:supermarket/features/product/data/repos/favourite.dart';

class HomeController extends GetxController {
  bool isloadingerror = false;
  bool isgettingdata = true;
  Homemodel? homedata;

  Future<void> fetchHomeData() async {
    var homerespone = HomeRespo();
    var result = await homerespone.gethomedata();
    result.fold(
      (err) {
        print("$err  sss");
        showSnackBar(err);
        isgettingdata = false;
        isloadingerror = true;
        print("something wrong1");

        update();
      },
      (res) async {
        print("something wrong222");
        isgettingdata = false;
        homedata = res;
        update();
      },
    );
    print(5);
  }

  Future<void> changefavouity(ProductModel product) async {
    product.isLoading = true;
    update();
    if (product.favorite) {
      var result = await Favouriterepo.removefromfavorite(product.id);
      result.fold(
          (error) =>
              Get.snackbar('Error', error, backgroundColor: Colors.redAccent),
          (res) {
        product.favorite = false;
        Get.snackbar('Success', res, backgroundColor: Colors.green);
      });
    } else {
      var result = await Favouriterepo.addtofavorite(product.id);
      result.fold(
          (error) =>
              Get.snackbar('Error', error, backgroundColor: Colors.redAccent),
          (res) {
        product.favorite = true;
        Get.snackbar('Sucess', res, backgroundColor: Colors.green);
      });
    }
    product.isLoading = false;
    update();
  }

//this part for making the icon in productwidget by circle indcator

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    update(); // Notify listeners that the state has changed
  }
}
