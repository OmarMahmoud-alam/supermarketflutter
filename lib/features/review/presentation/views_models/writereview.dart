import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';

class WriteReviewController extends GetxController {
  TextEditingController commentcontroller = TextEditingController();
  double rate = 1;
  String? Product_id;

  void setRate(rating) {
    rate = rating;
  }

  Future<void> fetchReviews() async {
    try {
      var result = await DioHelper.fetchdata(
          url: "${EndPoints.getmyreview}/product.id", token: Apivar.sendtoken);
      if (result.statusCode == 200) {
      } else {
        // Handle error
        Get.log('Error: ${result.statusCode}');
      }
    } catch (e) {
      // Handle exception
      Get.log('Error: $e');
    }
  }

  Future<void> postreview() async {
    try {
      //if(commentcontroller.text==null)
      var result = await DioHelper.postData(
          url: EndPoints.postreview,
          token: Apivar.token,
          data: {
            {
              "product_id": "30",
              "rating": rate,
              "comment": commentcontroller.text
            }
          });
      if (result.statusCode == 200) {
        Get.snackbar("review", "revirew success");

        // print("성공");
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
}
