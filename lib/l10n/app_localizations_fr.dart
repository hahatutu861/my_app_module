// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get counterPage => 'Page Compteur';

  @override
  String get youHavePushedButton =>
      'Vous avez appuyé sur le bouton ce nombre de fois:';

  @override
  String error(String error) {
    return 'Erreur: $error';
  }

  @override
  String get increment => 'Incrémenter';

  @override
  String get decrement => 'Décrémenter';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get installationCompleted => 'Installation terminée';

  @override
  String get addOtherEquipment =>
      'Ajouter d\'autres équipements à ce réseau...';

  @override
  String get networkReady => 'Votre réseau est prêt!';

  @override
  String get internet => 'Internet';

  @override
  String get clickToEdit => 'Cliquez pour modifier';
}
