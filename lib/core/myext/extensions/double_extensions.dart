import 'dart:math';

import 'package:flutter/material.dart';

extension Precision on double {
  double toPrecision(int fractionDigits) {
    var mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }

  Widget ht() => SizedBox(
        height: this,
      );
  Widget wt() => SizedBox(
        width: this,
      );
}
