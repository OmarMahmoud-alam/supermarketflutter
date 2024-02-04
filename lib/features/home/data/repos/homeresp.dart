import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';
import 'package:supermarket/features/auth/data/models/logindata.dart';
import 'package:supermarket/features/home/data/models/homemodel.dart';

class HomeRespo {
  Future<Either<String, Homemodel>> gethomedata() async {
    final response =
        await DioHelper.fetchdata(url: EndPoints.home, token: Apivar.sendtoken);

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
