import 'dart:convert';

List<FloorRouteMotel> floorRouteMotelFromJson(String str) =>
    List<FloorRouteMotel>.from(
        json.decode(str).map((x) => FloorRouteMotel.fromJson(x)));

String floorRouteMotesToJson(List<FloorRouteMotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FloorRouteMotel {
  FloorRouteMotel(
      {this.building,
      this.thane,
      this.district,
      this.buildingId,
      this.floorNo,
      this.roomNo});

  String? buildingId;
  String? thane;
  String? district;
  String? building;
  String? floorNo;
  String? roomNo;

  factory FloorRouteMotel.fromJson(Map<String, dynamic> json) =>
      FloorRouteMotel(
        buildingId: json["building_Id"],
        thane: json["thane"],
        district: json["district"],
        building: json["building"],
        floorNo: json["floorNo"],
        roomNo: json["roomNo"],
      );

  Map<String, dynamic> toJson() => {
        "building": building,
        "building_Id": buildingId,
        "district": district,
        "thane": thane,
        "roomNo": roomNo,
        "floorNo": floorNo,
      };
}
