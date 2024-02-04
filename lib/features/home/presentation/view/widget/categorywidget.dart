import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/home/data/models/categorymdel.dart';
import 'package:supermarket/features/product/presentation/view/categoryproduct.dart';

class CategoryCircleAvator extends StatelessWidget {
  final CategoryModel category;
  const CategoryCircleAvator({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() =>  CategoryProductview(),
                  arguments: {"category": category});
            },
            child: CircleAvatar(
              radius: 40,
              backgroundImage: CachedNetworkImageProvider(
                category.image!,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 65,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              // style:
            ),
          )
        ],
      ),
    );
  }
}
