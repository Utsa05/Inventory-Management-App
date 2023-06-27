// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/item-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-request-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-response-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/room-request-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/room-response-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/service/floor-service.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/service/room-serivice.dart';

class FloorRoomController extends GetxController {
  FloorRouteMotel routeItemInfo = Get.arguments;

  var floorList = <FloorResponseModel>[].obs;
  var roomList = <RoomResponseModel>[].obs;
  final TextEditingController textEditingController = TextEditingController();
  var isLoading = false.obs;

  void getFloor(String buldingId) async {
    isLoading.value = true;
    print("hi");
    var list =
        (await FloorService.allBuildign(buldingId)).cast<FloorResponseModel>();

    print(floorList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    floorList.value = list;
    print(floorList.length);
  }

  void addNewFloor(String id, FloorRequestModel data) async {
    isLoading.value = true;

    await FloorService.addFloor(id, data);

    var list = (await FloorService.allBuildign(id)).cast<FloorResponseModel>();

    print(floorList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    floorList.value = list;
    print(floorList.length);
  }

  void deleteBuilding(String floorid, String buildingId) async {
    isLoading(true);
    bool isDeleted = await FloorService.deleteFloor(floorid, buildingId);

    if (isDeleted) {
      getFloor(buildingId);
    }
    isLoading(false);
  }

  //room
  void getRoom(String floorId) async {
    isLoading.value = true;
    print("hi");
    var list =
        (await RoomService.allRoombyFloor(floorId)).cast<RoomResponseModel>();

    print(roomList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    roomList.value = list;
    print(roomList.length);
  }

  void addNewRoom(String id, RoomRequestModel data) async {
    isLoading.value = true;

    await RoomService.addRoom(id, data);

    var list = (await RoomService.allRoombyFloor(id)).cast<RoomResponseModel>();

    print(roomList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    roomList.value = list;
    print(roomList.length);
  }

  void deleteRoom(String floorid, String roomId) async {
    isLoading(true);
    bool isDeleted = await RoomService.deleteRoom(roomId, floorid);

    if (isDeleted) {
      getRoom(floorid);
    }
    isLoading(false);
  }
  // void removeItem(ItemModel item) {
  //   floorList.remove(item);
  // }

  // void addRoomItem(ItemModel item) {
  //   roomList.add(item);
  // }

  // void removeRoomItem(ItemModel item) {
  //   roomList.remove(item);
  // }

  @override
  void onInit() {
    getFloor("62");
    super.onInit();
  }
}
