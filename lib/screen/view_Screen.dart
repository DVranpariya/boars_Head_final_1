import 'package:flutter/material.dart';
import 'package:flutter_app/Components/CustomWidgets.dart';
import 'package:flutter_app/Components/circular_progress.dart';
import 'package:flutter_app/Components/common_widget_appbar.dart';
import 'package:flutter_app/Components/common_widget_bottombar.dart';
import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/reqestModel/post_orders_cart_reqestmodel.dart';
import 'package:flutter_app/model/responseModel/get_line_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_response.dart';
import 'package:flutter_app/res/Constants.dart';
import 'package:flutter_app/res/test_common.dart';
import 'package:flutter_app/utils/responsive.dart';
import 'package:flutter_app/viewModel/get_line_view_model.dart';
import 'package:flutter_app/viewModel/get_order_view_model.dart';
import 'package:flutter_app/viewModel/post_orders_cart_viewmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'cart_screen.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key key}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  GetLineModel _getLineModel = Get.find();
  GetOrdersViewModel _getOrdersViewModel = Get.find();
  PostOrdersCartViewModel _postOrdersCartViewModel = Get.find();

  @override
  void initState() {
    _getOrdersViewModel.getOrdersViewModel();
    _getLineModel.getLineModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: widgetAppBar(),
      ),
      body: GetBuilder<GetLineModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.LOADING) {
            return circularProgress();
          }
          if (controller.apiResponse.status == Status.ERROR) {
            return Material(
                color: Colors.white, child: Center(child: serverErrorText()));
          }
          if (controller.apiResponse.status == Status.COMPLETE) {
            List<GetLineResponse> response = controller.apiResponse.data;
            response.forEach((element) {
              var mimimd = element.itemUom;
              print('--------------------------------uom---------$mimimd');
            });
            return SingleChildScrollView(
              child: Column(
                children: [
                  widgetSecondAppbar(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlashText('View',
                                  fontSize: 54, fontWeight: FontWeight.w600),
                              FlashText('(11)',
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlashText('Home',
                                  fontSize: 12, fontWeight: FontWeight.w300),
                              Icon(Icons.chevron_right_rounded,
                                  color: kThemeColor, size: 14),
                              FlashText('Order History',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: kThemeColor),
                              Icon(Icons.chevron_right_rounded,
                                  color: kThemeColor, size: 14),
                              FlashText('View',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: kThemeColor),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      GetBuilder<GetOrdersViewModel>(
                        builder: (subController) {
                          if (subController.apiResponse.status ==
                              Status.COMPLETE) {
                            List<GetOrdersResponse> responseHistory =
                                subController.apiResponse.data;

                            return Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Header1(
                                          title: 'Po Number:',
                                          value:
                                              '${responseHistory[0].poNumber ?? ''}'),
                                      VerticalDivider(
                                        thickness: 1,
                                        color: Colors.grey[300],
                                      ),
                                      Header1(
                                          title: 'Order Number:',
                                          value:
                                              '${responseHistory[0].orderNumber ?? ''}'),
                                      Header1(
                                          title: 'Ordered Date:',
                                          value:
                                              '${Jiffy(responseHistory[0].orderedDate.toString().substring(0, responseHistory[0].orderedDate.toString().lastIndexOf(' '))).yMMMMd ?? ''}'),
                                      Header1(
                                          title: 'Ship to Number:',
                                          value:
                                              '${responseHistory[0].shipToNumber ?? ''}'),
                                      Header1(
                                          title: 'Ship to Name:',
                                          value:
                                              '${responseHistory[0].shipToName ?? ''}'),
                                      Header1(
                                          title: 'Shipped Date:',
                                          value:
                                              '${Jiffy(responseHistory[0].creationDate.toString().substring(0, responseHistory[0].orderedDate.toString().lastIndexOf(' '))).yMMMMd ?? ''}'),
                                      AppIconButton(
                                        title: 'Add to Cart',
                                        functionOnPress: () {
                                          PostOrdersCartReqModel _user =
                                              PostOrdersCartReqModel();
                                          _user.id =
                                              responseHistory[0].shipToNumber;
                                          _user.quantity = '1';

                                          _postOrdersCartViewModel
                                              .postOrdersCartViewModel(
                                                  modell: _user)
                                              .then((value) {
                                            return Get.to(CartScreen());
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                          if (subController.apiResponse.status ==
                              Status.ERROR) {
                            return Material(
                                color: Colors.white,
                                child: Center(child: serverErrorText()));
                          } else {
                            return circularProgress();
                          }
                        },
                      ),
                      listViewTopPart(),
                      listViewWidget(response),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppIconButton(title: 'Add to Cart'),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  if (Responsive.isDesktop(context)) bottomRowWidget(context),
                  if (Responsive.isMobile(context)) bottomMobileWidget(),
                ],
              ),
            );
          } else {
            return circularProgress();
          }
        },
      ),
    );
  }

  Container listViewTopPart() {
    return Container(
      height: 80,
      width: Get.width,
      color: Colors.white,
      // color: Colors.deepOrange,
      child: Padding(
        padding: EdgeInsets.all(Get.width / 100),
        child: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Line Number',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Item Number',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Item Name',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Item Unit Of Measure',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Requested Quantity',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Order Status',
                          style: TextCommon.postTitleStyle(
                              fontWeight: true,
                              colorChangeBlack: false,
                              fontWidth: Get.width / 90),
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
    );
  }

  ListView listViewWidget(List<GetLineResponse> response) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: response.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          width: Get.width,
          color: index % 2 == 0 ? Color(0xffF9F9F9) : Color(0xffFFFFFF),
          // color: Colors.deepOrange,
          child: Row(
            children: [
              Container(
                height: Get.height,
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].lineNumber ?? ''}',
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
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].itemNumber ?? ''}',
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
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].itemDescription ?? ''}',
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
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].itemUom ?? ''}',
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
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].requestedQuantity ?? ''}',
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
                width: Get.width / 6.2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width / 65),
                    child: Text(
                      '${response[index].orderStatus ?? ''}',
                      style: TextCommon.postTitleStyle(
                          fontWeight: false,
                          colorChangeBlack: true,
                          fontWidth: Get.width / 90),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
