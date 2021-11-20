import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';

// Horizontal Spacing
const Widget kHorizontalSpaceTiny = SizedBox(width: 5.0);
const Widget kHorizontalSpaceSmall = SizedBox(width: 10.0);
const Widget kHorizontalSpaceRegular = SizedBox(width: 18.0);
const Widget kHorizontalSpaceMedium = SizedBox(width: 25.0);
const Widget kHorizontalSpaceLarge = SizedBox(width: 50.0);

const Widget kVerticalSpaceTiny = SizedBox(height: 5.0);
const Widget kVerticalSpaceSmall = SizedBox(height: 10.0);
const Widget kVerticalSpaceRegular = SizedBox(height: 18.0);
const Widget kVerticalSpaceMedium = SizedBox(height: 25.0);
const Widget kVerticalSpaceLarge = SizedBox(height: 50.0);

// Screen Size helpers
double kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double kScreenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    kScreenHeight(context) * percentage;

double kScreenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    kScreenWidth(context) * percentage;

// duration
const Duration kAnimationDuration = Duration(milliseconds: 500);

// Page paddings
const EdgeInsetsGeometry kPagePadding = EdgeInsets.only(
  top: 5,
  left: 15,
  right: 15,
  bottom: 10,
);

/// Color [dark, light] based on background color
Color calculateTextColor(Color background) {
  return background.computeLuminance() >= 0.5
      ? kcPlaceholderColor
      : kcWhiteColor;
}
