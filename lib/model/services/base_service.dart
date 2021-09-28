abstract class BaseService<T> {
  //old url
  // final String base_url =
  //     'https://8a44d4f7-fc7f-4fcd-a367-113e5748cb45.mock.pstmn.io/api/';
  final String base_url =
      'https://b84601c0-8adb-44ee-8983-dd400c75c602.mock.pstmn.io/';
  final String getOrder = 'orders';
  final String getLineURL = "orders/lines/2413746";
  final String getShip = "orders/shipTo";
  final String loginURL = "auth/login";
  final String getOrdersCart = "orders/cart";
  final String postOrdersCart = "orders/cart";
}
