import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_mangament_app/constatns/storage.dart';
import 'package:inventory_mangament_app/constatns/string.dart';
import 'package:inventory_mangament_app/ui/pages/login/model/login-request-model.dart';
import 'package:inventory_mangament_app/ui/pages/login/model/login-response-model.dart';
import 'package:inventory_mangament_app/ui/pages/login/service/login-service.dart';

class LoignController extends GetxController {
  var isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void doValidateUser() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Empty", "Field cannot be emtpy",
          backgroundColor: Colors.red);
    } else if (!emailController.text.isEmail) {
      Get.snackbar("Invalid", "Invalid Email", backgroundColor: Colors.red);
    } else if (passwordController.text.length < 8) {
      Get.snackbar("Invalid", "Invalid password lenght");
    } else {
      debugPrint("Done");
      loginUser(LoginRequestModel(
          email: emailController.text, password: passwordController.text));
    }
  }

  void loginUser(LoginRequestModel data) async {
    isLoading.value = true;
    LoginResponseModel response = await LoginService.loginUser(data);
    if (response.message == "User was logged in successfully!") {
      Get.snackbar("Congress", "Successfully Registerd",
          backgroundColor: Colors.green);
      UserStorage storage = UserStorage();
      storage.setEmail(emailController.text);
      storage.setUserToken(response.data.token);
      if (passwordController.text.toLowerCase() == "admin1234") {
        storage.setUserType("admin");
      } else {
        storage.setUserType("user");
      }
      Get.offAllNamed(homeRoute);
    } else {
      isLoading.value = false;
      Get.snackbar("Wrong", "User Not Found", backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }
}
