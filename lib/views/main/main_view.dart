import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/layout/home_layout.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/views/main/main_viewmodel.dart';
import 'package:my_pocket/views/screen/screen_view.dart';
import 'package:my_pocket/widgets/upload_card/upload_card_view.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  final int? initialPage;
  const MainView({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).backgroundColor,
            onTap: (value) => model.onSettingRoute(),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Container(), label: ""),
              BottomNavigationBarItem(icon: Container(), label: ""),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.settingsTitle,
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: SafeArea(
            child: HomeLayout(
                onPressed: model.onFileUpload,
                toolbar: Text(model.date, style: ktsMediumGreyLabelText),
                child: model.isList == true
                    ? Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ScreenView(file: model.pocket!.files![index]),
                            ],
                          );
                        },
                        itemCount: model.pocket!.files!.length,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                color: kcPlaceholderColor,
                                activeColor: Theme.of(context).indicatorColor),
                            margin: const EdgeInsets.all(5.0)),
                        control: const SwiperControl(color: kcPlaceholderColor),
                        viewportFraction: 0.8,
                        scale: 0.9,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UploadCardView(onPressed: model.onFileUpload),
                        ],
                      )),
          )),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
