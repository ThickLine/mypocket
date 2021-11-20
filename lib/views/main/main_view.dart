import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';

import 'package:my_pocket/layout/home_layout.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/views/main/main_viewmodel.dart';
import 'package:my_pocket/views/screen/screen_view.dart';
import 'package:my_pocket/views/setting/setting_view.dart';
import 'package:my_pocket/widgets/main_card_widget.dart';

import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  final int? initialPage;
  const MainView({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _controller =
        PageController(initialPage: initialPage!);
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          onTap: (value) => model.onSettingRoute(),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Container(), label: ""),
            BottomNavigationBarItem(icon: Container(), label: ""),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settingsTitle,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SafeArea(
            child: HomeLayout(
          onPressed: model.onFileUpload,
          toolbar: Text(model.date, style: ktsMediumGreyLabelText),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: model.pocket!.files != null
                      ? model.pocket!.files!
                          .map((e) => ScreenView(file: e))
                          .toList()
                      : [
                          MainCardWidget(
                            onPressed: model.onFileUpload,
                            child: const Icon(
                              Icons.picture_as_pdf_outlined,
                              size: 80,
                            ),
                          )
                        ],
                ),
              ),
            ],
          ),
        )),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
