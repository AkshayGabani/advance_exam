// To parse this JSON data, do
//
//     final jsonData = jsonDataFromJson(jsonString);

import 'dart:convert';

List<JsonData> jsonDataFromJson(String str) => List<JsonData>.from(json.decode(str).map((x) => JsonData.fromJson(x)));

String jsonDataToJson(List<JsonData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonData {
  JsonData({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
