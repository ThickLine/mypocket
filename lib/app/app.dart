import 'package:my_pocket/core/prefs/pref_handler.dart';
import 'package:my_pocket/services/auth.service.dart';
import 'package:my_pocket/services/file_helper.service.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:my_pocket/views/fullscreen/fullscreen_view.dart';
import 'package:my_pocket/views/item/item_view.dart';
import 'package:my_pocket/views/main/main_view.dart';
import 'package:my_pocket/views/setting/setting_view.dart';
import 'package:my_pocket/views/startup/startup_view.dart';
import 'package:my_pocket/views/upload/uploud_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ItemView),
    MaterialRoute(page: UploadView),
    MaterialRoute(page: FullScreenView),
    MaterialRoute(page: SettingView),
  ],
  dependencies: [
    // ?lazySingletons
    // stacked
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),

// Dependencies

    // MyPdfPockets
    LazySingleton(classType: FileService),
    // LazySingleton(classType: HiveService),
    LazySingleton(classType: AuthService),

    // utils service
    LazySingleton(classType: FileHelperService),
    LazySingleton(classType: TranslationService),

    // Presolve functions
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  //  logger
  logger: StackedLogger(),
)
class AppSetup {}
