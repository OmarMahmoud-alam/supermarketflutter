import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';
import 'package:supermarket/features/home/presentation/views_models/homecontroller.dart';
import 'package:supermarket/features/product/presentation/view/productview.dart';

// ignore: camel_case_types
class homeproductwidget extends StatelessWidget {
  final ProductModel productitem;
  final HomeController controller;

  const homeproductwidget({
    super.key,
    required this.productitem,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            width: 141,
            // height: 200,
            child: InkWell(
              onTap: () {
                Get.to(() => ProductdetialsView(), arguments: productitem);
              },
              child: Stack(
                children: [
                  Hero(
                    tag: "omar",
                    // tag: "${productitem.id}",
                    child: CachedNetworkImage(
                      imageUrl: productitem.imageUrl,
                      width: 141,
                      height: 141,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 2,
                      right: 3,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints:
                              const BoxConstraints(), // override default min size of 48px
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // the '2023' part
                          ),
                          onPressed: () async {
                            await controller.changefavouity(productitem);
                          },
                          icon: GetBuilder<HomeController>(builder: (context) {
                            return productitem.isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator())
                                : GetBuilder<HomeController>(
                                    builder: (context) {
                                    return Icon(
                                      (productitem.favorite)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: Colors.red,
                                    );
                                  });
                          })))
                ],
              ),
            ),
          ),
          const Gap(7),
          SizedBox(
            width: 140,
            child: Text(
              productitem.name,
              //textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              //  style:
            ),
          ),
          const Gap(7),
          SizedBox(
            width: 140,
            child: Text(
              "\$${productitem.price}",
              //textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(7),
          /* SizedBox(
        width: 141,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$534,33",
              //textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            
            ),
            const Gap(7),
            Text(
              "24% Off",
              //textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              
            ),
          ],
        ),
      )*/
        ],
      ),
    );
  }
}
