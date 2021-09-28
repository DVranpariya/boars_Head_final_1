import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/get_ship_repo.dart';
import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_ship_response.dart';

import 'package:get/get.dart';

class GetShipViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getShipViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetShipResponse> response = await GetShipRepo().getShipRepo();
      print('GetShipViewModel============>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........GetShipViewModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
