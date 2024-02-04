import 'package:get/get.dart';

import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/features/cart/data/models/cartmodel.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

class MainCartController extends GetxController {
  CartModel? cart;

  Future<void> fetchData() async {
    try {
      var result = await DioHelper.fetchdata(
          url: EndPoints.cart, token: Apivar.sendtoken);
      if (result.statusCode == 200) {
        cart = CartModel.fromJson(result.data);
      } else {
        // Handle error if needed
        Get.log('Error: ${result.statusCode}');
        Get.snackbar('error', result.data.toString());
      }
    } catch (e) {
      Get.log('Error: $e');
      rethrow;
    }
  }

  Future<void> delete(ProductModel product) async {
    try {
      var result = await DioHelper.deletedata(
          url: '${EndPoints.cart}/${product.id}', token: Apivar.sendtoken);
      if (result.statusCode == 200 ||
          result.data["message"] ==
              "Product deleted from the cart successfully.") {
        cart!.cartItems.removeWhere((element) => element.id == product.id);
      } else {
        // Handle error if needed
        Get.log('Error: ${result.statusCode}');
        Get.snackbar('error', result.data.toString());
      }
    } catch (e) {
      Get.log('Error: $e');
      rethrow;
    }
    update();
  }
}
