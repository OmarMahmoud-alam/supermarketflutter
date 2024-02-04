import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';
import 'package:supermarket/features/home/data/models/favouritemodel.dart';
import 'package:supermarket/features/product/data/models/favouritemodel.dart';

class Favouriterepo {
  static Future<Either<String, Favouritemodel>> fetchdata() async {
    final response = await DioHelper.fetchdata(
      token: Apivar.sendtoken,
      url: EndPoints.getfavourite,
    );

    try {
      if (response.statusCode == 200 &&
          (response.data['status'] == 'success' ||
              response.data['status'] == 200)) {
        print("Success LoginRepo");
        print(response);
        return Right(Favouritemodel.fromJson(response.data));
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

  static Future<Either<String, String>> addtofavorite(productid) async {
    final response = await DioHelper.postData(
        token: Apivar.sendtoken,
        url: EndPoints.addfavourite,
        data: {"product_id": productid});

    try {
      if (response.statusCode == 200 &&
          (response.data['status'] == 'success' ||
              response.data['status'] == 200)) {
        print("Success LoginRepo");
        print(response);
        return const Right("The product has been Added Success to favourite");
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

  static Future<Either<String, String>> removefromfavorite(productid) async {
    final response = await DioHelper.deletedata(
        token: Apivar.sendtoken,
        url: EndPoints.deletefavourite,
        query: {"product_id": productid});

    try {
      if (response.statusCode == 200 &&
          (response.data['status'] == 'success' ||
              response.data['status'] == 200)) {
        print("Success LoginRepo");
        print(response);
        return const Right(
            "The product has been Removed Success from favourite");
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
