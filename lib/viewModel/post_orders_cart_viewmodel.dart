import 'dart:convert';

import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/login_repo.dart';
import 'package:flutter_app/model/repo/post_orders_cart_repo.dart';
import 'package:flutter_app/model/reqestModel/login_reqestmodel.dart';
import 'package:flutter_app/model/reqestModel/post_orders_cart_reqestmodel.dart';
import 'package:flutter_app/model/responseModel/creat_gest_user_responseModel.dart';
import 'package:flutter_app/model/responseModel/post_orders_cart_responsemodel.dart';
import 'package:get/get.dart';

class PostOrdersCartViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> postOrdersCartViewModel({PostOrdersCartReqModel modell}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      PostOrdersCartResponse response =
          await PostOrdersCartRepo().postOrdersCartRepo(body: modell.toJson());
      print('PostOrdersCartViewModel============>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........PostOrdersCartViewModel====>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
