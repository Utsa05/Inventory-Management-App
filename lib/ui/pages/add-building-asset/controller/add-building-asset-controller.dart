// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/building-create-response.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/building-model.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/item-model.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/service/building-service.dart';

class AddBuildingAssetController extends GetxController {
  dynamic routeItemInfo = Get.arguments;
  var assetList = <ItemModel>[].obs;
  var buildingList = <BuildingCreateResponseModel>[].obs;
  final TextEditingController textEditingController = TextEditingController();
  var isLoading = false.obs;
  BuildingCreateResponseModel? building;

  @override
  void onInit() {
    getBuilding();
    super.onInit();
  }

  void getBuilding() async {
    var list = (await BuildingService.allBuildign("1"))
        .cast<BuildingCreateResponseModel>();

    print(buildingList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    buildingList.value = list;
    print(buildingList.length);
  }

  void addNewBuilding(String id, BuildingModel data) async {
    isLoading.value = true;

    await BuildingService.addBuilding(id, data);

    var list = (await BuildingService.allBuildign(id))
        .cast<BuildingCreateResponseModel>();

    print(buildingList.length);
    //buildingList.add(building!);
    isLoading.value = false;
    buildingList.value = list;
    print(buildingList.length);
  }

  void deleteBuilding(String thanaId, String buildingId) async {
    isLoading(true);
    bool isDeleted = await BuildingService.deleteBuilding(thanaId, buildingId);

    if (isDeleted) {
      getBuilding();
    }
    isLoading(false);
  }

  void addItem(ItemModel item) {
    if (routeItemInfo["isBuilding"] == true) {
      //buildingList.add(item);
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
