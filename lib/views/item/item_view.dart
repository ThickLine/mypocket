import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/layout/main_layout.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/views/item/item_viewmodel.dart';
import 'package:my_pocket/widgets/action_button_widget.dart';
import 'package:my_pocket/widgets/views/image_widget.dart';
import 'package:my_pocket/widgets/views/pdf_widget.dart';
import 'package:stacked/stacked.dart';

class ItemView extends StatelessWidget {
  final FileModel? file;
  const ItemView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemViewModel>.reactive(
      onModelReady: (model) => model.init(file),
      builder: (context, model, child) => Scaffold(
          body: MainLayout(
        name: model.file?.name ?? AppLocalizations.of(context)!.itemViewTitle,
        child: Stack(
          children: [
            GestureDetector(
                onTap: model.onTap,
                onDoubleTap: model.onFullScreenTap,
                child: ListView(
                  children: [
                    Container(child: getViewForIndex(model.file!.ext!, model)),
                  ],
                )),
            Positioned(
                bottom: 20.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButtonWidget(
                        type: ActionButtonType.DELETE,
                        onPressed: model.onDelete),
                    ActionButtonWidget(
                      type: ActionButtonType.OPEN,
                      onPressed: () => model.openFile(),
                    ),
                  ],
                ))
          ],
        ),
      )),
      viewModelBuilder: () => ItemViewModel(),
    );
  }

  Widget getViewForIndex(String type, model) {
    switch (type) {
      case ".pdf":
        return PdfWidget(
          path: model.file?.path,
          onPressed: null,
        );

      default:
        return ImageWidget(
          fit: BoxFit.fitWidth,
          path: model.file?.path,
          onPressed: null,
        );
    }
  }
}
