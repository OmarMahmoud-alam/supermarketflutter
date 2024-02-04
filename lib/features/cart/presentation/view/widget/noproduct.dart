import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Noproductincart extends StatelessWidget {
  const Noproductincart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Image.asset('assest/image/notfound.png'),
      const Gap(20),
      const Text(
        'Cart is Empty',
      ),
    ]));
  }
}
