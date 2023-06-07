import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/ui/pages/home/model/district-model.dart';
import 'package:inventory_mangament_app/ui/pages/home/model/thana-model.dart';
import 'package:inventory_mangament_app/ui/pages/home/service/thana-service.dart';

import '../service/district-service.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class HomeController extends GetxController {
  var districtController = TextEditingController().obs;
  var thanaController = TextEditingController().obs;
  GlobalKey<AutoCompleteTextFieldState<String>> key1 = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  var selectedDistrictId = "none".obs;
  var districtModelList =
      districtModelsFromJson(jsonEncode(districtListJson)).obs;

  var suggetionDistrict = <String>[].obs;
  var suggetionThana = <String>[].obs;

  void readydistrictSuggetionList() {
    var list = districtModelsFromJson(jsonEncode(districtListJson));
    for (var i = 0; i < list.length; i++) {
      suggetionDistrict.add(list[i].name!.toString());
    }
  }

  void readythanaSuggetionList(String selectedId) {
    print(selectedId);
    suggetionThana.value = [];
    var list = thanaListsFromJson(jsonEncode(thanaListJson));

    for (var i = 0; i < list.length; i++) {
      if (list[i].districtId == selectedId) {
        suggetionThana.add(list[i].name!.toString());
      }
    }
  }

  @override
  void onInit() {
    readydistrictSuggetionList();

    super.onInit();
  }
}
