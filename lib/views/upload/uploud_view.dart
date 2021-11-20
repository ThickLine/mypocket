import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/layout/main_layout.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/views/upload/uploud_view.form.dart';
import 'package:my_pocket/views/upload/uploud_viewmodel.dart';
import 'package:my_pocket/widgets/action_button_widget.dart';
import 'package:my_pocket/widgets/animation/widget_transition.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';
import 'package:my_pocket/widgets/views/image_widget.dart';
import 'package:my_pocket/widgets/views/pdf_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
])
class UploadView extends StatelessWidget with $UploadView {
  final bool preview;
  UploadView({Key? key, this.preview = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadViewModel>.reactive(
      onModelReady: (model) => {model.init(), listenToFormUpdated(model)},
      builder: (context, model, child) => Scaffold(
          body: MainLayout(
        onTapBack: model.onRouteBack,
        name: AppLocalizations.of(context)!.uploadViewTitle,
        child: Container(
            padding: kPagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                model.isBusy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!
                                      .namePlacholder),
                              controller: nameController,
                            ),
                            kVerticalSpaceRegular,
                            Center(
                              child: MainCardWidget(
                                onPressed: model.uploadFile,
                                child: model.file.path != null
                                    ? getViewForIndex(model.file.ext!, model)
                                    : Icon(
                                        Icons.qr_code_2_outlined,
                                        size: 80,
                                        color: kcBlackColor,
                                      ),
                              ),
                            ),
                            kVerticalSpaceLarge,
                            model.file.path != null
                                ? WidgetTransition(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ActionButtonWidget(
                                          type: ActionButtonType.CLOSE,
                                          onPressed: model.onResetFile,
                                        ),
                                        ActionButtonWidget(
                                          type: ActionButtonType.ACCEPT,
                                          onPressed: model.onAddFile,
                                        ),
                                      ],
                                    ),
                                  )
                                : WidgetTransition(child: Container())
                          ],
                        ),
                      ),
                kVerticalSpaceMedium,
              ],
            )),
      )),
      viewModelBuilder: () => UploadViewModel(),
    );
  }

  Widget getViewForIndex(String type, model) {
    switch (type) {
      case ".pdf":
        return PdfWidget(
          file: model.file,
        );

      default:
        return ImageWidget(
          file: model.file,
        );
    }
  }
}
