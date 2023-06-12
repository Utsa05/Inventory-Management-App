import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/item-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-model.dart';

class FloorRoomController extends GetxController {
  FloorRouteMotel routeItemInfo = Get.arguments;

  var floorList = <ItemModel>[].obs;
  var roomList = <ItemModel>[].obs;
  final TextEditingController textEditingController = TextEditingController();

  void addItem(ItemModel item) {
    floorList.add(item);
  }

  void removeItem(ItemModel item) {
    floorList.remove(item);
  }

  void addRoomItem(ItemModel item) {
    roomList.add(item);
  }

  void removeRoomItem(ItemModel item) {
    roomList.remove(item);
  }
}
