import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/home/presentation/view/widget/productwidget.dart';
import 'package:supermarket/core/common/common_widget/home/shimewidget.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';
import 'package:supermarket/features/home/data/models/categorymdel.dart';
import 'package:supermarket/features/home/presentation/views_models/homecontroller.dart';
import 'package:supermarket/features/product/presentation/views_models/categoryproductcontroller.dart';

class CategoryProductview extends GetView<ProductListController> {
  CategoryProductview({Key? key})
      : category = Get.arguments!["category"],
        super(key: key);
  final ProductListController productListController =
      Get.put(ProductListController());
  final HomeController homeController = Get.put(HomeController());

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: FutureBuilder(
          future: productListController.fetchData(category.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Shimmehomewidget();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return (controller.products.isEmpty)
                ? Center(
                    child: Text('No product Now',
                        style:
                            AppTextStyles.maintextStyle.copyWith(fontSize: 30)),
                  )
                : GridView.builder(
                    itemCount: controller.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.82,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        homeproductwidget(
                      productitem: controller.products[index], controller: homeController,
                    ),
                  );
          }),
    );
  }
}
