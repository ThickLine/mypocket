import 'package:flutter/material.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/layout/main_layout.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/views/setting/setting_viewmodel.dart';
import 'package:my_pocket/widgets/main_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingView extends StatelessWidget {
  final FileModel? file;
  const SettingView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => MainLayout(
        name: AppLocalizations.of(context)!.settingViewTitle,
        child: Material(
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SwitchListTile(
                        onChanged: (value) => {
                          model.onThemeChange(value),
                          if (value == true)
                            getThemeManager(context)
                                .setThemeMode(ThemeMode.dark),
                          if (value == false)
                            getThemeManager(context)
                                .setThemeMode(ThemeMode.light),
                        },
                        title:
                            Text(AppLocalizations.of(context)!.darkLightTitle),
                        value: model.setting.dark!,
                      ),
                      if (model.canCheckBiometrics == true)
                        SwitchListTile(
                          onChanged: model.onSecureChange,
                          title: Text(AppLocalizations.of(context)!.isSecure),
                          value: model.setting.isSecure!,
                        ),
                      ListTile(
                          onTap: model.onLanguageChange,
                          title: Text(AppLocalizations.of(context)!
                              .languageSwitchTitle),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .localeName
                                  .toUpperCase()),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )),
                      ListTile(
                        title: Text(AppLocalizations.of(context)!.versionTitle),
                        trailing: Container(
                            padding: kPagePadding, child: Text(model.version)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: kPagePadding,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 60,
                              child: MainButtonWidget(
                                onPressed: model.deletePocket,
                                type: ButtonType.ERROR,
                                text: "Delete Content",
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SettingViewModel(),
    );
  }
}
