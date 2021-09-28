import 'dart:convert';

import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_ship_response.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class GetShipRepo extends BaseService {
  Future<List<GetShipResponse>> getShipRepo() async {
    var url = getShip;
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: url);
    List<GetShipResponse> grtShipResponse =
        getShipResponseFromJson(jsonEncode(response));
    print('-------------getline---------$response');
    return grtShipResponse;
  }
}
