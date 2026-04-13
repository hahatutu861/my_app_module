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
}
