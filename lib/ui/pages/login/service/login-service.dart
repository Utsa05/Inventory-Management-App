// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import "dart:convert";
import "dart:io";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:get/get.dart';
import "package:inventory_mangament_app/constatns/api.dart";
import "package:inventory_mangament_app/ui/pages/add-building-asset/model/error-response-model.dart";
import "package:inventory_mangament_app/ui/pages/login/model/login-request-model.dart";
import "package:inventory_mangament_app/ui/pages/login/model/login-response-model.dart";

class LoginService {
  static Future<LoginResponseModel> loginUser(LoginRequestModel data) async {
    //var response;
    String url = "${globalUrl}auth/login";

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response;
    try {
      var dataEncodeJson = jsonEncode(data.toJson());

      response = await http.post(Uri.parse(url),
          body: dataEncodeJson, headers: headers);

      debugPrint(response.statusCode);
    } on SocketException {
      debugPrint("No Internet Connection");
      Get.snackbar("No Internet", "Please check internet connection",
          backgroundColor: Colors.red);
    } catch (e) {
      debugPrint(e.toString());
    }

    if (response.statusCode == 200) {
      debugPrint(response.body);
      LoginResponseModel responseModel =
          loginResponseModelFromJson(response.body);
      return responseModel;
    } else {
      //token error
      ErrorResponseModel errorResponseModel =
          errorResponseModelFromJson(response.body);
      if (errorResponseModel.message.toLowerCase().contains("jwt")) {
        debugPrint("Token Expired");
      }

      return LoginResponseModel(
          message: "none", data: Data(tokenType: "tokenType", token: "none"));
    }
  }
}
