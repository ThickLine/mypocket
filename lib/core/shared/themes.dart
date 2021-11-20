import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';

final _lightThemeData = ThemeData.light();
final _darkThemeData = ThemeData.dark();

final darkTheme = _darkThemeData.copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kcDarkBackgroundColor,
  backgroundColor: kcDarkBackgroundColor,
  primaryColor: kcPrimaryColor,
  indicatorColor: Colors.red,
);

final lightTheme = _lightThemeData.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    scaffoldBackgroundColor: kcBackgroundColor,
    backgroundColor: kcBackgroundColor,
    primaryColor: kcPrimaryColor,
    unselectedWidgetColor: kcBlackColor,
    disabledColor: kcPrimaryColor);




// final primaryMaterialTheme = _lightThemeData.copyWith(
//   textTheme: ThemeData.light().textTheme.apply(
//         fontFamily: 'Avenir',
//       ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     foregroundColor: Colors.black,
//   ),
//   appBarTheme: ThemeData.light().appBarTheme.copyWith(
//         backgroundColor: kcPrimaryColor,
//       ),
//   primaryColor: kcPrimaryColor,
//   backgroundColor: kcBackgroundColor,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   unselectedWidgetColor: kcBlackColor,
//   disabledColor: kcPrimaryColor,
// );
// final darkMaterialTheme = _darkThemeData.copyWith(
//     textTheme: ThemeData.dark().textTheme.apply(
//           fontFamily: 'Avenir',
//         ),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       foregroundColor: Colors.black,
//     ),
//     appBarTheme: ThemeData.dark().appBarTheme.copyWith(
//           backgroundColor: kcPrimaryColor,
//         ),
//     primaryColor: kcPrimaryColor,
//     backgroundColor: Colors.black,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     unselectedWidgetColor: kcBlackColor,
//     disabledColor: kcPrimaryColor);

// final primaryCupertinoTheme = CupertinoThemeData(
//   primaryColor: Colors.black,
//   barBackgroundColor: Colors.black,
//   scaffoldBackgroundColor: Colors.black,
// );

// final buttonOutlineTheme = ButtonStyle(
//     padding: MaterialStateProperty.all<EdgeInsets>(
//         EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
//     foregroundColor: MaterialStateProperty.all<Color>(kcBlackColor),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(side: BorderSide(color: kcBlackColor))));

// final buttonOutlineActiveTheme = ButtonStyle(
//     padding: MaterialStateProperty.all<EdgeInsets>(
//         EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
//     foregroundColor: MaterialStateProperty.all<Color>(kcPrimaryColor),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(side: BorderSide(color: kcPrimaryColor))));

// final buttonOutlineDisableTheme = ButtonStyle(
//     padding: MaterialStateProperty.all<EdgeInsets>(
//         EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
//     foregroundColor: MaterialStateProperty.all<Color>(kcPlaceholderColor),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(side: BorderSide(color: kcPlaceholderColor))));


