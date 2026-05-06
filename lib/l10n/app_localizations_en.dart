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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zones',
      one: '1 zone',
      zero: 'No zones',
    );
    return '$_temp0';
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

  @override
  String get editFloorName => 'Edit floor name';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get floorNameHint => 'Floor name';

  @override
  String get roomBackyard => 'Backyard';

  @override
  String get roomBathroom => 'Bathroom';

  @override
  String get roomBedroom => 'Bedroom';

  @override
  String get roomDiningRoom => 'Dining Room';

  @override
  String get roomDressingRoom => 'Dressing Room';

  @override
  String get roomGames => 'Games';

  @override
  String get roomGarage => 'Garage';

  @override
  String get roomGym => 'Gym';

  @override
  String get roomHomeTheater => 'Home Theater';

  @override
  String get roomKitchen => 'Kitchen';

  @override
  String get roomLivingRoom => 'Living Room';

  @override
  String get roomLobby => 'Lobby';

  @override
  String get roomOffice => 'Office';

  @override
  String get roomPatio => 'Patio';

  @override
  String get roomPool => 'Pool';

  @override
  String get roomStairs => 'Stairs';

  @override
  String get roomStorage => 'Storage';

  @override
  String get roomUtility => 'Utility';

  @override
  String get editNameAndType => 'Edit name and type';

  @override
  String get addNameAndIconHint =>
      'Add a name and icon so you can find your room later on.';

  @override
  String get roomNameLabel => 'Room name';

  @override
  String get roomNameHint => 'e.g. \'For Web Server\'';

  @override
  String get roomTypeLabel => 'Room type';

  @override
  String get wifiAccessPointQuestion => 'Is there a Wi-Fi access point?';

  @override
  String get gateway => 'Gateway';

  @override
  String get extender => 'Extender';

  @override
  String get deleteZoneRoom => 'Delete this zone/room';
}
