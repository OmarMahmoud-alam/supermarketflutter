import 'package:get/get.dart';

import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';

class ProfileController extends GetxController {
  Future<void> fetchData() async {
    try {
      var result = await DioHelper.fetchdata(
          url: EndPoints.login, token: Apivar.sendtoken);
      if (result.statusCode == 200) {
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
