import 'package:flutter_app/model/responseModel/creat_gest_user_responseModel.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class LoginRepo extends BaseService {
  Future<LoginResponse> loginRepo({Map<String, dynamic> body}) async {
    var response = await ApiService()
        .getResponse(url: loginURL, body: body, apiType: APIType.aPost);
    LoginResponse loginResponce = LoginResponse.fromJson(response);

    print("LoginRepo===========================$response");
    return loginResponce;
  }
}
