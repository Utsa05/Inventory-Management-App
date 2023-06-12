import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/controller/add-building-asset-controller.dart';
import 'package:inventory_mangament_app/ui/pages/add-building-asset/model/item-model.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddBuildingAssetController controller =
        Get.put(AddBuildingAssetController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          controller.routeItemInfo["isBuilding"] == true
              ? "Building List"
              : "Asset List",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        //     child: SizedBox(
        //         width: 80, child: CustomButton(title: "Manu", tap: () {})),
        //   )
        // ],
      ),
      body: Container(
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
              Expanded(
                  child: ItemList(
                controller: controller,
                itemList: controller.routeItemInfo["isBuilding"] == true
                    ? controller.buildingList
                    : controller.assetList,
              )),
              Addnew(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class Addnew extends StatelessWidget {
  const Addnew({
    super.key,
    required this.controller,
  });

  final AddBuildingAssetController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: pm24, top: pm10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(pm10)),
        padding: const EdgeInsets.symmetric(horizontal: pm20, vertical: pm15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: pm17),
                decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: pm15),
                    hintText: controller.routeItemInfo["isBuilding"] == true
                        ? buildingName
                        : assetsName),
              ),
            ),
            TextButton(
                onPressed: () {
                  Random random = Random();

                  controller.addItem(ItemModel(
                      title: controller.textEditingController.text,
                      district: controller.routeItemInfo["district"],
                      thana: controller.routeItemInfo["thana"],
                      id: random.nextInt(10000)));

                  controller.textEditingController.clear();
                },
                child: Text(
                  save,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: pm15),
                ))
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.itemList,
    required this.controller,
  });
  final List<ItemModel> itemList;
  final AddBuildingAssetController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return itemList.isNotEmpty
          ? ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                ItemModel item = itemList[index];
                return ItemWidget(item: item, controller: controller);
              },
            )
          : const Align(
              alignment: Alignment.center,
              child: Text("Not have Any Item"),
            );
    });
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.item,
    required this.controller,
  });

  final ItemModel item;
  final AddBuildingAssetController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: pm15, vertical: defoultPM),
      margin: const EdgeInsets.only(bottom: pm10),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(width: 1, color: blueColor),
          borderRadius: BorderRadius.circular(defoultPM)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: pm17, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            width: pm12,
          ),
          CircleAvatar(
              radius: pm17,
              backgroundColor: Colors.red,
              child: IconButton(
                  onPressed: () {
                    controller.removeItem(item);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: whiteColor,
                    size: pm20,
                  )))
        ],
      ),
    );
  }
}
