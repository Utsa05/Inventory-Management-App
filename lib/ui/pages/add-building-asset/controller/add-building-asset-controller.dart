import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/item-model.dart';

class AddBuildingAssetController extends GetxController {
  dynamic routeItemInfo = Get.arguments;
  var assetList = <ItemModel>[].obs;
  var buildingList = <ItemModel>[].obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void addItem(ItemModel item) {
    if (routeItemInfo["isBuilding"] == true) {
      buildingList.add(item);
    } else {
      assetList.add(item);
    }
  }

  void removeItem(ItemModel item) {
    if (routeItemInfo["isBuilding"] == true) {
      buildingList.remove(item);
    } else {
      assetList.remove(item);
    }
  }
}
