import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supermarket/core/common/utils/app_assets.dart';
import 'package:supermarket/features/product/data/models/favouritemodel.dart';
import 'package:supermarket/features/product/presentation/views_models/favouritecontroller.dart';

class Favouriteproductitem extends StatelessWidget {
  const Favouriteproductitem(
      {super.key,
      required this.product,
      required this.controller,
      required this.index});
  final FavoriteItem product;
  final int index;
  final Favouritecontroller controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        //   margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            InkWell(
              onTap: () => controller.movetodetails(product),
              child: CachedNetworkImage(
                height: 100,
                width: 100,
                imageUrl: product.imageUrl,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                const SizedBox(
                  height: 8,
                ),
                Text("Price : ${product.price}"),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () => controller.delete(product, index),
              icon: SvgPicture.asset(AppAssets.whitetrash),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ));
  }
}
