import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';

import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';

class MainButtonWidget extends StatelessWidget {
  final ButtonType? type;
  final VoidCallback? onPressed;
  final bool elevation;
  final String? text;
  final double? width;
  final double? height;

  final Widget? child;

  const MainButtonWidget(
      {Key? key,
      this.type = ButtonType.PRIMARY,
      this.onPressed,
      this.text,
      this.child,
      this.elevation = true,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? kScreenWidthPercentage(context) * 0.8,
      height: height ?? kScreenHeightPercentage(context) * 0.4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: this.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: getButtonColor(type!),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: elevation == true
                        ? [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 1,
                              offset: const Offset(2, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: text != null
                        ? Text(text!, style: ktsButtonWhiteText)
                        : child,
                  ),
                ),
              ),
            ],
          ),
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
