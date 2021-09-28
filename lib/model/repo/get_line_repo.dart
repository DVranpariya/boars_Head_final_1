import 'dart:convert';

import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_ship_response.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class GetLineRepo extends BaseService {
  Future<List<GetLineResponse>> getLineRepo() async {
    var url = getLineURL;
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: url);
    List<GetLineResponse> grtShipResponse =
        getLineResponseFromJson(jsonEncode(response));
    print('-------------getline---------$response');
    return grtShipResponse;
  }
}
