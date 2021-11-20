import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/main_button_widget.dart';

class MainCardWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  MainCardWidget({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kScreenHeightPercentage(context) * 0.4,
      child: MainButtonWidget(
          onPressed: onPressed, type: ButtonType.PLAIN, child: child),
    );
  }
}
