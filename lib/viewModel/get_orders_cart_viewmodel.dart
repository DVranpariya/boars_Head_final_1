import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/get_orders_cart_repo.dart';
import 'package:flutter_app/model/repo/get_ship_repo.dart';
import 'package:flutter_app/model/repo/get_orders_repo.dart';
import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_cart_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';

import 'package:get/get.dart';

class GetOrdersCartViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getOrdersCartViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetOrdersCartResponse> response =
          await GetOrdersCartRepo().getOrdersCartRepo();
      print('GetOrdersCartViewModel============>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........GetOrdersCartViewModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
