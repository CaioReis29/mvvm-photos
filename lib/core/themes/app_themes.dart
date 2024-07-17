
import 'package:flutter/material.dart';
import 'package:mvvm_example/core/themes/app_colors.dart';
import 'package:mvvm_example/core/themes/app_text_styles.dart';
import 'package:mvvm_example/core/themes/design_system.dart';

class AppThemes {
  static ThemeData get darkTheme => ThemeData(
    extensions: [
      DesignSystemExample()
      ..primary = AppColors.primary
      ..textColor = AppColors.white
      ..backgroundColor = AppColors.backgroundSplash
      ..defaultTextStyle = AppTextStyles.montserratBolds18
      ..defaultAppBarTheme = AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.blue,
        titleTextStyle: AppTextStyles.montserratBolds20,
        elevation: 4,
      ),
    ],
  );
}