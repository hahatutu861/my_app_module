import 'package:flutter/material.dart';
import 'package:my_app_module/l10n/app_localizations.dart';

enum RoomType {
  backyard,
  bathroom,
  bedroom,
  diningRoom,
  dressingRoom,
  games,
  garage,
  gym,
  homeTheater,
  kitchen,
  livingRoom,
  lobby,
  office,
  patio,
  pool,
  stairs,
  storage,
  utility;

  String get imageName {
    switch (this) {
      case RoomType.backyard:
        return 'backyard';
      case RoomType.bathroom:
        return 'bathroom';
      case RoomType.bedroom:
        return 'bedroom';
      case RoomType.diningRoom:
        return 'dinning_room';
      case RoomType.dressingRoom:
        return 'dressing_room';
      case RoomType.games:
        return 'games';
      case RoomType.garage:
        return 'garage';
      case RoomType.gym:
        return 'gym';
      case RoomType.homeTheater:
        return 'home_theater';
      case RoomType.kitchen:
        return 'kitchen';
      case RoomType.livingRoom:
        return 'living_room';
      case RoomType.lobby:
        return 'lobby';
      case RoomType.office:
        return 'office';
      case RoomType.patio:
        return 'patio';
      case RoomType.pool:
        return 'pool';
      case RoomType.stairs:
        return 'stairs';
      case RoomType.storage:
        return 'storage';
      case RoomType.utility:
        return 'utility';
    }
  }

  String get imagePath => 'assets/images/$imageName.png';

  String getLocalizationKey() {
    switch (this) {
      case RoomType.backyard:
        return 'roomBackyard';
      case RoomType.bathroom:
        return 'roomBathroom';
      case RoomType.bedroom:
        return 'roomBedroom';
      case RoomType.diningRoom:
        return 'roomDiningRoom';
      case RoomType.dressingRoom:
        return 'roomDressingRoom';
      case RoomType.games:
        return 'roomGames';
      case RoomType.garage:
        return 'roomGarage';
      case RoomType.gym:
        return 'roomGym';
      case RoomType.homeTheater:
        return 'roomHomeTheater';
      case RoomType.kitchen:
        return 'roomKitchen';
      case RoomType.livingRoom:
        return 'roomLivingRoom';
      case RoomType.lobby:
        return 'roomLobby';
      case RoomType.office:
        return 'roomOffice';
      case RoomType.patio:
        return 'roomPatio';
      case RoomType.pool:
        return 'roomPool';
      case RoomType.stairs:
        return 'roomStairs';
      case RoomType.storage:
        return 'roomStorage';
      case RoomType.utility:
        return 'roomUtility';
    }
  }

  String getDisplayName(BuildContext context) {
    final l10n = Localizations.of<AppLocalizations>(context, AppLocalizations);
    if (l10n == null) {
      return _defaultName;
    }
    switch (this) {
      case RoomType.backyard:
        return l10n.roomBackyard;
      case RoomType.bathroom:
        return l10n.roomBathroom;
      case RoomType.bedroom:
        return l10n.roomBedroom;
      case RoomType.diningRoom:
        return l10n.roomDiningRoom;
      case RoomType.dressingRoom:
        return l10n.roomDressingRoom;
      case RoomType.games:
        return l10n.roomGames;
      case RoomType.garage:
        return l10n.roomGarage;
      case RoomType.gym:
        return l10n.roomGym;
      case RoomType.homeTheater:
        return l10n.roomHomeTheater;
      case RoomType.kitchen:
        return l10n.roomKitchen;
      case RoomType.livingRoom:
        return l10n.roomLivingRoom;
      case RoomType.lobby:
        return l10n.roomLobby;
      case RoomType.office:
        return l10n.roomOffice;
      case RoomType.patio:
        return l10n.roomPatio;
      case RoomType.pool:
        return l10n.roomPool;
      case RoomType.stairs:
        return l10n.roomStairs;
      case RoomType.storage:
        return l10n.roomStorage;
      case RoomType.utility:
        return l10n.roomUtility;
    }
  }

  String get _defaultName {
    switch (this) {
      case RoomType.backyard:
        return 'Backyard';
      case RoomType.bathroom:
        return 'Bathroom';
      case RoomType.bedroom:
        return 'Bedroom';
      case RoomType.diningRoom:
        return 'Dining Room';
      case RoomType.dressingRoom:
        return 'Dressing Room';
      case RoomType.games:
        return 'Games';
      case RoomType.garage:
        return 'Garage';
      case RoomType.gym:
        return 'Gym';
      case RoomType.homeTheater:
        return 'Home Theater';
      case RoomType.kitchen:
        return 'Kitchen';
      case RoomType.livingRoom:
        return 'Living Room';
      case RoomType.lobby:
        return 'Lobby';
      case RoomType.office:
        return 'Office';
      case RoomType.patio:
        return 'Patio';
      case RoomType.pool:
        return 'Pool';
      case RoomType.stairs:
        return 'Stairs';
      case RoomType.storage:
        return 'Storage';
      case RoomType.utility:
        return 'Utility';
    }
  }
}
