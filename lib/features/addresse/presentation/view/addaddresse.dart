import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/addresse/presentation/views_models/addaddressecontroller.dart';


class AddAddresseView extends GetView<Addaddressecontroller> {
  const AddAddresseView({super.key});
  final double dgaplength1 = 10;
  final double dgaplength2 = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text(
          'Add Address',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 1.5,
              ),
              Gap(dgaplength2),
              const customtext(text: 'Country or region'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.countrytext,
              ),
              Gap(dgaplength2),
              const customtext(text: 'Street Address'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.streetcontroller,
              ),
              Gap(dgaplength2),
              const customtext(text: 'Street Address 2 (Optional)'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.streetcontroller2,
              ),
              Gap(dgaplength2),
              const customtext(text: 'State/Province/Region'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.stateOrRegioncontroller,
              ),
              Gap(dgaplength2),
              const customtext(text: 'City'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.citycontroller,
              ),
              Gap(dgaplength2),
              const customtext(text: 'Zip Code'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.zipcodecontroller,
              ),
              Gap(dgaplength2),
              const customtext(text: 'Phone Number'),
              Gap(dgaplength1),
              customTextInput(
                controller: controller.phonecontroller,
              ),
              const Gap(30),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                width: double.infinity,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: TColor.secondaryText,
                  ),
                  child: Text("Add Addresse",
                      style: TextStyle(
                        fontSize: 18,
                        color: TColor.white,
                        fontWeight: FontWeight.w700,
                      )),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customtext extends StatelessWidget {
  final String text;
  const customtext({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
/*
class CustomProgrssbar extends StatelessWidget {
  const CustomProgrssbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
            SizedBox(
              width: double.maxFinite,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: FlutterStepIndicator(
                  height: 28,
                  paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                  positiveColor: const Color(0xFF00B551),
                  progressColor: const Color(0xFFEA9C00),
                  negativeColor: const Color(0xFFD5D5D5),
                  padding: const EdgeInsets.all(4),
                  list: list,division: counter,
                  onChange: (i) {},
                  page: page,
                  onClickItem: (p0) {
                    setState(() {
                      page = p0;
                    });
                  },
                ),
              ),
            ),
            widgetOption(title: "update step ($page)", callAdd: () {
              if (page < list.length) {
                setState(() {
                  page++;
                });
              }
            }, callRemove: () {
              if (page > 0) {
                setState(() {
                  page--;
                });
              }
            }),
            widgetOption(title: "add item in list (${list.length})", callAdd: () {
              setState(() {
                list.add(Random().nextInt(100));
              });
            }, callRemove: () {
              setState(() {
                list.removeAt(list.length - 1);
              });
            }),
            widgetOption(title: "counter show (${counter - 1})", callAdd: () {
              setState(() {
                counter++;
              });
            }, callRemove: () {
              setState(() {
                counter--;
              });
            })}
}
*/

class customTextInput extends StatelessWidget {
  final TextEditingController? controller;
  const customTextInput({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        /*  hintStyle: safeGoogleFont(
          'Poppins',
          fontSize: 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.normal,
          color: TColor.textsemiappear,
        ),*/
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: TColor.primary, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        // hintText: 'ENGLISH',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: TColor.offwhite, width: 1.0),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
