import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';
import 'package:my_pocket/widgets/upload_card/upload_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UploadCardView extends StatelessWidget {
  final VoidCallback? onPressed;

  const UploadCardView({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadCardViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => MainCardWidget(
          width: kScreenWidthPercentage(context) * 0.8,
          onPressed: onPressed,
          child: Icon(
            getIconData(model.icon),
            size: 80,
            color: kcBlackColor,
          )),
      viewModelBuilder: () => UploadCardViewModel(),
    );
  }

  IconData getIconData(
    String type,
  ) {
    switch (type) {
      case "pdf":
        return Icons.picture_as_pdf_outlined;
      case "qr":
        return Icons.qr_code_2_outlined;

      default:
        return Icons.image_outlined;
    }
  }
}
