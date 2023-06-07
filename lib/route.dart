// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:inventory_mangament_app/ui/pages/forgot/view/export.dart';
import 'package:inventory_mangament_app/ui/pages/home/view/home-page.dart';

import 'constatns/string.dart';
import 'ui/pages/login/view/export.dart';
import 'ui/pages/registration/view/export.dart';

class AppRoutes {
  static List<GetPage<dynamic>> route() {
    return [
      GetPage(name: initialRoute, page: () => const LoginPage()),
      GetPage(
          name: registrationRoute,
          page: () => const RegisterPage(),
          transition: Transition.rightToLeft),
      GetPage(
          name: forgotRoute,
          page: () => const ForgotPage(),
          transition: Transition.rightToLeft),
      GetPage(
          name: homeRoute,
          page: () => const HomePage(),
          transition: Transition.leftToRightWithFade),
    ];
  }
}
