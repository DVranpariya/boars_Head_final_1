import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/login_repo.dart';
import 'package:flutter_app/model/reqestModel/login_reqestmodel.dart';
import 'package:flutter_app/model/responseModel/creat_gest_user_responseModel.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> loginViewModel({LoginReqModel modell}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LoginResponse response =
          await LoginRepo().loginRepo(body: modell.toJson());
      print('LoginViewModel============>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........LoginViewModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
