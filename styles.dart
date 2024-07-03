import 'package:flutter/material.dart';

class AppColors {
  static const darkGrey = Color(0XFF635C5C);
  static const darkblue = Color(0XFF0B6EFE);
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: "Outfif",
    fontWeight: FontWeight.bold,
    fontSize: 18.0
  );
  static TextStyle body = const TextStyle(
    fontFamily: 'Outfif',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );
}
