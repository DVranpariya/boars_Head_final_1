// To parse this JSON data, do
//
//     final getShipResponse = getShipResponseFromJson(jsonString);

import 'dart:convert';

List<GetShipResponse> getShipResponseFromJson(String str) =>
    List<GetShipResponse>.from(
        json.decode(str).map((x) => GetShipResponse.fromJson(x)));

String getShipResponseToJson(List<GetShipResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetShipResponse {
  GetShipResponse({
    this.billToUserId,
    this.shipToNumber,
    this.siteUseId,
    this.partySiteName,
    this.partySiteId,
    this.customerClassCode,
  });

  String billToUserId;
  String shipToNumber;
  int siteUseId;
  String partySiteName;
  int partySiteId;
  String customerClassCode;

  factory GetShipResponse.fromJson(Map<String, dynamic> json) =>
      GetShipResponse(
        billToUserId:
            json["billToUserId"] == null ? null : json["billToUserId"],
        shipToNumber:
            json["shipToNumber"] == null ? null : json["shipToNumber"],
        siteUseId: json["siteUseId"] == null ? null : json["siteUseId"],
        partySiteName:
            json["partySiteName"] == null ? null : json["partySiteName"],
        partySiteId: json["partySiteId"] == null ? null : json["partySiteId"],
        customerClassCode: json["customerClassCode"] == null
            ? null
            : json["customerClassCode"],
      );

  Map<String, dynamic> toJson() => {
        "billToUserId": billToUserId == null ? null : billToUserId,
        "shipToNumber": shipToNumber == null ? null : shipToNumber,
        "siteUseId": siteUseId == null ? null : siteUseId,
        "partySiteName": partySiteName == null ? null : partySiteName,
        "partySiteId": partySiteId == null ? null : partySiteId,
        "customerClassCode":
            customerClassCode == null ? null : customerClassCode,
      };
}
