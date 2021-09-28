import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/get_ship_repo.dart';
import 'package:flutter_app/model/repo/get_orders_repo.dart';
import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';

import 'package:get/get.dart';

class GetOrdersViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getOrdersViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetOrdersResponse> response = await GetOrdersRepo().getOrdersRepo();
      print('GetOrdersViewModel============>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........GetOrdersViewModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
