import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/auth/presentation/view/screen/login.dart';
import 'package:supermarket/features/auth/presentation/view/widget/customtextfield.dart';
import 'package:supermarket/core/common/utils/validation_functions.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/auth/presentation/views_models/registercontroller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Image.asset('assest/image/logo1.png'),
          const Gap(25),
          const Text('Welcome to Grocify !!',
              style: AppTextStyles.maintextStyle),
          const Gap(15),
          Text('Register to Continue', style: AppTextStyles.seconadytextstyle),
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custominputfield(
              controller: registerController.nameController,
              prefixicon: const Icon(
                Icons.person,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Name',
              validator: (s) {
                if (s == null || s == "") {
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
              controller: registerController.emailController,
              prefixicon: const Icon(
                Icons.email,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Email ',
              validator: (s) {
                if (s == null || s == "") {
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
              controller: registerController.passwordController,
              prefixicon: const Icon(
                Icons.lock,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Password',
              isPassword: true,
              /*Icon(registercontroller.ispassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined)*/
              validator: (s) {
                if (isValidPassword(s)) {
                  return 'pls enter valid password ';
                }
                return null;
              },
            ),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custominputfield(
              controller: registerController.confirmController,
              prefixicon: const Icon(
                Icons.lock,
              ),
              textInputType: TextInputType.emailAddress,
              hintText: 'Re-type password',
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
              child: Text("Sign In",
                  style: TextStyle(
                    fontSize: 18,
                    color: TColor.white,
                    fontWeight: FontWeight.w700,
                  )),
              onPressed: () {},
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("already Have account",
                  style: AppTextStyles.seconadytextstyle14),
              TextButton(
                onPressed: () => Get.to(() => const Login()),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    //minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: Text(" signin",
                    style: AppTextStyles.seconadytextstyle14
                        .copyWith(color: TColor.primarybuttontext)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Forget Password? Click",
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
