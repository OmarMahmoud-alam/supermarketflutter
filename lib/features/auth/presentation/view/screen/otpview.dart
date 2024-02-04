import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'package:supermarket/core/common/app_strings.dart';
import 'package:supermarket/core/common/utils/dio_helper.dart';
import 'package:supermarket/core/common/utils/shered_helper.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/home/presentation/view/home.dart';

class Otpview extends StatefulWidget {
  final String email;

  const Otpview({super.key, required this.email});

  @override
  State<Otpview> createState() => _OtpviewState();
}

class _OtpviewState extends State<Otpview> {
  final otpController = OtpFieldController();
  String otp = "";
  bool isverifyload = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Gap(20),
            Image.asset('assest/image/otpimage.png'),
            const Gap(25),
            const Text(
              "Enter Verification Code",
              style: AppTextStyles.textmedium20,
            ),
            Text("We have sent email to:",
                style: AppTextStyles.seconadytextstyle),
            Text(maskEmail(widget.email), style: AppTextStyles.textbold16),
            const Gap(15),
            OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: TColor.inputotpcolor,
                ),
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {},
                onCompleted: (pin) {
                  otp = pin;
                }),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isverifyload = true;
                  });
                  if (otp.length < 6) {
                    Get.snackbar('otp', 'complete otp pls');
                  } else {
                    Get.log(widget.email);
                    Get.log(otp);
                    var result = await DioHelper.postData(
                        url: 'verifiedby/otp',
                        token: Apivar.sendtoken,
                        data: {"email": widget.email, "otp": int.parse(otp)});
                    if (result.data['code'] == 1) {
                      Get.snackbar('email notification', "email is verified");
                      await Prefs.setString('token', Apivar.token!);
                      Get.to(() => HomeView());
                    } else {
                      setState(() {
                        isverifyload = false;
                      });
                      Get.snackbar('otp', result.data.toString());
                    }
                  }
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(TColor.green401),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: isverifyload
                      ? const CircularProgressIndicator()
                      : Text(
                          'Next',
                          style: AppTextStyles.textmedium20
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                ),
              ),
            )

            //Text("Please enter the OTP sent to ${widget.email}"),
          ]),
        ));
  }

  String maskEmail(String email) {
    if (email.isEmpty) {
      return '';
    }

    String firstTwoChars = email.substring(0, 3);
    String maskedChars = '*' * (email.length - 3);

    return '$firstTwoChars$maskedChars';
  }
}
