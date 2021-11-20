import 'package:flutter/material.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/views/screen/screen_viewmodel.dart';
import 'package:my_pocket/widgets/image_wrapper_widget.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';
import 'package:my_pocket/widgets/views/image_widget.dart';
import 'package:my_pocket/widgets/views/pdf_widget.dart';
import 'package:stacked/stacked.dart';

class ScreenView extends StatelessWidget {
  final FileModel? file;
  const ScreenView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScreenViewModel>.reactive(
      onModelReady: (model) => model.init(file),
      builder: (context, model, child) => Scaffold(
          body: Hero(
        tag: "item",
        child: MainCardWidget(
            onPressed: model.onImageTap,
            child: ImageWrapperWidget(
                child: getViewForIndex(model.file!.ext!, model))),
      )),
      viewModelBuilder: () => ScreenViewModel(),
    );
  }

  Widget getViewForIndex(String type, model) {
    switch (type) {
      case ".pdf":
        return PdfWidget(
          file: file,
          onPressed: model.onFileUpload,
        );

      default:
        return ImageWidget(
          file: file,
          onPressed: model.onFileUpload,
        );
    }
  }
}