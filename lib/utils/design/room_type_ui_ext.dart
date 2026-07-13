import 'package:flutter/material.dart';
import 'package:my_app_module/models/room_type.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

extension RoomTypeUIExt on RoomType {
  String getDisplayName(BuildContext context) {
    switch (this) {
      case RoomType.backyard:
        return context.l10n.roomBackyard;
      case RoomType.bathroom:
        return context.l10n.roomBathroom;
      case RoomType.bedroom:
        return context.l10n.roomBedroom;
      case RoomType.diningRoom:
        return context.l10n.roomDiningRoom;
      case RoomType.dressingRoom:
        return context.l10n.roomDressingRoom;
      case RoomType.games:
        return context.l10n.roomGames;
      case RoomType.garage:
        return context.l10n.roomGarage;
      case RoomType.gym:
        return context.l10n.roomGym;
      case RoomType.homeTheater:
        return context.l10n.roomHomeTheater;
      case RoomType.kitchen:
        return context.l10n.roomKitchen;
      case RoomType.livingRoom:
        return context.l10n.roomLivingRoom;
      case RoomType.lobby:
        return context.l10n.roomLobby;
      case RoomType.office:
        return context.l10n.roomOffice;
      case RoomType.patio:
        return context.l10n.roomPatio;
      case RoomType.pool:
        return context.l10n.roomPool;
      case RoomType.stairs:
        return context.l10n.roomStairs;
      case RoomType.storage:
        return context.l10n.roomStorage;
      case RoomType.utility:
        return context.l10n.roomUtility;
    }
  }
}
