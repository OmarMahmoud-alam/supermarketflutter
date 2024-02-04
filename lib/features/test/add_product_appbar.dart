import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*  leading: IconButton(
        icon: const Icon(Icons.ac_unit),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),*/
      elevation: 0,
      title: Text(
        'إضافة منتجات',
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
