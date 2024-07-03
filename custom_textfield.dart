import 'package:flutter/material.dart';

// ignore: camel_case_types
import 'package:trecking_cuaca/styles.dart';

// ignore: camel_case_types
class customtextfield extends StatelessWidget {
  const customtextfield({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.body,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: hasSuffix
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: AppColors.darkGrey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: AppColors.darkGrey,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyles.body,
      ),
      
    );

  }
}
