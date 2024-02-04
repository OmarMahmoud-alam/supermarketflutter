import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/utils/magic_router.dart';

// void showSnackBar(String title) {

//   final snackBar = SnackBar(
//     backgroundColor: kDeepBlue,
//     content: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: const TextStyle(fontSize: 15),
//     ),
//   );
//   globalScaffoldKey.currentState!.showSnackBar(snackBar);
// }
showSnackBar(String title,
    {bool popPage = false,
    duration = 3,
    Color color = Colors.white,
    EdgeInsetsGeometry? margin}) {
  print(Get.context ?? 'fail');
  ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      margin: margin,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => MagicRouter.pop());
}
