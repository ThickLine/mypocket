import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';

class ImageWidget extends StatelessWidget {
  final String? path;
  final BoxFit fit;
  final void Function()? onPressed;
  const ImageWidget(
      {Key? key, this.path, this.onPressed, this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return path != null
        ? AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: fit,
                image: FileImage(File(path ?? "")),
              ),
            ),
            height: kScreenHeightPercentage(context) * 0.7,
          )
        : MainCardWidget(
            onPressed: onPressed,
            child: const Icon(
              Icons.qr_code_2_outlined,
              size: 80,
              color: kcBlackColor,
            ),
          );
  }
}
