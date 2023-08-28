// To parse this JSON data, do
//
//     final createTripModel = createTripModelFromJson(jsonString);

import 'dart:convert';

CreateTripModel createTripModelFromJson(String str) => CreateTripModel.fromJson(json.decode(str));

String createTripModelToJson(CreateTripModel data) => json.encode(data.toJson());

class CreateTripModel {
  String? startLocation;
  String? endLocation;
  String? vehicleType;
  String? date;
  String? seatsFree;
  String? startTime;
  String? endTime;
  String? description;
  String? pricePerPerson;
  String? createdAt;
  String? userId;

  CreateTripModel({
    this.startLocation,
    this.endLocation,
    this.vehicleType,
    this.date,
    this.seatsFree,
    this.startTime,
    this.endTime,
    this.description,
    this.pricePerPerson,
    this.createdAt,
    this.userId,
  });

  factory CreateTripModel.fromJson(Map<String, dynamic> json) => CreateTripModel(
        startLocation: json["startLocation"],
        endLocation: json["endLocation"],
        vehicleType: json["vehicleType"],
        date: json["date"],
        seatsFree: json["seatsFree"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        description: json["description"],
        pricePerPerson: json["priecPerPerson"],
        createdAt: json["createdAt"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "startLocation": startLocation,
        "endLocation": endLocation,
        "vehicleType": vehicleType,
        "date": date,
        "seatsFree": seatsFree,
        "startTime": startTime,
        "endTime": endTime,
        "description": description,
        "pricePerPerson": pricePerPerson,
        "createdAt": createdAt,
        "userId": userId,
      };
}
