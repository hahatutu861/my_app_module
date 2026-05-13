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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zones',
      one: '1 zone',
      zero: 'Aucune zone',
    );
    return '$_temp0';
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

  @override
  String get editFloorName => 'Modifier le nom de l\'étage';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get floorNameHint => 'Nom de l\'étage';

  @override
  String get roomBackyard => 'Cour';

  @override
  String get roomBathroom => 'Salle de bain';

  @override
  String get roomBedroom => 'Chambre';

  @override
  String get roomDiningRoom => 'Salle à manger';

  @override
  String get roomDressingRoom => 'Dressing';

  @override
  String get roomGames => 'Jeux';

  @override
  String get roomGarage => 'Garage';

  @override
  String get roomGym => 'Salle de sport';

  @override
  String get roomHomeTheater => 'Home cinéma';

  @override
  String get roomKitchen => 'Cuisine';

  @override
  String get roomLivingRoom => 'Salon';

  @override
  String get roomLobby => 'Hall';

  @override
  String get roomOffice => 'Bureau';

  @override
  String get roomPatio => 'Terrasse';

  @override
  String get roomPool => 'Piscine';

  @override
  String get roomStairs => 'Escalier';

  @override
  String get roomStorage => 'Rangement';

  @override
  String get roomUtility => 'Buanderie';

  @override
  String get editNameAndType => 'Modifier le nom et le type';

  @override
  String get addNameAndIconHint =>
      'Ajoutez un nom et une icône pour retrouver votre pièce plus tard.';

  @override
  String get roomNameLabel => 'Nom de la pièce';

  @override
  String get roomNameHint => 'ex. \'Pour serveur web\'';

  @override
  String get roomTypeLabel => 'Type de pièce';

  @override
  String get wifiAccessPointQuestion => 'Y a-t-il un point d\'accès Wi-Fi ?';

  @override
  String get gateway => 'Passerelle';

  @override
  String get router => 'Routeur';

  @override
  String get extender => 'Extender';

  @override
  String get deleteZoneRoom => 'Supprimer cette zone/pièce';

  @override
  String get deleteFloor => 'Supprimer';
}
