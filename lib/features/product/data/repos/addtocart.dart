import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';


class Addcartrepo {
  Future<Either<String, String>> addprojectcart(productid, int quantity) async {
    final response = await DioHelper.postData(
        token: Apivar.sendtoken,
        url: EndPoints.cart,
        data: {"product_id": productid, "quantity": quantity});

    try {
      if (response.statusCode == 200 &&
          (response.data['status'] == 'success' ||
              response.data['status'] == 200)) {
        print("Success LoginRepo");
        print(response);
        return const Right("success");
      } else {
        print(response);
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
