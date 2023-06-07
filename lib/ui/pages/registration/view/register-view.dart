// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:inventory_mangament_app/constatns/color.dart';
import 'package:inventory_mangament_app/constatns/pm.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mangament_app/constatns/string.dart';

import '../../../widgets/custom-button.dart';
import '../../../widgets/text-box.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(pm28),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgwithcircle.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const Title(),
              ScreenTitle(size: size),
              const SizedBox(
                height: pm24,
              ),
              CustomTextBox(
                hint: enterEmail,
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: pm20,
              ),
              CustomTextBox(
                hint: enterPassword,
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: pm20,
              ),
              CustomTextBox(
                hint: enterConfirmPass,
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: pm20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  tap: () {},
                  title: create,
                ),
              ),
              const SizedBox(
                height: pm40,
              ),
              const DonotHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.06),
      child: Text(
        register,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(fontSize: pm24, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Text(
        appName,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(fontSize: pm35, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        forgotPassword,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: pm17,
            fontWeight: FontWeight.w500,
            color: orangeColor,
            decoration: TextDecoration.underline,
            decorationColor: orangeColor),
      ),
    );
  }
}

class DonotHaveAnAccount extends StatelessWidget {
  const DonotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Get.offAllNamed(initialRoute),
        child: Text.rich(
          TextSpan(
              text: alreadyHavaAccount,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: pm17,
                    fontWeight: FontWeight.w500,
                  ),
              children: [
                TextSpan(
                    text: " $login",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: pm17,
                        fontWeight: FontWeight.w500,
                        color: orangeColor,
                        decoration: TextDecoration.underline,
                        decorationColor: orangeColor))
              ]),
        ),
      ),
    );
  }
}
