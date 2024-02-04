import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

import 'package:supermarket/features/product/presentation/view/productview.dart';

class ProductListController extends GetxController {
  List<ProductModel> products = [];

  Future<void> fetchData(id) async {
    try {
      var result = await DioHelper.fetchdata(
          url: EndPoints.productcategory,
          token: Apivar.sendtoken,
          query: {"category_id": id});
      print(55);
      if (result.statusCode == 200) {
        print(result.data);
        products = [];
        for (var element in result.data['data']) {
          products.add(ProductModel.fromJson(element));
        }
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

  void movetoproductdetails() {
    Get.to(() => ProductdetialsView());
  }
}
