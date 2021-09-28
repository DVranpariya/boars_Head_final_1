import 'dart:convert';

import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_cart_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:flutter_app/model/responseModel/post_orders_cart_responsemodel.dart';
import 'package:flutter_app/model/services/api_service.dart';
import 'package:flutter_app/model/services/base_service.dart';

class PostOrdersCartRepo extends BaseService {
  Future<PostOrdersCartResponse> postOrdersCartRepo(
      {Map<String, dynamic> body}) async {
    var url = postOrdersCart;
    var response = await ApiService()
        .getResponse(apiType: APIType.aPost, url: postOrdersCart, body: body);

    PostOrdersCartResponse postOrdersCartResponse =
        PostOrdersCartResponse.fromJson(response);
    // print('-------------GetOrdersRepo---------------------${response}');
    return postOrdersCartResponse;
  }
}
