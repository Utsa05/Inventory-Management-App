import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/ui/pages/asset-details/view/asset-details-page.dart';
import 'package:inventory_mangament_app/ui/pages/asset-list/model/asset-model.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-model.dart';

class AssetListController extends GetxController {
  var routeInfo = Get.arguments as FloorRouteMotel;
  var assetList = <AssetModel>[].obs;
  var assetTextEditigngController = TextEditingController();
  var suggetionList = ["Laptop", "Mobile", "Computer", "Watch"];
  var key = GlobalKey<AutoCompleteTextFieldState<String>>();
  var pickedFile = XFile("path").obs;
  var isAlreadyAddedAsset = false.obs;

  @override
  void onInit() {
    print(routeInfo.roomNo);
    super.onInit();
  }

  void addAssetItem(AssetModel item) {
    assetList.add(item);
  }

  Future captureImage(BuildContext context) async {
    try {
      XFile? pickedFilefile = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 50,
          maxWidth: 1920,
          maxHeight: 1920);

      if (pickedFilefile != null) {
        pickedFile.value = pickedFilefile;
        Get.to(const AssetDetailsPage(), arguments: routeInfo);
        // ignore: use_build_context_synchronously
        // cropImage(
        //     await pickedFilefile.readAsBytes(), pickedFilefile.path, context);
      }
      print("success");
      print(pickedFilefile!.path);
    } catch (e) {
      print("Please Try agaig");
      print(e.toString());
    }
  }

  // cropImage(Uint8List byte, String path, BuildContext context) async {
  //   ImageCropping.cropImage(
  //       context: context,
  //       imageBytes: byte,
  //       onImageDoneListener: (data) {
  //         writeToFile(data, path);
  //       },
  //       customAspectRatios: [
  //         const CropAspectRatio(
  //           ratioX: 4,
  //           ratioY: 5,
  //         ),
  //       ],
  //       visibleOtherAspectRatios: true,
  //       squareBorderWidth: 2,
  //       isConstrain: false,
  //       squareCircleColor: primaryColor,
  //       defaultTextColor: whiteColor,
  //       selectedTextColor: blueColor,
  //       colorForWhiteSpace: whiteColor,
  //       makeDarkerOutside: true,
  //       outputImageFormat: OutputImageFormat.jpg,
  //       encodingQuality: 10);
  // }

  // Future<void> writeToFile(Uint8List data, String path) async {
  //   pickedFile = await File(path).writeAsBytes(data).whenComplete(
  //       () => Get.to(const AssetDetailsPage(), arguments: routeInfo));
  // }
}
