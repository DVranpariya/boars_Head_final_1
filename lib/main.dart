import 'package:flutter/material.dart';
import 'package:flutter_app/screen/login_page.dart';
import 'package:flutter_app/screen/order_history.dart';
import 'package:flutter_app/viewModel/get_line_view_model.dart';
import 'package:flutter_app/viewModel/get_order_view_model.dart';
import 'package:flutter_app/viewModel/get_orders_cart_viewmodel.dart';
import 'package:flutter_app/viewModel/get_ship_view_model.dart';
import 'package:flutter_app/viewModel/login_view_model.dart';
import 'package:flutter_app/viewModel/post_orders_cart_viewmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

  GetOrdersViewModel _getOrdersViewModel = Get.put(GetOrdersViewModel());
  GetOrdersCartViewModel _getOrdersCartViewModel =
      Get.put(GetOrdersCartViewModel());
  GetShipViewModel _getLineViewModel = Get.put(GetShipViewModel());
  GetLineModel _getLineModel = Get.put(GetLineModel());
  LoginViewModel _createGuestViewModel = Get.put(LoginViewModel());
  PostOrdersCartViewModel _postOrdersCartViewModel =
      Get.put(PostOrdersCartViewModel());
}
