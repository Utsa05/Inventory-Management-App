import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
import 'package:inventory_mangament_app/ui/pages/floor-room/model/floor-model.dart';
import 'package:inventory_mangament_app/ui/pages/home/controller/home-controller.dart';
import 'package:inventory_mangament_app/ui/widgets/custom-button.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            dashboard,
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
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bgimg.png'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: isAdmin == true
                //for admin
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: pm60,
                          child: SuggetionBox(
                            homeController: homeController,
                            hint: "District",
                            textEditingController:
                                homeController.districtController.value,
                            list: homeController.suggetionDistrict,
                          )),
                      const SizedBox(
                        height: pm15,
                      ),
                      ThanaWidget(homeController: homeController),
                      const SizedBox(
                        height: pm55,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: pm55,
                          child: CustomButton(
                            title: "Add Building",
                            tap: () {
                              goToAddPage(true);
                            },
                            isDefault: false,
                          )),
                      const SizedBox(
                        height: pm10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: pm55,
                          child: CustomButton(
                            title: "Set Assets",
                            tap: () {
                              goToAddPage(false);
                            },
                            isDefault: false,
                          )),
                    ],
                  )

                //for user
                : UserPortion(homeController: homeController),
          ),
        ));
  }

  Future<dynamic>? goToAddPage(bool isBuilding) {
    return Get.toNamed(addbuildingassetRoute, arguments: {
      "thana": homeController.thanaController.value.text,
      "district": homeController.districtController.value.text,
      "isBuilding": isBuilding
    });
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            height: pm30,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: whiteColor,
              child: const Icon(Icons.person),
            ),
            tileColor: primaryColor,
            title: Text(
              "Utsa Chandra",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: pm20),
            ),
            subtitle: Text(
              "utsa@gmail.com",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: pm12),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.file_download),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            title: Text(
              "Export",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: pm17),
            ),
          )
        ],
      ),
    );
  }
}

class UserPortion extends StatelessWidget {
  const UserPortion({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: pm20,
        ),
        SizedBox(
            height: pm60,
            child: SuggetionBox(
              homeController: homeController,
              hint: "District",
              textEditingController: homeController.districtController.value,
              list: homeController.suggetionDistrict,
            )),
        const SizedBox(
          height: pm15,
        ),
        ThanaWidget(homeController: homeController),
        const SizedBox(
          height: pm15,
        ),
        SizedBox(
            height: pm60,
            child: Obx(() {
              return homeController.suggetionBuilding.isNotEmpty
                  ? SuggetionBox(
                      homeController: homeController,
                      hint: "Building",
                      textEditingController:
                          homeController.buildingController.value,
                      list: homeController.suggetionBuilding,
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: pm10),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: pm60,
                      decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(pm10)),
                      child: Text("Building",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: pm18,
                                  color: blackColor.withOpacity(0.4))));
            })),
        const SizedBox(
          height: pm22,
        ),
        SizedBox(
          width: double.infinity,
          height: pm50,
          child: CustomButton(
            title: "Set Floor",
            tap: () {
              Get.toNamed(floorroomRoute,
                  arguments: FloorRouteMotel(
                      buildingId: homeController.selectedBuildingId.value,
                      district: homeController.districtController.value.text,
                      thane: homeController.thanaController.value.text,
                      building: homeController.buildingController.value.text));
            },
            isDefault: false,
          ),
        )
      ],
    );
  }
}

class ThanaWidget extends StatelessWidget {
  const ThanaWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: pm60,
        child: Obx(() {
          return homeController.suggetionThana.isNotEmpty
              ? SuggetionBox(
                  homeController: homeController,
                  hint: "Thana",
                  textEditingController: homeController.thanaController.value,
                  list: homeController.suggetionThana,
                )
              : Container(
                  padding: const EdgeInsets.only(left: pm10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: pm60,
                  decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(pm10)),
                  child: Text("Thana",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: pm18,
                          color: blackColor.withOpacity(0.4))));
        }));
  }
}

class SuggetionBox extends StatelessWidget {
  const SuggetionBox({
    super.key,
    required this.homeController,
    required this.hint,
    required this.textEditingController,
    required this.list,
  });

  final HomeController homeController;
  final String hint;
  final TextEditingController textEditingController;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: blueColor, width: 1.3),
          borderRadius: BorderRadius.circular(defoultPM)),
      child: SimpleAutoCompleteTextField(
          key: GlobalKey(),
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.normal, fontSize: pm20),
          decoration: InputDecoration(
              isDense: false,
              fillColor: whiteColor,
              filled: true,
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: pm18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defoultPM),
                borderSide: BorderSide.none,
              )),
          controller: textEditingController,
          suggestions: list,
          textChanged: (text) {
            if (hint == "District") {
              if (homeController.districtController.value.text.isEmpty) {
                homeController.thanaController.value.clear();
                homeController.suggetionThana.value = [];
                homeController.buildingController.value.clear();
                homeController.suggetionBuilding.value = [];
              }
            }

            if (hint == "Thana") {
              if (homeController.thanaController.value.text.isEmpty) {
                homeController.buildingController.value.clear();
                homeController.suggetionBuilding.value = [];
              }
            }
          },
          clearOnSubmit: false,
          textSubmitted: submit),
    );
  }

  submit(text) {
    if (hint == "Thana") {
      homeController.thanaController.value.text = text;
    } else if (hint == "District") {
      homeController.districtController.value.text = text;
    } else if (hint == "Building") {
      homeController.buildingController.value.text = text;

      for (var item in homeController.buildingModelList) {
        if (item.name == text) {
          homeController.selectedBuildingId.value = item.id!;
          print(item.id);
          break;
        }
      }
    }

    if (hint == "District") {
      homeController.thanaController.value.clear();
      for (var item in homeController.districtModelList) {
        if (item.name == homeController.districtController.value.text) {
          homeController.selectedDistrictId.value = item.id!;

          homeController.readythanaSuggetionList(item.id!);
          break;
        }
      }
    }

    if (hint == "Thana") {
      homeController.buildingController.value.clear();
      for (var item in homeController.thanaModelList) {
        if (item.name == homeController.thanaController.value.text) {
          homeController.selectedThanaId.value = item.id!;

          homeController.readyBuildingSuggetionList(item.id!);
          break;
        }
      }
    }
  }
}
