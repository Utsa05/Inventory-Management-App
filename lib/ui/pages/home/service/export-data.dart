// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constatns/api.dart';

const String downloadUrl = "${globalUrl}admin/export/projects/1";

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
      if (response.statusCode == 200) {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }

        // if (!await launchUrl(Uri.parse(url))) {
        //   throw Exception('Could not launch $url');
        // }
      }
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
