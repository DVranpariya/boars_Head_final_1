import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Components/CustomWidgets.dart';
import 'package:flutter_app/Components/circular_progress.dart';
import 'package:flutter_app/Components/common_widget_appbar.dart';
import 'package:flutter_app/Components/common_widget_bottombar.dart';
import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/repo/repo_demo.dart';
import 'package:flutter_app/model/reqestModel/post_orders_cart_reqestmodel.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:flutter_app/res/test_common.dart';
import 'package:flutter_app/viewModel/get_order_view_model.dart';
import 'package:flutter_app/viewModel/post_orders_cart_viewmodel.dart';
import 'package:get/get.dart';
import '../utils/responsive.dart';
import 'view_Screen.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  GetOrdersViewModel _getOrdersViewModel = Get.find();
  PostOrdersCartViewModel _postOrdersCartViewModel = Get.find();

  // GetShipViewModel _getLineViewModel = Get.put(GetShipViewModel());
  @override
  void initState() {
    ApiDemo();
    // _getLineViewModel.getLineViewModel();
    _getOrdersViewModel.getOrdersViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: widgetAppBar(),
      ),
      body: GetBuilder<GetOrdersViewModel>(
        builder: (controller) {
          // if (controller.apiResponse.status == Status.LOADING) {
          //   return circularProgress();
          // }
          if (controller.apiResponse.status == Status.ERROR) {
            return Material(child: Center(child: serverErrorText()));
          }
          if (controller.apiResponse.status == Status.COMPLETE) {
            List<GetOrdersResponse> response = controller.apiResponse.data;
            return Container(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widgetSecondAppbar(),
                    topWidget(),
                    Container(
                      height: 100,
                      width: Get.width,
                      color: Color(0xffFFFFFF),
                      // color: Colors.deepOrange,
                      child: Padding(
                        padding: EdgeInsets.all(Get.width / 100),
                        child: Row(
                          children: [
                            Container(
                              height: Get.height,
                              width: Get.width / 7.5,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(Get.width / 700),
                                          child: Text(
                                            'Po Number',
                                            style: TextCommon.postTitleStyle(
                                                fontWeight: true,
                                                colorChangeBlack: false,
                                                fontWidth: Get.width / 80),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Color(0xffAB965D),
                                          size: Get.width / 60,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 7.5,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'Order Number',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Color(0xffAB965D),
                                        size: Get.width / 60,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 4.3,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'Order Placed',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 10,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'Ship to Name',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 8,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'Delivery Status',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 8,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'No of products',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height,
                              width: Get.width / 8,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width / 700),
                                        child: Text(
                                          'Action',
                                          style: TextCommon.postTitleStyle(
                                              fontWeight: true,
                                              colorChangeBlack: false,
                                              fontWidth: Get.width / 80),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: response.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: Get.width,
                          color: index % 2 == 0
                              ? Color(0xffF9F9F9)
                              : Color(0xffFFFFFF),
                          // color: Colors.deepOrange,
                          child: Row(
                            children: [
                              Container(
                                height: Get.height,
                                width: Get.width / 7.5,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].poNumber ?? ' '}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 7.5,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].orderNumber ?? ' '}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 4.3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].shipToNumber ?? ''}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 10,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].shipToName ?? ''}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 8,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].fullfillmentStatus ?? ''}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 8,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width / 65),
                                    child: Text(
                                      '${response[index].createdBy}',
                                      style: TextCommon.postTitleStyle(
                                          fontWeight: false,
                                          colorChangeBlack: true,
                                          fontWidth: Get.width / 90),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                width: Get.width / 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 15,
                                    ),
                                    Container(
                                      child: MaterialButton(
                                        onPressed: () {
                                          Get.to(ViewScreen());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Colors.white,
                                              size: Get.width / 90,
                                            ),
                                            SizedBox(
                                              width: Get.width / 250,
                                            ),
                                            Text(
                                              'View',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Get.width / 100,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffAB965D),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 32,
                                      width: Get.width / 11,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: MaterialButton(
                                        onPressed: () {
                                          PostOrdersCartReqModel _user =
                                              PostOrdersCartReqModel();
                                          _user.id =
                                              response[index].shipToNumber;
                                          _user.quantity = '1';
                                          _postOrdersCartViewModel
                                              .postOrdersCartViewModel(
                                                  modell: _user);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.refresh,
                                              color: Colors.white,
                                              size: Get.width / 90,
                                            ),
                                            SizedBox(
                                              width: Get.width / 250,
                                            ),
                                            Text(
                                              'Re-Order',
                                              style: TextStyle(
                                                  fontSize: Get.width / 100,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffAB965D),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 32,
                                      width: Get.width / 11,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    if (Responsive.isDesktop(context)) bottomRowWidget(context),
                    if (Responsive.isMobile(context)) bottomMobileWidget(),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget topWidget() {
    return Container(
      color: Color(0xffF9F9F9),
      width: Get.width,
      height: 150,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order History ',
                  // style: TextStyle(fontSize: Get.width / 22),
                  style: TextStyle(
                      fontSize: Get.width / 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  '(3)',
                  // style: TextCommon.postTitleStyle(fontWeight: true,colorChangeBlack: false,fontWidth: FontWeight.w500),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 10,
                  color: Color(0xffAB965D),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Order History',
                  style: TextStyle(
                    color: Color(0xffAB965D),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
