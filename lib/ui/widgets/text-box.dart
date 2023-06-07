import 'package:flutter/material.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.hint,
    required this.controller,
  });
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: pm55,
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: pm18, fontWeight: FontWeight.w400, color: blackColor),
        decoration: InputDecoration(
            isDense: false,
            hintStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: pm17, fontWeight: FontWeight.w400),
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(pm22)),
            filled: true,
            fillColor: whiteColor),
      ),
    );
  }
}
