import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  CustomBottomNavigationBarItem(
      {required String label, required String iconpath})
      : super(
          label: label,
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SvgPicture.asset(
              iconpath,
              width: 15,
              height: 18,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SvgPicture.asset(iconpath,
                width: 15,
                height: 18,
                colorFilter:
                    const ColorFilter.mode(TColor.green401, BlendMode.srcIn)),
          ),
        );
}
