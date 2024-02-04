import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';
import 'package:supermarket/features/auth/data/models/logindata.dart';
import 'package:supermarket/features/auth/data/models/userreviewmodel.dart';

class LoginRepo {
  Future<Either<String, LoginUserdata>> login(
      String email, String password) async {
    try {
      final response = await DioHelper.postData(
          url: EndPoints.login, data: {"email": email, "password": password});

      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success LoginRepo");
        print(response);
        return Right(LoginUserdata.fromJson(jsonDecode(response.toString())));
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
