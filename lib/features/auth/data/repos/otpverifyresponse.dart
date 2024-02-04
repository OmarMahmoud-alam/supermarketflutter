import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';
import 'package:supermarket/core/common/utils/error_model.dart';


class OtpRepo {
  Future<Either<String, String>> verfyemail(String email, String otp) async {
    final response = await DioHelper.postData(
        url: EndPoints.emailverfy,
        token: Apivar.sendtoken,
        data: {"email": email, "otp": int.parse(otp)});

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
