import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/core/managers/core_manager.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';
import 'package:my_pocket/mixin/lock_phone.mixin.dart';
import 'package:my_pocket/core/shared/themes.dart' as themes;
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/services/setup_bottom_sheet_base.dart';
import 'package:my_pocket/services/setup_dialoge_base.dart';
import 'package:my_pocket/services/setup_snackbar_base.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_pocket/models/setting_model/setting_model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await ThemeManager.initialise();
  await Hive.initFlutter();
  Hive.registerAdapter(MyPocketAdapter());
  Hive.registerAdapter(FileAdapter());
  Hive.registerAdapter(SettingAdapter());
  await Hive.openBox<MyPocketModel>("myFile");
  setupLocator();
  setupDialogUi();
  setupSnackBarBase();
  setupBottomSheetUi();
  runApp(MyPocketPass());
}

final _translationService = locator<TranslationService>();

class MyPocketPass extends StatelessWidget with PortraitModeMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CoreManager(
      child: ThemeBuilder(
        defaultThemeMode: ThemeMode.light,
        lightTheme: themes.lightTheme,
        darkTheme: themes.darkTheme,
        builder: (
          context,
          regularTheme,
          darkTheme,
          themeMode,
        ) =>
            MaterialApp(
          title: dotenv.env['NAME'] ?? "My Pocket",
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          locale: _translationService.appLocal,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
