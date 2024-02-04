import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/product/presentation/views_models/productderailscontroller.dart';

void bottomaddcart(ProductController productController) {
  Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Quantity ',
                style: AppTextStyles.maintextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      if (productController.number.value > 1) {
                        productController.number.value--;
                      } else {
                        Get.snackbar('Warring', "quantity can't be less than 1",
                            backgroundColor: Colors.red);
                      }
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text('-'),
                    ),
                  ),
                  Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          productController.number.value.toString(),
                          style: AppTextStyles.maintextStyle
                              .copyWith(fontSize: 18),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      productController.number.value++;
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text('+'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: TColor.primarybutton,
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                        fontSize: 18,
                        color: TColor.white,
                        fontWeight: FontWeight.w700,
                      )),
                  onPressed: () {
                    productController.addtocart();
                    productController.number.value = 1;
                    Get.back();
                    //    Get.to(() => const Cartview());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white);
}
