import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
        title: const Text(
          'Order Details',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 15),
              child: Text(
                'Product',
              ),
            ),
            const Productorder(),
            const Productorder(),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 15),
              child: Text(
                'Shipping Details',
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: TColor.offwhite, // Specify the color of the border
                    width: 1.5, // Specify the width of the border
                  ),
                ),
                child: const Column(children: <Widget>[
                  Rowofcartcal(
                    name: "Date Shipping",
                    price: "January 16, 2020",
                  ),
                  Rowofcartcal(
                    name: "Shipping",
                    price: "POS Reggular",
                  ),
                  Rowofcartcal(
                    name: "No. Resi",
                    price: "000192848573",
                  ),
                  Rowofcartcal(
                    name: "Address",
                    price: "2727 New  Owerri, Owerri, Imo State 78410",
                  ),
                ])),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 15),
              child: Text(
                'Payment Details',
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: TColor.offwhite, // Specify the color of the border
                    width: 1.5, // Specify the width of the border
                  ),
                ),
                child: const Column(children: <Widget>[
                  Rowofcartcal(
                    name: "Items (3)",
                    price: "\$598.86",
                  ),
                  Rowofcartcal(
                    name: "Shipping",
                    price: "\$40.00",
                  ),
                  Rowofcartcal(
                    name: "Import charges",
                    price: "\$128.00",
                  ),
                  Divider(
                    height: 1,
                    color: TColor.offwhite,
                  ),
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Text(
                          'Total Price',
                        ),
                        Spacer(),
                        Text(
                          '\$766.86',
                        ),
                      ],
                    ),
                  )
                ])),
            const Gap(30),
          ]),
        ),
      ),
    );
  }
}

class Rowofcartcal extends StatelessWidget {
  final String name;
  final String price;
  const Rowofcartcal({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            name,
          ),
          const Spacer(),
          SizedBox(
            width: 170,
            child: Text(
              price,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class Productorder extends StatelessWidget {
  const Productorder({
    super.key,
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
        Image.asset(
          'assets/images/product/image69.png',
          width: 68,
          height: 72,
        ),
        const Gap(10),
        const Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 140,
                      child: Text(
                        'FS - Nike Air Max 270 React',
                        //textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(24),
              Row(
                children: [
                  Text(
                    '\$299,43',
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
