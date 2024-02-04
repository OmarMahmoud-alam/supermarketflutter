import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/main_colors.dart';


class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/AlertIcon.png'),
            const Gap(10),
            const Text(
              'Confirmation',
            
            ),
            const Gap(10),
            const SizedBox(
              width: 220,
              child: Text(
                'Are you sure wanna delete your account ',
                textAlign: TextAlign.center,
               
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: () {
                // Get.to(() => const HomeView());
              },
              child: Container(
                // margin: const EdgeInsets.all(10),
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                  /*border: Border.all(
                    color: TColor.offwhite, // Specify the color of the border
                    width: 2.0, // Specify the width of the border
                  ),*/
                ),
                child: const Center(
                    child: Text(
                  'Delete ',
                
                )),
              ),
            ),
            const Gap(10),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                // margin: const EdgeInsets.all(10),
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: TColor.offwhite, // Specify the color of the border
                    width: 1.5, // Specify the width of the border
                  ),
                ),
                child: const Center(
                    child: Text(
                  'cancel ',
               
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
