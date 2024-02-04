import 'package:supermarket/features/home/data/models/favouritemodel.dart';
import 'package:supermarket/features/home/data/models/homemodel.dart';

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';
import 'package:supermarket/features/product/data/models/favouritemodel.dart';

class Favourite {
  Future<Either<String, Favouritemodel>> getfavourite() async {
    final response = await DioHelper.fetchdata(
        url: EndPoints.getfavourite, token: Apivar.sendtoken);

    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success LoginRepo");
        print(response);
        return Right(Favouritemodel.fromJson(jsonDecode(response.toString())));
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

  Future<Either<String, String>> postfavorite(id) async {
    final response = await DioHelper.postData(
        url: EndPoints.addfavourite,
        token: Apivar.sendtoken,
        data: {
          "product_id": id,
        });

    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print(response);
        return Right(response.data["message"].toString());
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

  Future<Either<String, Homemodel>> deletefavourite(id) async {
    final response = await DioHelper.deletedata(
        url: EndPoints.deletefavourite,
        token: Apivar.sendtoken,
        query: {
          "product_id": id,
        });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success LoginRepo");
        print(response);
        return Right(Homemodel.fromJson(jsonDecode(response.toString())));
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
