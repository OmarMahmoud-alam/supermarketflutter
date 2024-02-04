import 'package:flutter/material.dart';
import 'package:supermarket/core/theme/main_colors.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class AppTextStyles {
  static const TextStyle textmedium20 = TextStyle(
    fontFamily: 'Poppin',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: TColor.headertext1,
  );
  static const TextStyle hinttextstyle = TextStyle(
    fontFamily: 'Poppin',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: TColor.secondaryText,
  );
  static const TextStyle maintextStyle = TextStyle(
    fontFamily: 'Poppin',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: TColor.primaryText,
    // color: TColor.headertext1,
  );

  static const TextStyle seconadytextstyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    // height: 2.1666666667*ffem/fem,
    letterSpacing: 0.5,
    color: TColor.secondaryText,
  );
    static const TextStyle seconadytextstyle14 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    // height: 2.1666666667*ffem/fem,
    letterSpacing: 0.5,
    color: TColor.secondaryText,
  );
  static const TextStyle textsemibold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: TColor.headertext1,
  );
  static const TextStyle textbold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: TColor.headertext1,
  );
}
