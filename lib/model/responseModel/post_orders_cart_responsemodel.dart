// To parse this JSON data, do
//
//     final postOrdersCartResponse = postOrdersCartResponseFromJson(jsonString);

import 'dart:convert';

PostOrdersCartResponse postOrdersCartResponseFromJson(String str) =>
    PostOrdersCartResponse.fromJson(json.decode(str));

String postOrdersCartResponseToJson(PostOrdersCartResponse data) =>
    json.encode(data.toJson());

class PostOrdersCartResponse {
  PostOrdersCartResponse({
    this.status,
  });

  String status;

  factory PostOrdersCartResponse.fromJson(Map<String, dynamic> json) =>
      PostOrdersCartResponse(
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
      };
}
