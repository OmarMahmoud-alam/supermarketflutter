import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supermarket/core/common/utils/app_assets.dart';
import 'package:supermarket/features/product/data/models/favouritemodel.dart';

class RemoveFavouriteproductitem extends StatelessWidget {
  const RemoveFavouriteproductitem(
      {super.key,
      required this.product,
      required this.index,
      required this.animation});
  final FavoriteItem product;
  final int index;
  final Animation<double> animation;

  // Set your desired duration
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 2,
            //   margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: product.imageUrl,
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
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.whitetrash),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )),
      ),
    );
  }
}
