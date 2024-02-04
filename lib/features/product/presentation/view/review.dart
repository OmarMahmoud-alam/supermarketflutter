import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/common_widget/review/reviewwidget.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/product/presentation/view/writereview.dart';
import 'package:supermarket/features/review/presentation/views_models/reviewcontroller.dart';

class ReviewView extends StatelessWidget {
  final ReviewController reviewcontroller = Get.put(ReviewController());

  ReviewView({super.key});

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
          '${reviewcontroller.reviews.length} Review ',
        ),
      ),
      body: CustomScrollView(
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
          SliverList.builder(
              itemCount: reviewcontroller.reviews.length,
              itemBuilder: (context, index) => ReviewWidget(
                    review: reviewcontroller.reviews[index],
                  )),
          //be careful with play with SingleChildScrollView
          /*SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                  children: reviewcontroller.reviews.map((onereview) {
                return ReviewWidget(
                  review: onereview,
                );
              }).toList()),
            ),
          ),*/
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              height: 57,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: TColor.primarybutton,
                ),
                child: const Text(
                  "Write Review",
                ),
                onPressed: () {
                //  Get.to(() =>  WriteReviewView(),arguments: product);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
