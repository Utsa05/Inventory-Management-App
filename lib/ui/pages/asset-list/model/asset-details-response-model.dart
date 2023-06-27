// To parse this JSON data, do
//
//     final assetDetailsResponseModel = assetDetailsResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AssetDetailsResponseModel assetDetailsResponseModelFromJson(String str) =>
    AssetDetailsResponseModel.fromJson(json.decode(str));

String assetDetailsResponseModelToJson(AssetDetailsResponseModel data) =>
    json.encode(data.toJson());

class AssetDetailsResponseModel {
  final int id;
  final String name;
  final String gpsLatitude;
  final String gpsLongitude;
  final DateTime date;
  final String imageUrl;
  final String initialTag;
  final String remarks;
  final String asset;
  final String room;
  final String floor;
  final String building;
  final String thana;
  final String district;

  AssetDetailsResponseModel({
    required this.id,
    required this.name,
    required this.gpsLatitude,
    required this.gpsLongitude,
    required this.date,
    required this.imageUrl,
    required this.initialTag,
    required this.remarks,
    required this.asset,
    required this.room,
    required this.floor,
    required this.building,
    required this.thana,
    required this.district,
  });

  AssetDetailsResponseModel copyWith({
    int? id,
    String? name,
    String? gpsLatitude,
    String? gpsLongitude,
    DateTime? date,
    String? imageUrl,
    String? initialTag,
    String? remarks,
    String? asset,
    String? room,
    String? floor,
    String? building,
    String? thana,
    String? district,
  }) =>
      AssetDetailsResponseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        gpsLatitude: gpsLatitude ?? this.gpsLatitude,
        gpsLongitude: gpsLongitude ?? this.gpsLongitude,
        date: date ?? this.date,
        imageUrl: imageUrl ?? this.imageUrl,
        initialTag: initialTag ?? this.initialTag,
        remarks: remarks ?? this.remarks,
        asset: asset ?? this.asset,
        room: room ?? this.room,
        floor: floor ?? this.floor,
        building: building ?? this.building,
        thana: thana ?? this.thana,
        district: district ?? this.district,
      );

  factory AssetDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      AssetDetailsResponseModel(
        id: json["id"],
        name: json["name"],
        gpsLatitude: json["gps_latitude"],
        gpsLongitude: json["gps_longitude"],
        date: DateTime.parse(json["date"]),
        imageUrl: json["image_url"],
        initialTag: json["initial_tag"],
        remarks: json["remarks"],
        asset: json["asset"],
        room: json["room"],
        floor: json["floor"],
        building: json["building"],
        thana: json["thana"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gps_latitude": gpsLatitude,
        "gps_longitude": gpsLongitude,
        "date": date.toIso8601String(),
        "image_url": imageUrl,
        "initial_tag": initialTag,
        "remarks": remarks,
        "asset": asset,
        "room": room,
        "floor": floor,
        "building": building,
        "thana": thana,
        "district": district,
      };
}
