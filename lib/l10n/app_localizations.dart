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
  /// **'{count, plural, =0{0 zones} =1{1 zone} other{{count} zones}}'**
  String zonesCount(int count);

  /// No description provided for @wifiMapStatsTips.
  ///
  /// In en, this message translates to:
  /// **'Tips:'**
  String get wifiMapStatsTips;

  /// No description provided for @wifiMapStatsClickZonesHint.
  ///
  /// In en, this message translates to:
  /// **'You must click zones to test Wi-Fi.'**
  String get wifiMapStatsClickZonesHint;

  /// No description provided for @wifiMapStatsWalkHint.
  ///
  /// In en, this message translates to:
  /// **'Walk to into zone/room and select it to test the Wi-Fi speed at that location.'**
  String get wifiMapStatsWalkHint;

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

  /// No description provided for @roomBackyard.
  ///
  /// In en, this message translates to:
  /// **'Backyard'**
  String get roomBackyard;

  /// No description provided for @roomBathroom.
  ///
  /// In en, this message translates to:
  /// **'Bathroom'**
  String get roomBathroom;

  /// No description provided for @roomBedroom.
  ///
  /// In en, this message translates to:
  /// **'Bedroom'**
  String get roomBedroom;

  /// No description provided for @roomDiningRoom.
  ///
  /// In en, this message translates to:
  /// **'Dining Room'**
  String get roomDiningRoom;

  /// No description provided for @roomDressingRoom.
  ///
  /// In en, this message translates to:
  /// **'Dressing Room'**
  String get roomDressingRoom;

  /// No description provided for @roomGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get roomGames;

  /// No description provided for @roomGarage.
  ///
  /// In en, this message translates to:
  /// **'Garage'**
  String get roomGarage;

  /// No description provided for @roomGym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get roomGym;

  /// No description provided for @roomHomeTheater.
  ///
  /// In en, this message translates to:
  /// **'Home Theater'**
  String get roomHomeTheater;

  /// No description provided for @roomKitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get roomKitchen;

  /// No description provided for @roomLivingRoom.
  ///
  /// In en, this message translates to:
  /// **'Living Room'**
  String get roomLivingRoom;

  /// No description provided for @roomLobby.
  ///
  /// In en, this message translates to:
  /// **'Lobby'**
  String get roomLobby;

  /// No description provided for @roomOffice.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get roomOffice;

  /// No description provided for @roomPatio.
  ///
  /// In en, this message translates to:
  /// **'Patio'**
  String get roomPatio;

  /// No description provided for @roomPool.
  ///
  /// In en, this message translates to:
  /// **'Pool'**
  String get roomPool;

  /// No description provided for @roomStairs.
  ///
  /// In en, this message translates to:
  /// **'Stairs'**
  String get roomStairs;

  /// No description provided for @roomStorage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get roomStorage;

  /// No description provided for @roomUtility.
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get roomUtility;

  /// No description provided for @editNameAndType.
  ///
  /// In en, this message translates to:
  /// **'Edit name and type'**
  String get editNameAndType;

  /// No description provided for @addNameAndIconHint.
  ///
  /// In en, this message translates to:
  /// **'Add a name and icon so you can find your room later on.'**
  String get addNameAndIconHint;

  /// No description provided for @roomDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Room details'**
  String get roomDetailsLabel;

  /// No description provided for @roomNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Room name'**
  String get roomNameLabel;

  /// No description provided for @roomNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. \'For Web Server\''**
  String get roomNameHint;

  /// No description provided for @roomTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Room type'**
  String get roomTypeLabel;

  /// No description provided for @wifiAccessPointQuestion.
  ///
  /// In en, this message translates to:
  /// **'Is there a Wi-Fi access point?'**
  String get wifiAccessPointQuestion;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'(Optional)'**
  String get optional;

  /// No description provided for @gateway.
  ///
  /// In en, this message translates to:
  /// **'Gateway'**
  String get gateway;

  /// No description provided for @router.
  ///
  /// In en, this message translates to:
  /// **'Router'**
  String get router;

  /// No description provided for @extender.
  ///
  /// In en, this message translates to:
  /// **'Extender'**
  String get extender;

  /// No description provided for @deleteZoneRoom.
  ///
  /// In en, this message translates to:
  /// **'Delete this zone/room'**
  String get deleteZoneRoom;

  /// No description provided for @deleteFloor.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteFloor;

  /// No description provided for @deleteFloorConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete {itemName}?'**
  String deleteFloorConfirmTitle(String itemName);

  /// No description provided for @deleteFloorConfirmDescription.
  ///
  /// In en, this message translates to:
  /// **'Once deleted, it cannot be restored.'**
  String get deleteFloorConfirmDescription;

  /// No description provided for @showPreviousFloorReference.
  ///
  /// In en, this message translates to:
  /// **'Show previous floor reference.'**
  String get showPreviousFloorReference;

  /// No description provided for @wifiSpeedDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your Wi-Fi speed?'**
  String get wifiSpeedDialogTitle;

  /// No description provided for @wifiSpeedDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This is the Wi-Fi speed between this device and your Wi-Fi equipment.'**
  String get wifiSpeedDialogSubtitle;

  /// No description provided for @wifiSpeedGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get wifiSpeedGood;

  /// No description provided for @wifiSpeedGoodDescription.
  ///
  /// In en, this message translates to:
  /// **': This zone has a good Wi-Fi coverage. Your devices should have a stable Wi-Fi connection for any content/usage.'**
  String get wifiSpeedGoodDescription;

  /// No description provided for @wifiSpeedModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get wifiSpeedModerate;

  /// No description provided for @wifiSpeedModerateDescription.
  ///
  /// In en, this message translates to:
  /// **': This zone\'s Wi-Fi connection should be still be fine but that is the limit of a good signal. Beyond that zone, an extender would be required.'**
  String get wifiSpeedModerateDescription;

  /// No description provided for @wifiSpeedWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get wifiSpeedWeak;

  /// No description provided for @wifiSpeedWeakDescription.
  ///
  /// In en, this message translates to:
  /// **': Your devices may experiment some problems. To improve this zone, you will need to bring your Wi-Fi equipment closer to this zone/room or add an extender close by*.'**
  String get wifiSpeedWeakDescription;

  /// No description provided for @wifiSpeedExtenderHint.
  ///
  /// In en, this message translates to:
  /// **'*Adding an extender: \nIf you decide to add an extender, It should not be installed in yellow or red zone since it will also receive bad Wi-Fi (unless you are connecting it to your router with an Ethernet cable). Install it in a room that receive good Wi-Fi signal between this zone and your closest Wi-Fi equipment.'**
  String get wifiSpeedExtenderHint;

  /// No description provided for @wifiMapUnitMbps.
  ///
  /// In en, this message translates to:
  /// **'(Unit:Mbps)'**
  String get wifiMapUnitMbps;

  /// No description provided for @wifiSpeedMbps.
  ///
  /// In en, this message translates to:
  /// **'Mbps'**
  String get wifiSpeedMbps;

  /// No description provided for @wifiSpeedGoodStatus.
  ///
  /// In en, this message translates to:
  /// **'Good Wi-Fi'**
  String get wifiSpeedGoodStatus;

  /// No description provided for @wifiSpeedModerateStatus.
  ///
  /// In en, this message translates to:
  /// **'Moderate Wi-Fi'**
  String get wifiSpeedModerateStatus;

  /// No description provided for @wifiSpeedWeakStatus.
  ///
  /// In en, this message translates to:
  /// **'Weak Wi-Fi'**
  String get wifiSpeedWeakStatus;

  /// No description provided for @wifiSpeedBand.
  ///
  /// In en, this message translates to:
  /// **'Band'**
  String get wifiSpeedBand;

  /// No description provided for @wifiSpeedConnectedTo.
  ///
  /// In en, this message translates to:
  /// **'Connected to'**
  String get wifiSpeedConnectedTo;

  /// No description provided for @wifiSpeedHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get wifiSpeedHistory;

  /// No description provided for @wifiSpeedHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'{roomName}’s history list'**
  String wifiSpeedHistoryTitle(String roomName);

  /// No description provided for @wifiSpeedTest.
  ///
  /// In en, this message translates to:
  /// **'Test Wi-Fi'**
  String get wifiSpeedTest;

  /// No description provided for @wifiSpeedStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get wifiSpeedStop;

  /// No description provided for @wifiSpeedTesting.
  ///
  /// In en, this message translates to:
  /// **'Testing ({progress})'**
  String wifiSpeedTesting(int progress);

  /// No description provided for @connectToWifiConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to Wi-Fi network'**
  String get connectToWifiConfirmTitle;

  /// No description provided for @connectToWifiConfirmDescription.
  ///
  /// In en, this message translates to:
  /// **'Please go to your settings to connect to your Wi-Fi network {wifiName}.'**
  String connectToWifiConfirmDescription(String wifiName);

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to settings'**
  String get goToSettings;

  /// No description provided for @wifiSpeedHistoryEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No speed tests recorded'**
  String get wifiSpeedHistoryEmptyTitle;

  /// No description provided for @wifiSpeedHistoryEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Go to that zone/room to test its Wi-Fi speed.'**
  String get wifiSpeedHistoryEmptyDescription;
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
