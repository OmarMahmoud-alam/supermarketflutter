import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:supermarket/core/common/utils/app_assets.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/cart/presentation/view/widget/noproduct.dart';
import 'package:supermarket/features/cart/presentation/view/widget/productcart.dart';
import 'package:supermarket/features/cart/presentation/views_models/maincartcontroller.dart';
import 'package:supermarket/features/home/data/models/productmodel.dart';
import 'package:supermarket/features/order/presentation/view/orderdetails.dart';

class CartViewBody extends GetView<MainCartController> {
  final MainCartController cartcontrolelr = Get.put(MainCartController());

  CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cartcontrolelr.fetchData(),
        builder: (context, snapshot) {
          return GetBuilder<MainCartController>(
            builder: (context) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: controller.cart == null
                      ? const CircularProgressIndicator()
                      : controller.cart!.cartItems.isNotEmpty
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.cart!.cartItems.length +
                                  2, // +3 for the three sections in your UI
                              itemBuilder: (context, index) {
                                if (index < controller.cart!.cartItems.length) {
                                  return productcart(
                                    controller:controller,
                                      product: controller.cart!.cartItems[index]);
                                } else if (index ==
                                    controller.cart!.cartItems.length) {
                                  return Row(
                                    children: [
                                      const Gap(10),
                                      Expanded(
                                        child: SizedBox(
                                          height: 60,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Cupon Code',
                                              /* hintStyle: safeGoogleFont(
                                'Poppins',
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                                color: TColor.textsemiappear,
                              ),*/
              
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: TColor.offwhite,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.zero,
                                                  bottomLeft: Radius.circular(
                                                      5), // No radius for bottom corners
                                                  bottomRight: Radius.zero,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          width: 87,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            color: TColor.primarybutton,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                            /*border: Border.all(
                              color: TColor.offwhite, // Specify the color of the border
                              width: 2.0, // Specify the width of the border
                            ),*/
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Apply',
                                          )),
                                        ),
                                      ),
                                      const Gap(10),
                                    ],
                                  );
                                } else if (index ==
                                    controller.cart!.cartItems.length + 1) {
                                  return Column(children: [
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: TColor
                                                .offwhite, // Specify the color of the border
                                            width:
                                                1.5, // Specify the width of the border
                                          ),
                                        ),
                                        child: Column(children: <Widget>[
                                          Rowofcartcal(
                                            name:
                                                "Items (${controller.cart!.cartItems.length})",
                                            price: "\$${controller.cart!.total}",
                                          ),
                                          const Rowofcartcal(
                                            name: "Import charges",
                                            price: "\$10.00",
                                          ),
                                          const Divider(
                                            height: 1,
                                            color: TColor.offwhite,
                                          ),
                                          const Gap(10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Total Price',
                                                ),
                                                const Spacer(),
                                                Text(
                                                  '\$${controller.cart!.total == null ? 0 : controller.cart!.total!.toDouble() + 10}',
                                                ),
                                              ],
                                            ),
                                          )
                                        ])),
                                    const Gap(30),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 25),
                                      width: double.infinity,
                                      height: 57,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor: TColor.green401,
                                        ),
                                        child: Text("Check Out",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: TColor.white,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        onPressed: () {
                                          //  Get.to(() => const Shipto());
                                        },
                                      ),
                                    ),
                                  ]);
                                }
                                return const Center(
                                    child: CircularProgressIndicator());
                              })
                          : const Noproductincart());
            }
          );
        });
  }
}
