
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_lv.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'locale/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('lv')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @darkLightTitle.
  ///
  /// In en, this message translates to:
  /// **'Light/Dark Theme'**
  String get darkLightTitle;

  /// No description provided for @isSecure.
  ///
  /// In en, this message translates to:
  /// **'Use biometrics'**
  String get isSecure;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @settingViewTitle.
  ///
  /// In en, this message translates to:
  /// **'Setting View'**
  String get settingViewTitle;

  /// No description provided for @uploadViewTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload File'**
  String get uploadViewTitle;

  /// No description provided for @namePlacholder.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get namePlacholder;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get loginTitle;

  /// No description provided for @itemViewTitle.
  ///
  /// In en, this message translates to:
  /// **'File View'**
  String get itemViewTitle;

  /// No description provided for @deleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteTitle;

  /// No description provided for @deleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this file?'**
  String get deleteQuestion;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @languageSwitchTitle.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get languageSwitchTitle;

  /// No description provided for @languageEN.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEN;

  /// No description provided for @languageLV.
  ///
  /// In en, this message translates to:
  /// **'Latviešu'**
  String get languageLV;

  /// No description provided for @localizedReasonTitle.
  ///
  /// In en, this message translates to:
  /// **'Please authenticate to access content'**
  String get localizedReasonTitle;

  /// No description provided for @versionTitle.
  ///
  /// In en, this message translates to:
  /// **'This app is running version'**
  String get versionTitle;

  /// No description provided for @authTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan your fingerprint (or face or whatever) to authenticate'**
  String get authTitle;

  /// No description provided for @deleteAllFilesTitle.
  ///
  /// In en, this message translates to:
  /// **'Wipe all'**
  String get deleteAllFilesTitle;

  /// No description provided for @deleteAllFilesQuestion.
  ///
  /// In en, this message translates to:
  /// **'This is irreversible! Are you sure?'**
  String get deleteAllFilesQuestion;

  /// No description provided for @fileUnsuccessfulUploadMessage.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save the file'**
  String get fileUnsuccessfulUploadMessage;

  /// No description provided for @fileUnsuccessfulUploadDescription.
  ///
  /// In en, this message translates to:
  /// **'Probably permission was denied'**
  String get fileUnsuccessfulUploadDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'lv'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'lv': return AppLocalizationsLv();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
