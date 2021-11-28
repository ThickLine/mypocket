import 'package:flutter/material.dart';

// font
const String fontFamily = "Roboto";

// colors
const Color kcPrimaryColor = Color(0xff62B57D);
const Color kcBlackColor = Color(0xff000000);
const Color kcWhiteColor = Color(0xffFFFFFF);
const Color kcMediumGreyColor = Color(0xffAAAAAA);
const Color kcBackgroundColor = Color(0xffF6F5F5);
const Color kcPlaceholderColor = Color(0xffBFBFBF);
const Color kcErrorColor = Color(0xffB00020);
const Color kcInfoColor = Color(0xff5FB3CE);
const Color kcDarkBackgroundColor = Color.fromRGBO(31, 26, 36, 0.08);

// TextStyle

const TextStyle ktsMediumGreyLabelText = TextStyle(
    color: kcMediumGreyColor, fontSize: kLabelTextSize, fontFamily: fontFamily);

const TextStyle ktsButtonWhiteText = TextStyle(
    color: kcWhiteColor, fontSize: kButtonTextSize, fontFamily: fontFamily);

// Font Sizing
const double kButtonTextSize = 20;
const double kLabelTextSize = 16;

// Font weight
const FontWeight fontWeightBold = FontWeight.w600;
