import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/views/screen/screen_viewmodel.dart';
import 'package:my_pocket/widgets/image_wrapper_widget.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';
import 'package:my_pocket/widgets/views/image_widget.dart';
import 'package:my_pocket/widgets/views/pdf_widget.dart';
import 'package:stacked/stacked.dart';

class ScreenView extends StatelessWidget {
  final FileModel? file;

  const ScreenView({
    Key? key,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenViewModel>.reactive(
      onModelReady: (model) => model.init(file),
      builder: (context, model, child) => MainCardWidget(
          title: model.file!.name,
          width: kScreenWidthPercentage(context) * 0.8,
          onPressed: model.onImageTap,
          child: ImageWrapperWidget(
              child: getViewForIndex(model.file!.ext!, model))),
      viewModelBuilder: () => ScreenViewModel(),
    );
  }

  Widget getViewForIndex(String type, model) {
    switch (type) {
      case ".pdf":
        return PdfWidget(
          path: model.file?.path,
          onPressed: model.onFileUpload,
        );

      default:
        return ImageWidget(
          fit: BoxFit.cover,
          path: model.file?.path,
          onPressed: model.onFileUpload,
        );
    }
  }
}
