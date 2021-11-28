import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';

final _lightThemeData = ThemeData.light();
final _darkThemeData = ThemeData.dark();

final darkTheme = _darkThemeData.copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kcDarkBackgroundColor,
  backgroundColor: kcBlackColor,
  primaryColor: kcPrimaryColor,
  shadowColor: kcBlackColor,
  disabledColor: kcPlaceholderColor,
  indicatorColor: kcWhiteColor,
);

final lightTheme = _lightThemeData.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    scaffoldBackgroundColor: kcBackgroundColor,
    backgroundColor: kcBackgroundColor,
    primaryColor: kcPrimaryColor,
    unselectedWidgetColor: kcBlackColor,
    shadowColor: Colors.blueGrey,
    disabledColor: kcPlaceholderColor,
    indicatorColor: kcBlackColor);
