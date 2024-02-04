import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/common_widget/custombutton.dart';
import 'package:supermarket/core/common/common_widget/home/shimewidget.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';
import 'package:supermarket/features/product/data/models/productdetailsmodel.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/product/presentation/view/review.dart';
import 'package:supermarket/features/product/presentation/view/widget/bottomcart.dart';
import 'package:supermarket/features/product/presentation/view/writereview.dart';
import 'package:supermarket/features/product/presentation/views_models/productderailscontroller.dart';

class ProductdetialsView extends StatelessWidget {
  ProductdetialsView({super.key});
  final ProductController productController = Get.put(ProductController());
  final ProductModel beforeproduct = Get.arguments;

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
          title: Text(
            beforeproduct.name,
          ),
        ),
        body: FutureBuilder(
          future: productController.fetchProductDetails(beforeproduct.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  Hero(
                      tag: "omar",
                      child:
                          CachedNetworkImage(imageUrl: beforeproduct.imageUrl)),
                  const Shimmehomewidget(),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Productdetails product = productController.product!;

              // Display your actual UI once data is loaded
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Hero(
                        tag: "${product.id}",
                        child: CachedNetworkImage(imageUrl: product.image)),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                              ),
                            ),
                            GetBuilder<ProductController>(builder: (context) {
                              return productController.favoriteloading
                                  ? const CircularProgressIndicator()
                                  : IconButton(onPressed: () async {
                                      await productController.changefavouity();
                                    }, icon: GetBuilder<ProductController>(
                                      builder: (context) {
                                      return (productController
                                              .product!.isFavorite
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(Icons.favorite_outline));
                                    }));
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        width: 96,
                        child: RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: product.averageRate,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.9),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "\$${product.price}",
                        //textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Details',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(10),
                        Text(
                          product.description ??
                              'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Review Product',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  //Get.to(() => ReviewView());
                                },
                                child: const Text(
                                  'See More',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 96,
                              child: RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: product.averageRate,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 16,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  // print(rating);
                                },
                              ),
                            ),
                            const Gap(5),
                            Text(
                              product.averageRate.toStringAsFixed(2),
                            ),
                            const Gap(2),
                            Text(
                              '(${product.reviews.length} Review)',
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: (product.reviews.isNotEmpty)
                        ? CustomButton(
                            text: ' Write comment',
                            onPressed: () {
                              Get.to(() => WriteReviewView(),
                                  arguments: {'id': product.id});
                            },
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/person/a1.png')),
                                    const Gap(12),
                                    Column(
                                      children: [
                                        Text(
                                          product.reviews[0].user!.name ??
                                              'ahmed',
                                        ),
                                        RatingBar.builder(
                                          ignoreGestures: true,
                                          initialRating:
                                              product.reviews[0].rating + 0.0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1.5),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            // print(rating);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 5),
                                  child: Text(
                                    product.reviews[0].comment ?? '',
                                  ),
                                ),
                                const Gap(21),
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  width: double.infinity,
                                  child: Text(
                                    product.reviews[0].revieWritedate(),
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
                      child: Text(
                        'You Might Also Like ',
                      ),
                    ),
                  ),
                  /*  SliverToBoxAdapter(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: pro.map((e) {
                  return SizedBox(
                    //height: 246,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 141,
                            // height: 240,
                            child: Stack(
                              children: [
                                Image.asset(
                                  e,
                                  width: 141,
                                  height: 141,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 8,
                                    left: 9,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints:
                                            const BoxConstraints(), // override default min size of 48px
                                        style: const ButtonStyle(
                                          tapTargetSize: MaterialTapTargetSize
                                              .shrinkWrap, // the '2023' part
                                        ),
                                        onPressed: () {
                                          Get.to(() => ProductdetialsView());
                                        },
                                        icon: const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                        )))
                              ],
                            ),
                          ),
                          const Gap(7),
                          SizedBox(
                            width: 140,
                            //  height: 50,
                            child: Text(
                              'FS - Nike Air Max 270 React',
                              //textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: safeGoogleFont(
                                'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: TColor.textTittle,
                              ),
                            ),
                          ),
                          const Gap(7),
                          SizedBox(
                            width: 140,
                            child: Text(
                              "\$299,43",
                              //textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: safeGoogleFont(
                                'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: TColor.title3,
                              ),
                            ),
                          ),
                          const Gap(7),
                          SizedBox(
                            width: 141,
                            //height: 10,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$534,33",
                                  //textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: safeGoogleFont(
                                    'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                    letterSpacing: 0.5,
                                    color: TColor.secondarytext,
                                  ),
                                ),
                                const Gap(7),
                                Text(
                                  "24% Off",
                                  //textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: safeGoogleFont('Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      color: TColor.bink,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList())),
          ),
         */
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 25),
                      width: double.infinity,
                      height: 57,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: TColor.primarybutton,
                        ),
                        child: Text("Add To Cart",
                            style: TextStyle(
                              fontSize: 18,
                              color: TColor.white,
                              fontWeight: FontWeight.w700,
                            )),
                        onPressed: () {
                          bottomaddcart(productController);
                          //    Get.to(() => const Cartview());
                        },
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}
