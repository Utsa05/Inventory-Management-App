import 'package:flutter/material.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox(
      {super.key,
      required this.hint,
      required this.controller,
      this.isNotCirle,
      this.line});
  final String hint;
  final TextEditingController controller;
  final bool? isNotCirle;
  final int? line;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: line == null ? pm55 : pm100,
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontSize: pm18, fontWeight: FontWeight.w400, color: blackColor),
        minLines: 2,
        maxLines: 3,
        decoration: InputDecoration(
            isDense: false,
            hintStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: pm17, fontWeight: FontWeight.w400),
            hintText: hint,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: isNotCirle == false
                    ? BorderRadius.circular(pm22)
                    : BorderRadius.circular(5)),
            filled: true,
            fillColor: whiteColor),
      ),
    );
  }
}
