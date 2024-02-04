import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/addresse/presentation/view/addaddresse.dart';
import 'package:supermarket/features/cart/presentation/view/aftercheck.dart';


class AddresseView extends StatelessWidget {
  const AddresseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          'Address',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const AddresseWidget(),
            const AddresseWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              width: double.infinity,
              height: 57,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: TColor.primary,
                ),
                child: Text("Add Addresse",
                    style: TextStyle(
                      fontSize: 18,
                      color: TColor.white,
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                  Get.to(() => const AddAddresseView());
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
