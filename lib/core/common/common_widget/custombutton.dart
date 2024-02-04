import 'package:flutter/material.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      width: double.infinity,
      height: 57,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: TColor.primarybutton,
        ),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              fontSize: 18,
              color: TColor.white,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
