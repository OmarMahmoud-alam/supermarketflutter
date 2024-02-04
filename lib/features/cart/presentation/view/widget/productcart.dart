import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:supermarket/core/common/utils/app_assets.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/cart/presentation/views_models/maincartcontroller.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

class productcart extends StatelessWidget {
  final ProductModel product;
  final MainCartController controller;
  const productcart({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: TColor.offwhite, // Specify the color of the border
          width: 1.5, // Specify the width of the border
        ),
      ),
      child: Row(children: [
        SizedBox(
          width: 68,
          height: 72,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            width: 68,
            height: 72,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 1,
                      height: 20,
                      child: Text(
                        product.name,
                        //textAlign: TextAlign.center,
                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    //  color: TColor.bink,
                  ),
                  const Gap(10),
                  InkWell(onTap: () => controller.delete(product),
                    child: SvgPicture.asset(AppAssets.whitetrash))
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  Text(
                    '\$${product.price}',
                  ),
                  const Spacer(),
                  Container(
                    child: Row(
                      children: [
                        const Smallleftcontainer(
                          child: Center(child: Center(child: Text('-'))),
                        ),
                        Container(
                          width: 40,
                          height: 24,
                          color: TColor.offwhite,
                          child: Center(
                              child: Text(
                            product.quantity.toString(),
                          )),
                        ),
                        const Smallrightcontainer(
                          child: Center(child: Text('+')),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class Smallleftcontainer extends StatelessWidget {
  final Widget child;
  final void Function()? ontap;
  const Smallleftcontainer({
    super.key,
    required this.child,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: 32,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
            ),
            border: Border.all(
              color: TColor.offwhite, // Specify the color of the border
              width: 2.0, // Specify the width of the border
            ),
          ),
          child: child),
    );
  }
}

class Smallrightcontainer extends StatelessWidget {
  final Widget child;
  final void Function()? ontap;
  const Smallrightcontainer({
    super.key,
    required this.child,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: 32,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            border: Border.all(
              color: TColor.offwhite, // Specify the color of the border
              width: 2.0, // Specify the width of the border
            ),
          ),
          child: child),
    );
  }
}
