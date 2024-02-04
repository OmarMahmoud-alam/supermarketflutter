import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/common_widget/cursol.dart';
import 'package:supermarket/features/home/presentation/view/widget/categorywidget.dart';
import 'package:supermarket/features/home/presentation/view/widget/productwidget.dart';
import 'package:supermarket/core/common/common_widget/home/shimewidget.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';

import 'package:supermarket/features/home/presentation/views_models/homecontroller.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeController = Get.put(HomeController());

//imagecursl
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: homeController.fetchHomeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Shimmehomewidget();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Display your actual UI once data is loaded
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    //foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    toolbarHeight: 115,
                    floating: true,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Grocify',
                                style: AppTextStyles.textsemibold20,
                              ),
                              const Spacer(),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints:
                                      const BoxConstraints(), // override default min size of 48px
                                  style: const ButtonStyle(
                                    tapTargetSize: MaterialTapTargetSize
                                        .shrinkWrap, // the '2023' part
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.notifications))
                            ],
                          ),
                          const Gap(15),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  filled: true,
                                  //fillColor: TColor.,
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'Search Product',
                                  hintStyle: AppTextStyles.seconadytextstyle),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CarouslImagesBanner(
                      banners: homeController.homedata!.banners,
                    ),
                  ),
                  //category text
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          'Category',
                          //  style: TextStyles.textbold16
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {}, child: const Text('see more'))
                      ],
                    ),
                  )),
                  //categories row
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 140,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.homedata!.categories.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CategoryCircleAvator(
                                category:
                                    homeController.homedata!.categories[index],
                              )),
                    ),
                  ),
                  //top seller product
                  const SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'TopsellProduct',
                      //  style: TextStyles.textbold16
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 215,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.homedata!.products.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => homeproductwidget(
                                controller: homeController,
                                productitem:
                                    homeController.homedata!.products[index],
                              )),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 20),
                      child: Text(
                        'You May Like ',
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 0.,
                      // mainAxisSpacing: 0.0,
                      childAspectRatio: 156 / 170,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        ProductModel productitem =
                            homeController.homedata!.products[index];
                        return homeproductwidget(
                          controller: homeController,
                          productitem: productitem,
                        );
                      },
                      childCount: homeController.homedata!.products.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}/* CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
          
            /*    
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    //  width: double.infinity,
                    child: Image.asset(
                      'assets/images/comm/b1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Text(
                    'You May Like ',
                    style: safeGoogleFont(
                      'Poppins',
                      height: 1.5,
                      fontSize: 14,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: TColor.title3,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.82,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
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
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const ProductdetialsView());
                                    },
                                    child: Image.asset(
                                      productimages[index % productimages.length],
                                      width: 141,
                                      height: 141,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      top: 2,
                                      left: 3,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints:
                                              const BoxConstraints(), // override default min size of 48px
                                          style: const ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap, // the '2023' part
                                          ),
                                          onPressed: () {},
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
                            index % 3 == 0
                                ? SizedBox(
                                    width: 141,
                                    //height: 10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                : const SizedBox(
                                    height: 10,
                                  )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: productimages.length * 3,
                ),
              ),
          */
          ],
        ),
    */
