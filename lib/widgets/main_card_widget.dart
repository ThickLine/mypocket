import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/main_button_widget.dart';

class MainCardWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final String? title;
  final double? width;
  final double? height;

  const MainCardWidget({
    Key? key,
    this.onPressed,
    this.child,
    this.title,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainButtonWidget(
            elevation: false,
            width: width ?? kScreenWidthPercentage(context) * 0.8,
            height: height ?? kScreenHeightPercentage(context) * 0.4,
            onPressed: onPressed,
            type: ButtonType.PLAIN,
            child: child),
        title != null
            ? Positioned(
                top: 0,
                left: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: kcBlackColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: Text(title ?? "", style: ktsButtonWhiteText),
                ),
              )
            : Container()
      ],
    );
  }
}
