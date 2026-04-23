import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @counterPage.
  ///
  /// In en, this message translates to:
  /// **'Counter Page'**
  String get counterPage;

  /// No description provided for @youHavePushedButton.
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get youHavePushedButton;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String error(String error);

  /// No description provided for @increment.
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;

  /// No description provided for @decrement.
  ///
  /// In en, this message translates to:
  /// **'Decrement'**
  String get decrement;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @installationCompleted.
  ///
  /// In en, this message translates to:
  /// **'Installation completed'**
  String get installationCompleted;

  /// No description provided for @addOtherEquipment.
  ///
  /// In en, this message translates to:
  /// **'Add other equipment to this network...'**
  String get addOtherEquipment;

  /// No description provided for @networkReady.
  ///
  /// In en, this message translates to:
  /// **'Your network is ready to go!'**
  String get networkReady;

  /// No description provided for @internet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get internet;

  /// No description provided for @clickToEdit.
  ///
  /// In en, this message translates to:
  /// **'Click to Edit'**
  String get clickToEdit;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @addFloor.
  ///
  /// In en, this message translates to:
  /// **'Add floor'**
  String get addFloor;

  /// No description provided for @wifiMap.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Map'**
  String get wifiMap;

  /// No description provided for @noFloorsCreated.
  ///
  /// In en, this message translates to:
  /// **'No floors created'**
  String get noFloorsCreated;

  /// No description provided for @addFloorHint.
  ///
  /// In en, this message translates to:
  /// **'Click the button on the top right corner to add a floor.'**
  String get addFloorHint;

  /// No description provided for @firstFloor.
  ///
  /// In en, this message translates to:
  /// **'First floor'**
  String get firstFloor;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @zonesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No zones} =1{1 zone} other{{count} zones}}'**
  String zonesCount(int count);

  /// No description provided for @wifiMapPage.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Map'**
  String get wifiMapPage;

  /// No description provided for @noZones.
  ///
  /// In en, this message translates to:
  /// **'0 zones'**
  String get noZones;

  /// No description provided for @wifiMapDialogTips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get wifiMapDialogTips;

  /// No description provided for @wifiMapDialogSelectTile.
  ///
  /// In en, this message translates to:
  /// **'Select a tile to start a zone/room.'**
  String get wifiMapDialogSelectTile;

  /// No description provided for @wifiMapDialogNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get wifiMapDialogNext;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @editFloorName.
  ///
  /// In en, this message translates to:
  /// **'Edit floor name'**
  String get editFloorName;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @floorNameHint.
  ///
  /// In en, this message translates to:
  /// **'Floor name'**
  String get floorNameHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
