import 'dart:convert';

import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_cart_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class GetOrdersCartRepo extends BaseService {
  Future<List<GetOrdersCartResponse>> getOrdersCartRepo() async {
    var url = getOrder;
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: getOrdersCart);

    List<GetOrdersCartResponse> getOrdersCartResponse =
        getOrdersCartResponseFromJson(jsonEncode(response));
    // print('-------------GetOrdersRepo---------------------${response}');
    return getOrdersCartResponse;
  }
}
