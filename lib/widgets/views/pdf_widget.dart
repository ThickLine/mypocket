import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PdfWidget extends StatelessWidget {
  final String? path;
  final void Function()? onPressed;

  const PdfWidget({Key? key, this.path, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return path != null
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: kScreenHeightPercentage(context) * 0.7,
            child: PdfViewer.openFile(
              path ?? "",
            ),
          )
        : MainCardWidget(
            onPressed: onPressed,
            child: const Icon(
              Icons.picture_as_pdf_outlined,
              size: 80,
              color: kcBlackColor,
            ),
          );
  }
}
