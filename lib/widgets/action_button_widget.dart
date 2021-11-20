import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/styles.dart';

class ActionButtonWidget extends StatelessWidget {
  final ActionButtonType? type;
  final void Function()? onPressed;

  const ActionButtonWidget({Key? key, this.type, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 4.0,
      fillColor: getBgColor(type!),
      child: Icon(
        getIcon(type!),
        size: 45.0,
        color: kcBlackColor,
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }

  IconData getIcon(ActionButtonType type) {
    switch (type) {
      case ActionButtonType.DELETE:
        return Icons.delete;
      case ActionButtonType.OPEN:
        return Icons.folder;
      case ActionButtonType.CLOSE:
        return Icons.close;
      case ActionButtonType.ACCEPT:
        return Icons.done;
      default:
        return Icons.done;
    }
  }

  Color getBgColor(ActionButtonType type) {
    switch (type) {
      case ActionButtonType.DELETE:
        return kcBackgroundColor;
      case ActionButtonType.OPEN:
        return kcBackgroundColor;
      case ActionButtonType.CLOSE:
        return kcBackgroundColor;
      case ActionButtonType.ACCEPT:
        return kcBackgroundColor;
      default:
        return kcBackgroundColor;
    }
  }
}
