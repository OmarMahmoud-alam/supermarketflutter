import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';
import 'package:supermarket/features/auth/data/models/userreviewmodel.dart';

class RegisterResponse {
  Future<Either<String, String>> registe(
      String email, String password, name) async {
    final response = await DioHelper.postData(
        url: EndPoints.registe, data: {"email": email, "password": password});

    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        print("Success LoginRepo");
        print(response);
        return Right(jsonDecode(response.toString())['accessToken']);
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
