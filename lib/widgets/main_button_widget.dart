import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';

import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';

class MainButtonWidget extends StatelessWidget {
  final ButtonType? type;
  final VoidCallback? onPressed;
  final String? text;
  final double width;
  final Widget? child;

  MainButtonWidget(
      {this.type = ButtonType.PRIMARY,
      this.onPressed,
      this.text,
      this.child,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: kScreenHeightPercentage(context) * 0.3,
              decoration: BoxDecoration(
                color: getButtonColor(type!),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 1,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Center(
                child: text != null
                    ? Text(text!, style: ktsButtonWhiteText)
                    : child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return kcPrimaryColor;
    case ButtonType.ERROR:
      return kcErrorColor;
    case ButtonType.PLAIN:
      return kcWhiteColor;
    default:
      return kcPrimaryColor;
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return kcPrimaryColor;
    case ButtonType.ERROR:
      return kcWhiteColor;
    case ButtonType.PRIMARY:
      return kcWhiteColor;
    default:
      return kcWhiteColor;
  }
}
