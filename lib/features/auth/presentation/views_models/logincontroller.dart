import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/common_widget/custom_snackbar.dart';

import 'package:supermarket/core/common/utils/shered_helper.dart';
import 'package:supermarket/features/auth/data/repos/loginresponse.dart';

import 'package:supermarket/features/auth/presentation/view/screen/otpview.dart';
import 'package:supermarket/features/auth/presentation/view/screen/register.dart';
import 'package:supermarket/features/bottonnavigatorbar/bottomnavigate.dart';
import 'package:supermarket/features/home/presentation/view/home.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    final loginRepo = LoginRepo();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isloginLoad = false;

  Future<void> loginWithEmail() async {
    isloginLoad = true;
    update();
    Get.log("Login With Email");

    if (!emailController.text.isEmail) {
      showSnackBar("Email is in wronge formate", popPage: true);
      isloginLoad = false;
      update();
      return;
    }

    if (passwordController.text.length < 5) {
      showSnackBar(
        "Password length must be more than 8",
      );
      isloginLoad = false;

      return;
    }
    update();
    final res =
        await loginRepo.login(emailController.text, passwordController.text);
    res.fold(
      (err) {
        showSnackBar(err);
        isloginLoad = false;

        update();
      },
      (res) async {
        await Prefs.setString('token', res.accessToken.toString());
        isloginLoad = false;
        update();
        if (res.verifyAt != null) {
          Apivar.token = res.accessToken;
          await Prefs.setString('token', Apivar.token!);

          Get.to(() => BottomNavScreen());
        } else {
          Apivar.token = res.accessToken;

          Get.to(() => Otpview(
                email: emailController.text.trim(),
              ));
        }

        // await Prefs.setString('userId', res.id.toString());
        /*await CacheHelper.saveData(key: 'userName', value: res.data.name);
        await CacheHelper.saveData(key: 'photo', value: res.data.photo);
        await CacheHelper.saveData(key: 'phone', value: res.data.phone);
        await CacheHelper.saveData(key: 'login', value: true);
        print('-----------------');
        print(DioHelper.getData(key: 'userId'));
        print(DioHelper.getData(key: 'userName'));
        log('token ========== ${CacheHelper.getData(key: 'token')}');
        print('-----------------');
        MagicRouter.navigateAndPopAll(const AfterSplashView());*/
      },
    );

    /* if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
    }
    try {
      isloginLoad = true;
      update();
      if (formKey.currentState!.validate()) {
         if (emailController.text.length < 10) {
      showSnackBar(
        LocaleKeys.pleaseProvideAValidEmailAddress.tr(),
      );
      return;
    }

    if (passwordController.text.length < 8) {
      showSnackBar(
        LocaleKeys.pleaseProvideAValidPasswordShouldGreaterThan8Character.tr(),
      );
      return;
    }
    emit(LoginLoading());
    final res =
        await loginRepo.login(emailController.text, passwordController.text);
    res.fold(
      (err) {
        showSnackBar(AppStorage.getLang == 'en'
            ? err
            : 'Please check your data again, you have an error in the data');
update();
      },
      (res) async {
update();
        await CacheHelper.saveData(key: 'userId', value: res.data.id);
        await CacheHelper.saveData(key: 'userName', value: res.data.name);
        await CacheHelper.saveData(key: 'photo', value: res.data.photo);
        await CacheHelper.saveData(key: 'phone', value: res.data.phone);
        await CacheHelper.saveData(key: 'login', value: true);
        print('-----------------');
        print(CacheHelper.getData(key: 'userId'));
        print(CacheHelper.getData(key: 'userName'));
        log('token ========== ${CacheHelper.getData(key: 'token')}');
        print('-----------------');
        MagicRouter.navigateAndPopAll(const AfterSplashView());
      },
    );
  }
        var result = await DioHelper.postData(url: EndPoints.login, data: {
          "email": emailController.text.trim(),
          "password": passwordController.text
        });
        if (result.data['message'] == 'success') {
          Apivar.token = result.data['accessToken'];
          if (result.data["verify_at"] != null) {
            await Prefs.setString('token', Apivar.token!);

            Get.offAllNamed(
              "/home",
            );
          } else {
            Get.to(() => Otpview(
                  email: emailController.text.toString(),
                ));
          }
        } else {
          Get.snackbar('error', result.data.toString(),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      }
      isloginLoad = false;

      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
      );
    }
    isloginLoad = false;
    update();*/
  }

  void movetoRgisteview() {
    Get.to(() => const RegisterView());
  }
}
