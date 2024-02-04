import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:gap/gap.dart';
import 'package:supermarket/features/auth/presentation/view/widget/customtextfield.dart';
import 'package:supermarket/core/common/utils/validation_functions.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';

import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/auth/presentation/views_models/logincontroller.dart';
import 'package:supermarket/generated/locale_keys.g.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const Gap(55),
          Image.asset('assest/image/logo1.png'),
          const Gap(25),
          const Text(
            'Welcome to Grocify !!',
            style: AppTextStyles.maintextStyle,
          ),
          const Gap(8),
          const Text(
            'Login to Continue',
            style: AppTextStyles.seconadytextstyle,
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custominputfield(
              controller: loginController.emailController,
              prefixicon: const Icon(
                Icons.email,
                // color: TColor.primaryborder,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Email Addresse',
              validator: (s) {
                if (s == null || !s.isEmail) {
                  return 'can\'t be empty ';
                }
                return null;
              },
            ),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custominputfield(
              controller: loginController.passwordController,
              prefixicon: const Icon(
                Icons.lock,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Password',
              isPassword: true,
              validator: (s) {
                if (isValidPassword(s)) {
                  return 'pls enter valid password ';
                }
                return null;
              },
            ),
          ),
          const Gap(40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 57,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: TColor.primarybutton,
                  foregroundColor: TColor.white),
              child: GetBuilder<LoginController>(
                builder: (_) => (loginController.isloginLoad)
                    ? const CircularProgressIndicator()
                    : Text("Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          color: TColor.white,
                          fontWeight: FontWeight.w700,
                        )),
              ),
              onPressed: () => loginController.loginWithEmail(),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  LocaleKeys.donthaveaccount
                      .tr(), //"Don’t have account? Click3",
                  style: const TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
              TextButton(
                onPressed: () {
                  loginController.movetoRgisteview();
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    //minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: Text(" Register",
                    style: TextStyle(
                      color: TColor.primarybuttontext,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Forget Password? Click",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    //minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                onPressed: () {},
                child: Text(" Reset ",
                    style: TextStyle(
                      fontSize: 14,
                      color: TColor.primarybuttontext,
                      fontWeight: FontWeight.w700,
                    )),
              )
            ],
          )
        ],
      ))),
    );
  }
}
