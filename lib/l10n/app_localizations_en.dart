// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterPage => 'Counter Page';

  @override
  String get youHavePushedButton =>
      'You have pushed the button this many times:';

  @override
  String error(String error) {
    return 'Error: $error';
  }

  @override
  String get increment => 'Increment';

  @override
  String get decrement => 'Decrement';

  @override
  String get reset => 'Reset';

  @override
  String get installationCompleted => 'Installation completed';

  @override
  String get addOtherEquipment => 'Add other equipment to this network...';

  @override
  String get networkReady => 'Your network is ready to go!';

  @override
  String get internet => 'Internet';

  @override
  String get clickToEdit => 'Click to Edit';

  @override
  String get back => 'Back';

  @override
  String get addFloor => 'Add floor';

  @override
  String get wifiMap => 'Wi-Fi Map';

  @override
  String get noFloorsCreated => 'No floors created';

  @override
  String get addFloorHint =>
      'Click the button on the top right corner to add a floor.';

  @override
  String get firstFloor => 'First floor';

  @override
  String get edit => 'Edit';

  @override
  String zonesCount(int count) {
    return '$count zones';
  }

  @override
  String get wifiMapPage => 'Wi-Fi Map';

  @override
  String get noZones => '0 zones';

  @override
  String get wifiMapDialogTips => 'Tips';

  @override
  String get wifiMapDialogSelectTile => 'Select a tile to start a zone/room.';

  @override
  String get wifiMapDialogNext => 'Next';

  @override
  String get ok => 'OK';
}
