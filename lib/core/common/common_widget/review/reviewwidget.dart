import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:supermarket/features/review/data/models/reviewmode.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget({
    super.key, required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 15, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person/a1.png')),
              const Gap(12),
              Column(
                children: [
                  Text(
                    review.user!.name,
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
                    itemBuilder: (context, _) => const Icon(
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
            padding: const EdgeInsets.only(top: 5.0, left: 5),
            child: Text(
              review.comment?? 'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
            ),
          ),
          const Gap(21),
          Container(
            padding: const EdgeInsets.only(left: 5),
            width: double.infinity,
            child: const Text(
              'December 10, 2016',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
