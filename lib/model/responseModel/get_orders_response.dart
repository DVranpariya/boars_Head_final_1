// To parse this JSON data, do
//
//     final getOrdersResponse = getOrdersResponseFromJson(jsonString);

import 'dart:convert';

List<GetOrdersResponse> getOrdersResponseFromJson(String str) =>
    List<GetOrdersResponse>.from(
        json.decode(str).map((x) => GetOrdersResponse.fromJson(x)));

String getOrdersResponseToJson(List<GetOrdersResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOrdersResponse {
  GetOrdersResponse({
    this.orderNumber,
    this.poNumber,
    this.orderId,
    this.userId,
    this.shipToNumber,
    this.shipToName,
    this.totalPrice,
    this.orderedDate,
    this.orderCompletedDate,
    this.fullfillmentStatus,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.lastUpdateLogin,
  });

  int orderNumber;
  dynamic poNumber;
  String orderId;
  String userId;
  String shipToNumber;
  String shipToName;
  dynamic totalPrice;
  DateTime orderedDate;
  dynamic orderCompletedDate;
  String fullfillmentStatus;
  String createdBy;
  DateTime creationDate;
  dynamic lastUpdatedBy;
  dynamic lastUpdateDate;
  dynamic lastUpdateLogin;

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      GetOrdersResponse(
        orderNumber: json["orderNumber"] == null ? null : json["orderNumber"],
        poNumber: json["poNumber"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        userId: json["userId"] == null ? null : json["userId"],
        shipToNumber:
            json["shipToNumber"] == null ? null : json["shipToNumber"],
        shipToName: json["shipToName"] == null ? null : json["shipToName"],
        totalPrice: json["totalPrice"],
        orderedDate: json["orderedDate"] == null
            ? null
            : DateTime.parse(json["orderedDate"]),
        orderCompletedDate: json["orderCompletedDate"],
        fullfillmentStatus: json["fullfillmentStatus"] == null
            ? null
            : json["fullfillmentStatus"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        creationDate: json["creationDate"] == null
            ? null
            : DateTime.parse(json["creationDate"]),
        lastUpdatedBy: json["lastUpdatedBy"],
        lastUpdateDate: json["lastUpdateDate"],
        lastUpdateLogin: json["lastUpdateLogin"],
      );

  Map<String, dynamic> toJson() => {
        "orderNumber": orderNumber == null ? null : orderNumber,
        "poNumber": poNumber,
        "orderId": orderId == null ? null : orderId,
        "userId": userId == null ? null : userId,
        "shipToNumber": shipToNumber == null ? null : shipToNumber,
        "shipToName": shipToName == null ? null : shipToName,
        "totalPrice": totalPrice,
        "orderedDate":
            orderedDate == null ? null : orderedDate.toIso8601String(),
        "orderCompletedDate": orderCompletedDate,
        "fullfillmentStatus":
            fullfillmentStatus == null ? null : fullfillmentStatus,
        "createdBy": createdBy == null ? null : createdBy,
        "creationDate":
            creationDate == null ? null : creationDate.toIso8601String(),
        "lastUpdatedBy": lastUpdatedBy,
        "lastUpdateDate": lastUpdateDate,
        "lastUpdateLogin": lastUpdateLogin,
      };
}
