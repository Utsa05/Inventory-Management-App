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
      "data": "habib"
    };

    try {
      if (await canLaunch(url)) {
        await launch(url,
            headers: {'Content-Type': 'application/json', "data": "habib"});
      } else {
        throw 'Could not launch $url';

        // if (!await launchUrl(Uri.parse(url))) {
        //   throw Exception('Could not launch $url');
        // }
      }
    } on SocketException {
      debugPrint("No Internet Connection");
    } catch (e) {
      debugPrint(e.toString());
    }

    return true;
  }
}
