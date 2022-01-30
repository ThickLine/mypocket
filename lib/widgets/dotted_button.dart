import 'package:flutter/material.dart';

class DottedButton extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Icon icon;
  final VoidCallback? onPressed;
  final String? text;

  const DottedButton(
      {Key? key,
      this.borderColor = Colors.black38,
      this.onPressed,
      this.text,
      this.icon = const Icon(Icons.add),
      this.width = 50.0,
      this.height = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).hintColor),
          borderRadius: const BorderRadius.all(Radius.circular(7.0))),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: 30.0,
      ),
    );
  }
}
