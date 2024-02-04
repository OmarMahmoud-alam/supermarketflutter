import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/account/presentation/view/deleteaccount.dart';
import 'package:supermarket/features/account/presentation/view/profile.dart';
import 'package:supermarket/features/auth/presentation/view/screen/login.dart';
import 'package:supermarket/features/order/presentation/view/orderview.dart';


class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text(
          'Account',
        ),
      ),
      body: ListView(
        children: [
          const Divider(
            height: 1.5,
          ),
          TitleWidgetitem(
            ontap: () {
              Get.to(() => const ProfileView());
            },
            imagepath: 'assets/images/d0.png',
            text: 'Profile',
          ),
          TitleWidgetitem(
            ontap: () {
              Get.to(() => const OrderView());
            },
            imagepath: 'assets/images/d1.png',
            text: 'My Orders ',
          ),
          const TitleWidgetitem(
            // ontap: () => Get.to(() => const AddresseView()),
            imagepath: 'assets/images/d2.png',
            text: 'Address',
          ),
          TitleWidgetitem(
            ontap: () => Get.to(() => const Login()),
            imagepath: 'assets/images/d3.png',
            text: 'Log out ',
          ),
          TitleWidgetitem(
            ontap: () => Get.to(() => const DeleteAccount()),
            imagepath: 'assets/images/d4.png',
            text: 'Delete Account',
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavigate(),
    );
  }
}

class TitleWidgetitem extends StatelessWidget {
  final String imagepath;
  final String text;
  final void Function()? ontap;
  const TitleWidgetitem({
    super.key,
    required this.imagepath,
    required this.text,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: Image.asset(imagepath),
          title: Text(
            text,
          ),
        ),
      ),
    );
  }
}
