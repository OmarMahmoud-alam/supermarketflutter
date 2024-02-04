import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyListforwidget extends StatelessWidget {
  final String text;
  const EmptyListforwidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Image.asset('assest/image/notfound.png'),
      const Gap(20),
      Text(
        text,
      ),
    ]));
  }
}
