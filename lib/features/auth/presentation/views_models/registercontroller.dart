import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/common_widget/custom_snackbar.dart';

import 'package:supermarket/core/common/utils/validation_functions.dart';
import 'package:supermarket/features/auth/data/repos/registeresponse.dart';

import 'package:supermarket/features/auth/presentation/view/screen/login.dart';
import 'package:supermarket/features/auth/presentation/view/screen/otpview.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isregisterLoad = false;

  Future<void> registerWithEmail() async {
    final registeresp = RegisterResponse();

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      Get.snackbar(
        'login error',
        'Email or password is empity',
        backgroundColor: Colors.red,
      );
    } else if (isEmail(emailController.text)) {
      Get.snackbar(
        'login error',
        'Email is wrong formula ',
        backgroundColor: Colors.red,
      );
    } else if (passwordController.text != confirmController.text) {
      Get.snackbar(
        'login error',
        'password not same  ',
        backgroundColor: Colors.red,
      );
    }
    try {
      isregisterLoad = true;
      update();
      if (formKey.currentState!.validate()) {
        var result = await registeresp.registe(emailController.text.trim(),
            passwordController.text, nameController.text.trim());
        result.fold((err) {
          showSnackBar(err);
          isregisterLoad = false;

          update();
        }, (res) async {
          Apivar.token = res;
          Get.to(() => Otpview(
                email: emailController.text.trim(),
              ));
          isregisterLoad = false;

          update();
        });
      }
      isregisterLoad = false;

      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
      );
    }
    isregisterLoad = false;
    update();
  }

  void movetologinview() {
    Get.to(() => const Login());
  }
}
