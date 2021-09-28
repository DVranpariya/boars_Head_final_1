import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/get_line_repo.dart';
import 'package:flutter_app/model/repo/get_ship_repo.dart';
import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_ship_response.dart';

import 'package:get/get.dart';

class GetLineModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getLineModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<GetLineResponse> response = await GetLineRepo().getLineRepo();
      print('GetLineModel============>$response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........GetLineModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
