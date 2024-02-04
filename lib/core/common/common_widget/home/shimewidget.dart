import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmehomewidget extends StatelessWidget {
  const Shimmehomewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          3, // Number of shimmer items you want to show
          (index) => ListTile(
            title: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
