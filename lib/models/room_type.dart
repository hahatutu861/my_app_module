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

  String get imagePath => '$imageName.png';

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
}
