import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
import 'package:inventory_mangament_app/ui/pages/asset-list/controller/asset-list-controller.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:inventory_mangament_app/ui/pages/asset-list/model/asset-model.dart';
import '../../../../constatns/color.dart';
import '../../../../constatns/pm.dart';
import '../../add-building-asset/model/item-model.dart';
import '../../floor-room/controller/floor-room-controller.dart';

class AssetListView extends StatelessWidget {
  const AssetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final AssetListController assetListController =
        Get.put(AssetListController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            assetList,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bgimg.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${assetListController.routeInfo.district}> ${assetListController.routeInfo.thane}> ${assetListController.routeInfo.building}> ${assetListController.routeInfo.floorNo}> ${assetListController.routeInfo.roomNo}",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: pm15),
                  ),
                ),
                const SizedBox(
                  height: pm15,
                ),
                AssetList(assetListController: assetListController),
                Addnew(controller: assetListController),
              ],
            ))));
  }
}

class AssetList extends StatelessWidget {
  const AssetList({
    super.key,
    required this.assetListController,
  });

  final AssetListController assetListController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
          itemCount: assetListController.assetList.length,
          itemBuilder: (context, index) {
            AssetModel item = assetListController.assetList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: pm15),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(pm10)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(pm10),
                      child: Image.network(
                          fit: BoxFit.cover,
                          height: pm90,
                          width: pm100,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXnFktEUkoMSeLkLPWFqAnlRtsmYFYQfK4iw&usqp=CAU"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item.assetName}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          "${item.buildingName},${item.floorNo},${item.roomNo}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          "GPS: ${item.gpsLocation}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 12,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          "${item.district},${item.thane}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 12, color: blackColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            item.createDT!.split(" ").first,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 12, color: whiteColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}

class Addnew extends StatelessWidget {
  const Addnew({
    super.key,
    required this.controller,
  });

  final AssetListController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: pm24,
        top: pm10,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(pm10)),
        padding: const EdgeInsets.symmetric(horizontal: pm20, vertical: pm15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              createAsset,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: pm15),
            ),
            const SizedBox(
              height: defoultPM,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: SimpleAutoCompleteTextField(
                      key: controller.key,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: pm20),
                      decoration: InputDecoration(
                          isDense: false,
                          fillColor: whiteColor,
                          filled: true,
                          hintText: assetsName,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: pm15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defoultPM),
                          )),
                      controller: controller.assetTextEditigngController,
                      suggestions: controller.suggetionList,
                      textChanged: (text) {
                        // if (hint == "District") {
                        //   if (homeController.districtController.value.text.isEmpty) {
                        //     homeController.thanaController.value.clear();
                        //     homeController.suggetionThana.value = [];
                        //     homeController.buildingController.value.clear();
                        //     homeController.suggetionBuilding.value = [];
                        //   }
                        // }

                        // if (hint == "Thana") {
                        //   if (homeController.thanaController.value.text.isEmpty) {
                        //     homeController.buildingController.value.clear();
                        //     homeController.suggetionBuilding.value = [];
                        //   }
                        // }
                      },
                      textSubmitted: (data) {
                        controller.assetTextEditigngController.text = data;
                      },
                      clearOnSubmit: false,
                    ),
                  ),
                ),
                const SizedBox(
                  width: pm10,
                ),
                CircleAvatar(
                  backgroundColor: blueColor,
                  child: IconButton(
                      onPressed: () {
                        controller.captureImage(context);

                        // controller.addAssetItem(
                        // AssetModel(
                        //     assetName:
                        //         controller.assetTextEditigngController.text,
                        //     buildingName: controller.routeInfo.building,
                        //     thane: controller.routeInfo.thane,
                        //     district: controller.routeInfo.district,
                        //     roomNo: controller.routeInfo.roomNo,
                        //     floorNo: controller.routeInfo.floorNo,
                        //     gpsLocation: "Dhaka,Bangladesh",
                        //     createDT: DateTime(2023).toString())
                        // );
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: whiteColor,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
