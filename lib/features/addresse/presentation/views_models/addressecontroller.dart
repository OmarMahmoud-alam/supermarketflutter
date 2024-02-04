import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/end_points.dart';

import 'package:supermarket/features/addresse/data/models/addressemodel.dart';
import 'package:supermarket/features/addresse/presentation/view/addaddresse.dart';

class Addressecontroller extends GetxController {
  List<AddressModel> addresselist = [];

  Future<void> fetchData() async {
    try {
      var result =
          await DioHelper.fetchdata(url: EndPoints.login, token: Apivar.sendtoken);
      if (result.statusCode == 200) {
        addresselist = (result.data['addresses'] as List)
            .map((item) => AddressModel.fromJson(item))
            .toList();
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

  void movetoaddaddresse() {
    Get.to(() => const AddAddresseView());
  }
}
