import 'package:flutter/material.dart';

class TColor {
  static const Color headertext1 = Color(0xff37474F);
  static const Color inputotpcolor = Color(0xfff0f1f2);
  static const Color primaryText = Color(0xff030303);
  static const Color secondaryText = Color(0xff9098B1);

  static const Color green401 = Color(0xff5EC401);
  static const Color offwhite = Color.fromARGB(255, 240, 240, 240);

  static const Color primary = Color(0xff53B175);
  static const Color primarybutton = Color(0xff1fa309);
  static Color primarybuttontext = const Color(0xff25ce09);
  static Color get textTittle => const Color(0xff7C7C7C);
  static Color get placeholder => const Color(0xffB1B1B1);
  static Color get darkGray => const Color(0xff4C4F4D);
  static Color get white => const Color(0xffffffff);
  static Color get primaryborder => const Color(0xff7cb1FF);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
