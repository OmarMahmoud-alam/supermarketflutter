import 'package:flutter/material.dart';
import 'package:supermarket/core/theme/custom_text_style.dart';
import 'package:supermarket/core/theme/main_colors.dart';

class Custominputfield extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;

  final Widget prefixicon;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;

  const Custominputfield({
    super.key,
    required this.prefixicon,
    this.isPassword = false,
    required this.hintText,
    this.controller,
    this.validator,
    this.textInputType,
  });

  @override
  State<Custominputfield> createState() => _CustominputfieldState();
}

class _CustominputfieldState extends State<Custominputfield> {
  bool isPasswordVisible = false;

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          //  color: Colors.white,
          boxShadow: [
            if (isFocused)
              BoxShadow(
                color: Colors.brown.withOpacity(0.5), // Shadow color
                blurRadius: 4,
                offset: const Offset(4, 8), // Offset in the x, y directions
              ),
          ],
        ),
        child: Theme(
          data: themeData.copyWith(
              inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return TColor.primaryborder;
              }

              if (states.contains(MaterialState.error)) {
                return Colors.red;
              }
              return Colors.grey;
            }),
            suffixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return TColor.primaryborder;
              }

              if (states.contains(MaterialState.error)) {
                return Colors.red;
              }
              return Colors.grey;
            }),
          )),
          child: TextFormField(
            keyboardType: widget.textInputType,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.isPassword && !isPasswordVisible,
            decoration: InputDecoration(
              hintStyle: AppTextStyles.hinttextstyle,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TColor.primaryborder, width: 1.5),
                borderRadius: BorderRadius.circular(5.0),
              ),
              prefixIcon: widget.prefixicon,
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
