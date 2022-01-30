import 'package:flutter/material.dart';

class UploadCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Widget? child;
  final VoidCallback? onPressed;
  final String? text;

  const UploadCardWidget(
      {Key? key,
      this.borderColor = Colors.black38,
      this.onPressed,
      this.text,
      this.child = const Icon(Icons.add),
      this.width = 50.0,
      this.height = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(7.0))),
        child: child);
  }
}
