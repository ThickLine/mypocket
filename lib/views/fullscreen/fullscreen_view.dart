import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/views/fullscreen/fullscreen_viewmodel.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:stacked/stacked.dart';

class FullScreenView extends StatelessWidget {
  final FileModel? file;
  const FullScreenView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FullScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBlackColor,
        body: SafeArea(
          child: GestureDetector(
            child: Center(
              child: Hero(tag: "item", child: getViewForType(file!.ext!)),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      viewModelBuilder: () => FullScreenViewModel(),
    );
  }

  Widget getViewForType(String type) {
    switch (type) {
      case ".pdf":
        return PdfViewer.openFile(
          file!.path!,
        );

      default:
        return Image.file(File(file!.path ?? ""));
    }
  }
}
