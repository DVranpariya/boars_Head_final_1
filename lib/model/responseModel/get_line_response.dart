// To parse this JSON data, do
//
//     final getLineResponse = getLineResponseFromJson(jsonString);

import 'dart:convert';

List<GetLineResponse> getLineResponseFromJson(String str) =>
    List<GetLineResponse>.from(
        json.decode(str).map((x) => GetLineResponse.fromJson(x)));

String getLineResponseToJson(List<GetLineResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLineResponse {
  GetLineResponse({
    this.orderNumber,
    this.internalItemNumber,
    this.internalItemId,
    this.lineNumber,
    this.itemNumber,
    this.itemDescription,
    this.itemUom,
    this.orderStatus,
    this.errorMessage,
    this.fullfillmentStatus,
    this.requestedQuantity,
    this.cancelledQuantity,
    this.orderedQuantity,
    this.requestedDate,
    this.scheduledShipDate,
    this.deliveryDate,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.lastUpdateLogin,
  });

  int orderNumber;
  String internalItemNumber;
  String internalItemId;
  String lineNumber;
  int itemNumber;
  String itemDescription;
  ItemUom itemUom;
  OrderStatus orderStatus;
  dynamic errorMessage;
  dynamic fullfillmentStatus;
  String requestedQuantity;
  String cancelledQuantity;
  String orderedQuantity;
  DateTime requestedDate;
  dynamic scheduledShipDate;
  dynamic deliveryDate;
  String createdBy;
  DateTime creationDate;
  dynamic lastUpdatedBy;
  dynamic lastUpdateDate;
  dynamic lastUpdateLogin;

  factory GetLineResponse.fromJson(Map<String, dynamic> json) =>
      GetLineResponse(
        orderNumber: json["orderNumber"] == null ? null : json["orderNumber"],
        internalItemNumber: json["internalItemNumber"] == null
            ? null
            : json["internalItemNumber"],
        internalItemId:
            json["internalItemId"] == null ? null : json["internalItemId"],
        lineNumber: json["lineNumber"] == null ? null : json["lineNumber"],
        itemNumber: json["itemNumber"] == null ? null : json["itemNumber"],
        itemDescription:
            json["itemDescription"] == null ? null : json["itemDescription"],
        itemUom:
            json["itemUom"] == null ? null : itemUomValues.map[json["itemUom"]],
        orderStatus: json["orderStatus"] == null
            ? null
            : orderStatusValues.map[json["orderStatus"]],
        errorMessage: json["errorMessage"],
        fullfillmentStatus: json["fullfillmentStatus"],
        requestedQuantity: json["requestedQuantity"] == null
            ? null
            : json["requestedQuantity"],
        cancelledQuantity: json["cancelledQuantity"] == null
            ? null
            : json["cancelledQuantity"],
        orderedQuantity:
            json["orderedQuantity"] == null ? null : json["orderedQuantity"],
        requestedDate: json["requestedDate"] == null
            ? null
            : DateTime.parse(json["requestedDate"]),
        scheduledShipDate: json["scheduledShipDate"],
        deliveryDate: json["deliveryDate"],
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
        "internalItemNumber":
            internalItemNumber == null ? null : internalItemNumber,
        "internalItemId": internalItemId == null ? null : internalItemId,
        "lineNumber": lineNumber == null ? null : lineNumber,
        "itemNumber": itemNumber == null ? null : itemNumber,
        "itemDescription": itemDescription == null ? null : itemDescription,
        "itemUom": itemUom == null ? null : itemUomValues.reverse[itemUom],
        "orderStatus":
            orderStatus == null ? null : orderStatusValues.reverse[orderStatus],
        "errorMessage": errorMessage,
        "fullfillmentStatus": fullfillmentStatus,
        "requestedQuantity":
            requestedQuantity == null ? null : requestedQuantity,
        "cancelledQuantity":
            cancelledQuantity == null ? null : cancelledQuantity,
        "orderedQuantity": orderedQuantity == null ? null : orderedQuantity,
        "requestedDate":
            requestedDate == null ? null : requestedDate.toIso8601String(),
        "scheduledShipDate": scheduledShipDate,
        "deliveryDate": deliveryDate,
        "createdBy": createdBy == null ? null : createdBy,
        "creationDate":
            creationDate == null ? null : creationDate.toIso8601String(),
        "lastUpdatedBy": lastUpdatedBy,
        "lastUpdateDate": lastUpdateDate,
        "lastUpdateLogin": lastUpdateLogin,
      };
}

enum ItemUom { CSE, PAL }

final itemUomValues = EnumValues({"CSE": ItemUom.CSE, "PAL": ItemUom.PAL});

enum OrderStatus { AWAITING_SHIPPING }

final orderStatusValues =
    EnumValues({"AWAITING_SHIPPING": OrderStatus.AWAITING_SHIPPING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
