import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/cart/presentation/view/widget/cartview_body.dart';
import 'package:supermarket/features/cart/presentation/views_models/maincartcontroller.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class Cartview extends GetView<MainCartController> {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainCartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
        ),
      ),
      body: CartViewBody(),
      //  bottomNavigationBar: const CustomBottomNavigate(),
    );
  }
}
