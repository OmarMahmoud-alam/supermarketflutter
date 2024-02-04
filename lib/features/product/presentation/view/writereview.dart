import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/review/presentation/views_models/writereview.dart';

class WriteReviewView extends GetView<WriteReviewController> {
  WriteReviewView({super.key});
  // Do something with the productId
  final WriteReviewController reviewcontroller =
      Get.put(WriteReviewController());

  @override
  Widget build(BuildContext context) {
    controller.Product_id = Get.parameters['id'];

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
          'Write Review ',
        ),
      ),
      body: GetBuilder<WriteReviewController>(builder: (control) {
        return controller.Product_id == null
            ? const CircularProgressIndicator()
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(
                        height: 1.5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 25),
                      child: Text(
                        'Please write Overall level of satisfaction with your shipping / Delivery Service ',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 7),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: controller.rate,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 32,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              controller.setRate(rating);
                            },
                          ),
                          const Gap(5),
                          Text(
                            '${controller.rate}/5 ',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Write Your Review ',
                          ),
                          const Gap(15),
                          TextFormField(
                            controller: controller.commentcontroller,
                            minLines: 5,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: 'Write your comment here',
                              /* hintStyle: safeGoogleFont(
                            'Poppins',
                            fontSize: 12,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            color: TColor.textsemiappear,
                          ),*/
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: TColor.primaryborder, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: TColor.offwhite, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  /*    SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: TColor.secondarybutton,
                    ),
                    child: Text("Send Review",
                        style: TextStyle(
                          fontSize: 18,
                          color: TColor.white,
                          fontWeight: FontWeight.w700,
                        )),
                    onPressed: () {
                      //Get.to(() => const ());
                    },
                  ),
                ),
              )*/
                ],
              );
      }),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: 57,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: TColor.green401,
          ),
          child: Text("Send Review",
              style: TextStyle(
                fontSize: 18,
                color: TColor.white,
                fontWeight: FontWeight.w700,
              )),
          onPressed: () {
            controller.postreview();
            //Get.to(() => const ());
          },
        ),
      ),
    );
  }
}
