import 'package:flutter/material.dart';

import 'style/colors.dart';

class AppTheme {
  AppTheme();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.transparent,
    ),
  );
}