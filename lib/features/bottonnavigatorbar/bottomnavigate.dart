// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:supermarket/core/common/utils/app_assets.dart';
import 'package:supermarket/core/theme/main_colors.dart';
import 'package:supermarket/features/bottonnavigatorbar/widget/customBottomnavigateitem.dart';
import 'package:supermarket/features/cart/presentation/view/cartview.dart';
import 'package:supermarket/features/home/presentation/view/home.dart';
import 'package:supermarket/features/product/presentation/view/favouriteproduct.dart';
import 'package:supermarket/features/setting/presentation/view/setting.dart';
import 'package:supermarket/generated/locale_keys.g.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  int selectedIndex;

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //local apppar
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.black, // AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          onTap: (index) {
            setState(() {
              widget.selectedIndex = index;
            });
          },
          items: [
            CustomBottomNavigationBarItem(
              label: LocaleKeys.home.tr,
              iconpath: AppAssets.home,
            ),
            CustomBottomNavigationBarItem(
                label: LocaleKeys.cart, iconpath: AppAssets.cateory),
            CustomBottomNavigationBarItem(
                label: LocaleKeys.favourite, iconpath: AppAssets.favourite),
            CustomBottomNavigationBarItem(
                label: LocaleKeys.settings.tr, iconpath: AppAssets.setting),
            /*   BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SvgPicture.asset(
                  width: 15,
                  height: 20,
                  colorFilter: widget.selectedIndex == 0
                      ? const ColorFilter.mode(Colors.red, BlendMode.srcIn)
                      : null,
                  AppAssets.home,
                ),
              ),
              label: LocaleKeys.home.tr,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SvgPicture.asset(
                  colorFilter: widget.selectedIndex == 1
                      ? const ColorFilter.mode(
                          TColor.green401, BlendMode.srcIn)
                      : null,
                  height: 20,
                  AppAssets.sharelogo,
                ),
              ),
              label: translation(context)!.qrCode,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SvgPicture.asset(
                  colorFilter: widget.selectedIndex == 2
                      ? const ColorFilter.mode(
                          AppColors.activeiconcolor, BlendMode.srcIn)
                      : null,
                  height: 20,
                  AppAssets.storelogo,
                ),
              ),
              label: translation(context)!.store,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SvgPicture.asset(
                  colorFilter: widget.selectedIndex == 3
                      ? const ColorFilter.mode(
                         TColor.green401, BlendMode.srcIn)
                      : null,
                  width: 21.2,
                  height: 20,
                  AppAssets.activationlogo,
                ),
              ),
              label: translation(context)!.activation,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SvgPicture.asset(
                  colorFilter: widget.selectedIndex == 4
                      ? const ColorFilter.mode(
                          AppColors.activeiconcolor, BlendMode.srcIn)
                      : null,
                  height: 20,
                  AppAssets.settinglogo,
                ),
              ),
              label: translation(context)!.setting,
            ),
        */
          ],
        ),
      ),
      body: widget.selectedIndex == 0
          ? HomeView()
          : widget.selectedIndex == 1
              ? const Cartview() // StoreScreen()
              : widget.selectedIndex == 2
                  ? Favouriteproductview()
                  : widget.selectedIndex == 3
                      ? const SettingView()
                      : const SizedBox(),
    );
  }
}
