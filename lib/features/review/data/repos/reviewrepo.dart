import 'package:supermarket/features/review/data/models/reviewmode.dart';
import 'package:supermarket/features/home/data/models/homemodel.dart';

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';

class Review {
  Future<Either<String, ReviewData>> getreview($id) async {
    final response = await DioHelper.fetchdata(
        url: '${EndPoints.getreview}/$id', token: Apivar.sendtoken);

    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print(response);
        return Right(ReviewData.fromJson(jsonDecode(response.toString())));
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

  Future<Either<String, String>> postreview(id, rating, {comment}) async {
    final response = await DioHelper.postData(
        url: EndPoints.addfavourite,
        token: Apivar.sendtoken,
        data: {
          "product_id": id,
          "rating": "4",
          if (comment != null) "comment": comment
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
}
