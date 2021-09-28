// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.givenName,
    this.sn,
    this.name,
    this.sAmAccountName,
    this.accessToken,
  });

  String givenName;
  String sn;
  String name;
  String sAmAccountName;
  String accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    givenName: json["givenName"] == null ? null : json["givenName"],
    sn: json["sn"] == null ? null : json["sn"],
    name: json["name"] == null ? null : json["name"],
    sAmAccountName: json["sAMAccountName"] == null ? null : json["sAMAccountName"],
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "givenName": givenName == null ? null : givenName,
    "sn": sn == null ? null : sn,
    "name": name == null ? null : name,
    "sAMAccountName": sAmAccountName == null ? null : sAmAccountName,
    "accessToken": accessToken == null ? null : accessToken,
  };
}
