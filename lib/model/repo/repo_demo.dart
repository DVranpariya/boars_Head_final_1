import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:http/http.dart' as http;

class ApiDemo {
  Future<List<GetOrdersResponse>> milan() async {
    var mil = await http.get(Uri.parse(
        'https://8a44d4f7-fc7f-4fcd-a367-113e5748cb45.mock.pstmn.io/api/orders'));
    print('----------------------------mia--sds-s--s-d--sdd${mil.body}');
    return getOrdersResponseFromJson(mil.body);
  }
}
