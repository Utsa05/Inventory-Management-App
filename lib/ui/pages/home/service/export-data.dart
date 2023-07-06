import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constatns/api.dart';

class ExportDataServcie {
  static Future<bool> exportData() async {
    //var response;
    String url = "${globalUrl}admin/export/projects/1";

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response;
    try {
      response = await http.get(Uri.parse(url), headers: headers);

      debugPrint(response.statusCode);
    } on SocketException {
      debugPrint("No Internet Connection");
    } catch (e) {
      debugPrint(e.toString());
    }

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
