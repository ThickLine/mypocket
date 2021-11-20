import 'package:flutter/material.dart';

import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/mixin/language.mixin.dart';

import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final _bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.FLOATING_BOX: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.SCROLLABLE_LIST: (context, sheetRequest, completer) =>
        _FullWidthBottomSheet(request: sheetRequest, completer: completer),
  };
  _bottomSheetService.setCustomSheetBuilders(builders);
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final ScrollController? scrollController;
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  const _FloatingBoxBottomSheet(
      {Key? key, this.request, this.completer, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          itemCount: AppLocalizations.supportedLocales.length,
          itemBuilder: (context, index) => ListTile(
                onTap: () => completer!(SheetResponse(
                    confirmed: true,
                    data:
                        AppLocalizations.supportedLocales[index].languageCode)),
                title: Text(
                  LanguageLocal.getDisplayLanguage(AppLocalizations
                          .supportedLocales[index].languageCode)!["nativeName"]!
                      .toUpperCase(),
                ),
                trailing: Icon(
                  Icons.check,
                  color:
                      AppLocalizations.supportedLocales[index].languageCode ==
                              request!.data
                          ? kcPrimaryColor
                          : Colors.transparent,
                ),
              )),
    );
  }
}

class _FullWidthBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  const _FullWidthBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 20.0,
            color: Colors.amber,
          ),
          // Expanded(...)
        ],
      ),
    );
  }
}
