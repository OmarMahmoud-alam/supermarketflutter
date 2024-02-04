import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addaddressecontroller extends GetxController {
  TextEditingController countrytext = TextEditingController();
  TextEditingController streetcontroller = TextEditingController();
  TextEditingController streetcontroller2 = TextEditingController();
  TextEditingController stateOrRegioncontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  void postnewaddresse() {
    if (countrytext.text.isEmpty ||
        streetcontroller.text.isEmpty ||
        stateOrRegioncontroller.text.isEmpty ||
        citycontroller.text.isEmpty ||
        phonecontroller.text.isEmpty) {
      Get.defaultDialog(content: const Text('please add all the reqired'));
      
    }
  }
}
