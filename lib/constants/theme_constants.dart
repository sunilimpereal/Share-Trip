import 'package:flutter/material.dart';
import 'package:share_trip/constants/color_constants.dart';

class ThemeConstants {
  static ThemeData minaTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
    scaffoldBackgroundColor: ColorConstants.scaffoldBg,
    appBarTheme: AppBarTheme(
      color: ColorConstants.scaffoldBg,
    ),
    useMaterial3: true
  );
}
