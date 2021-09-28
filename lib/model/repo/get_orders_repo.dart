import 'dart:convert';

import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class GetOrdersRepo extends BaseService {
  Future<List<GetOrdersResponse>> getOrdersRepo() async {
    var url = getOrder;
    var response =
        await ApiService().getResponse(apiType: APIType.aGet, url: getOrder);
    // print(
    //     '===================tttttttttttttttttttttt=====${response.runtimeType}');
    // print('===================ooooooooo=====$response');
    List<GetOrdersResponse> getOrdersResponse =
        getOrdersResponseFromJson(jsonEncode(response));
    // print('-------------GetOrdersRepo---------------------${response}');
    return getOrdersResponse;
  }
}
