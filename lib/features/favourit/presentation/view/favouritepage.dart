import 'package:flutter/material.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite',
          style: AppTextStyles.maintextStyle,
        ),
      ),
     // body: ,
    );
  }
}
