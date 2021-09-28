// To parse this JSON data, do
//
//     final getOrdersCartResponse = getOrdersCartResponseFromJson(jsonString);

import 'dart:convert';

List<GetOrdersCartResponse> getOrdersCartResponseFromJson(String str) =>
    List<GetOrdersCartResponse>.from(
        json.decode(str).map((x) => GetOrdersCartResponse.fromJson(x)));

String getOrdersCartResponseToJson(List<GetOrdersCartResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOrdersCartResponse {
  GetOrdersCartResponse({
    this.cartId,
    this.itemNumber,
    this.requestedQuantity,
    this.placedByUserLid,
    this.userId,
    this.itemDetails,
  });

  int cartId;
  int itemNumber;
  int requestedQuantity;
  String placedByUserLid;
  String userId;
  ItemDetails itemDetails;

  factory GetOrdersCartResponse.fromJson(Map<String, dynamic> json) =>
      GetOrdersCartResponse(
        cartId: json["cartId"],
        itemNumber: json["itemNumber"],
        requestedQuantity: json["requestedQuantity"],
        placedByUserLid: json["placedByUserLid"],
        userId: json["userId"],
        itemDetails: ItemDetails.fromJson(json["itemDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "cartId": cartId,
        "itemNumber": itemNumber,
        "requestedQuantity": requestedQuantity,
        "placedByUserLid": placedByUserLid,
        "userId": userId,
        "itemDetails": itemDetails.toJson(),
      };
}

class ItemDetails {
  ItemDetails({
    this.itemNumber,
    this.itemDescription,
    this.itemDisplayName,
    this.itemSpecialText,
    this.itemImage,
    this.itemDetailImage,
    this.itemUnitPrice,
    this.itemDiscountedPrice,
    this.itemUom,
    this.itemType,
    this.itemStartDate,
    this.itemEndDate,
    this.itemColor,
    this.itemLiveStatus,
    this.itemAvailability,
    this.createdBy,
    this.creationDate,
    this.lastUpdatedBy,
    this.lastUpdateDate,
    this.lastUpdateLogin,
  });

  int itemNumber;
  String itemDescription;
  String itemDisplayName;
  dynamic itemSpecialText;
  dynamic itemImage;
  dynamic itemDetailImage;
  dynamic itemUnitPrice;
  dynamic itemDiscountedPrice;
  String itemUom;
  String itemType;
  DateTime itemStartDate;
  dynamic itemEndDate;
  dynamic itemColor;
  dynamic itemLiveStatus;
  String itemAvailability;
  String createdBy;
  DateTime creationDate;
  dynamic lastUpdatedBy;
  dynamic lastUpdateDate;
  dynamic lastUpdateLogin;

  factory ItemDetails.fromJson(Map<String, dynamic> json) => ItemDetails(
        itemNumber: json["itemNumber"],
        itemDescription: json["itemDescription"],
        itemDisplayName: json["itemDisplayName"],
        itemSpecialText: json["itemSpecialText"],
        itemImage: json["itemImage"],
        itemDetailImage: json["itemDetailImage"],
        itemUnitPrice: json["itemUnitPrice"],
        itemDiscountedPrice: json["itemDiscountedPrice"],
        itemUom: json["itemUom"],
        itemType: json["itemType"],
        itemStartDate: DateTime.parse(json["itemStartDate"]),
        itemEndDate: json["itemEndDate"],
        itemColor: json["itemColor"],
        itemLiveStatus: json["itemLiveStatus"],
        itemAvailability: json["itemAvailability"],
        createdBy: json["createdBy"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastUpdatedBy: json["lastUpdatedBy"],
        lastUpdateDate: json["lastUpdateDate"],
        lastUpdateLogin: json["lastUpdateLogin"],
      );

  Map<String, dynamic> toJson() => {
        "itemNumber": itemNumber,
        "itemDescription": itemDescription,
        "itemDisplayName": itemDisplayName,
        "itemSpecialText": itemSpecialText,
        "itemImage": itemImage,
        "itemDetailImage": itemDetailImage,
        "itemUnitPrice": itemUnitPrice,
        "itemDiscountedPrice": itemDiscountedPrice,
        "itemUom": itemUom,
        "itemType": itemType,
        "itemStartDate": itemStartDate.toIso8601String(),
        "itemEndDate": itemEndDate,
        "itemColor": itemColor,
        "itemLiveStatus": itemLiveStatus,
        "itemAvailability": itemAvailability,
        "createdBy": createdBy,
        "creationDate": creationDate.toIso8601String(),
        "lastUpdatedBy": lastUpdatedBy,
        "lastUpdateDate": lastUpdateDate,
        "lastUpdateLogin": lastUpdateLogin,
      };
}
