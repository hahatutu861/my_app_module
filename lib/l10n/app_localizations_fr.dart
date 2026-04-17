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

  @override
  String get back => 'Retour';

  @override
  String get addFloor => 'Ajouter un étage';

  @override
  String get wifiMap => 'Carte Wi-Fi';

  @override
  String get noFloorsCreated => 'Aucun étage créé';

  @override
  String get addFloorHint =>
      'Cliquez sur le bouton en haut à droite pour ajouter un étage.';

  @override
  String get firstFloor => 'Premier étage';

  @override
  String get edit => 'Modifier';

  @override
  String zonesCount(int count) {
    return '$count zones';
  }

  @override
  String get wifiMapPage => 'Carte Wi-Fi';

  @override
  String get noZones => '0 zones';

  @override
  String get wifiMapDialogTips => 'Conseils';

  @override
  String get wifiMapDialogSelectTile =>
      'Sélectionnez une tuile pour commencer une zone/salle.';

  @override
  String get wifiMapDialogNext => 'Suivant';

  @override
  String get ok => 'OK';
}
