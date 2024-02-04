import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:supermarket/core/common/common_widget/home/shimewidget.dart';
import 'package:supermarket/features/product/presentation/view/widget/favouriteproductwidget.dart';
import 'package:supermarket/features/product/presentation/views_models/categoryproductcontroller.dart';
import 'package:supermarket/features/product/presentation/views_models/favouritecontroller.dart';
import 'package:supermarket/generated/locale_keys.g.dart';

class Favouriteproductview extends GetView<ProductListController> {
  final Favouritecontroller favouritepageController =
      Get.put(Favouritecontroller());

  Favouriteproductview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favourite.tr()),
      ),
      body: FutureBuilder(
          future: favouritepageController.fetchProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Shimmehomewidget();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return AnimatedList(
                key: favouritepageController.mylistkey,
                initialItemCount:
                    favouritepageController.favouriteproduct!.length,
                    
                itemBuilder: (context, index, animation) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Favouriteproductitem(
                      index: index,
                      product: favouritepageController
                          .favouriteproduct![index],
                      controller: favouritepageController),
                ));
          }),
    );
  }
}
