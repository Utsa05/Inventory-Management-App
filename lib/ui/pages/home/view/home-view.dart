import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
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
                      tap: () {},
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
                      tap: () {},
                      isDefault: false,
                    )),
              ],
            ),
          ),
        ));
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
    return SimpleAutoCompleteTextField(
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
            }
          }
        },
        clearOnSubmit: false,
        textSubmitted: submit);
  }

  submit(text) {
    hint == "District"
        ? homeController.districtController.value.text = text
        : homeController.thanaController.value.text = text;

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
  }
}
