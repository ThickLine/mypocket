


import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get darkLightTitle => 'Light/Dark Theme';

  @override
  String get isSecure => 'Use biometrics';

  @override
  String get back => 'Back';

  @override
  String get settingViewTitle => 'Setting View';

  @override
  String get uploadViewTitle => 'Upload File';

  @override
  String get namePlacholder => 'Name';

  @override
  String get loginTitle => 'Enter';

  @override
  String get itemViewTitle => 'File View';

  @override
  String get deleteTitle => 'Delete Item';

  @override
  String get deleteQuestion => 'Are you sure you want to delete this file?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get languageSwitchTitle => 'Change language';

  @override
  String get languageEN => 'English';

  @override
  String get languageLV => 'Latviešu';

  @override
  String get localizedReasonTitle => 'Please authenticate to access content';

  @override
  String get versionTitle => 'This app is running version';

  @override
  String get authTitle => 'Scan your fingerprint (or face or whatever) to authenticate';

  @override
  String get deleteAllFilesTitle => 'Wipe all';

  @override
  String get deleteAllFilesQuestion => 'This is irreversible! Are you sure?';

  @override
  String get fileUnsuccessfulUploadMessage => 'Couldn\'t save the file';

  @override
  String get fileUnsuccessfulUploadDescription => 'Probably permission was denied';

  @override
  String get snackbarInfoItemTapTitle => 'Did you want to open the file?';

  @override
  String get snackbarInfoItemTapDescription => 'Longpress to see file in a full preview';
}
