import 'package:flutter/material.dart';
import 'package:supermarket/features/test/add_product_appbar.dart';
import 'package:supermarket/features/test/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddProductAppBar(),
      body: AddProductViewBody(),
    );
  }
}
