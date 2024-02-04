import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class Shipto extends StatelessWidget {
  const Shipto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //  Get.to(() => const AddAddresseView());
            },
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
          )
        ],
        title: const Text(
          'Ship to',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const AddresseWidget(),
            const AddresseWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              width: double.infinity,
              height: 57,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  //  backgroundColor: TColor.secondarybutton,
                ),
                child: const Text("Next",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class AddresseWidget extends StatelessWidget {
  const AddresseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: TColor.offwhite, // Specify the color of the border
          width: 1.5, // Specify the width of the border
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Priscekila',
            textAlign: TextAlign.left,
          ),
          const Gap(20),
          const Text(
            '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
          ),
          const Gap(20),
          const Text(
            '+99 1234567890',
          ),
          const Gap(10),
          Row(
            children: [
              InkWell(
                child: Container(
                  width: 77,
                  height: 57,
                  decoration: BoxDecoration(
                    // color: TColor.title3,
                    borderRadius: BorderRadius.circular(5),
                    /*border: Border.all(
                color: TColor.offwhite, // Specify the color of the border
                width: 2.0, // Specify the width of the border
              ),*/
                  ),
                  child: const Center(
                      child: Text(
                    'Edit',
                  )),
                ),
              ),
              const Gap(20),
              Image.asset(
                'assets/images/trash.png',
                //color: TColor.bink,
              )
            ],
          )
        ],
      ),
    );
  }
}
