import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Components/CustomWidgets.dart';
import 'package:flutter_app/Components/circular_progress.dart';
import 'package:flutter_app/Components/common_widget_appbar.dart';
import 'package:flutter_app/Components/common_widget_bottombar.dart';
import 'package:flutter_app/model/apis/api_response.dart';
import 'package:flutter_app/model/responseModel/get_orders_cart_response.dart';
import 'package:flutter_app/model/responseModel/get_ship_response.dart';
import 'package:flutter_app/res/Constants.dart';
import 'package:flutter_app/res/test_common.dart';
import 'package:flutter_app/screen/order_history.dart';
import 'package:flutter_app/viewModel/get_line_view_model.dart';
import 'package:flutter_app/viewModel/get_orders_cart_viewmodel.dart';
import 'package:flutter_app/viewModel/get_ship_view_model.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../utils/responsive.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GetShipViewModel _getShipViewModel = Get.find();
  GetLineModel _getLineModel = Get.find();
  GetOrdersCartViewModel _getOrdersCartViewModel = Get.find();

  // Color milan = Colors.deepPurple;
  // Animation _animation;
  // Color textColor;
  // Color borderColor;
  // Animation _borderAnimation;

  // AnimationController _container;
  // @override
  // void initState() {
  //   // textColor = ButtonColors.defaultColor;
  //   // borderColor = ButtonColors.defaultColor
  //   // _container =
  //   //     AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  //   // _animation = Tween(begin: 0.0, end: 500.0)
  //   //     .animate(CurvedAnimation(parent: _container, curve: Curves.easeIn))
  //   //       ..addListener(() {
  //   //         setState(() {});
  //   //       });
  //   // _borderAnimation =
  //   //     ColorTween(begin: ButtonColors.defaultColor, end: widget.animationColor)
  //   //         .animate(
  //   //   CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
  //   //);
  //   //super.initState();
  // }
  @override
  void initState() {
    _getLineModel.getLineModel();
    _getOrdersCartViewModel.getOrdersCartViewModel();
    _getShipViewModel.getShipViewModel();
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
      body: GetBuilder<GetOrdersCartViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.LOADING) {
            return circularProgress();
          }
          if (controller.apiResponse.status == Status.ERROR) {
            return Material(
                color: Colors.white, child: Center(child: serverErrorText()));
          }
          if (controller.apiResponse.status == Status.COMPLETE) {
            List<GetOrdersCartResponse> responseLine =
                controller.apiResponse.data;
            return Container(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // MaterialButton(
                    //   onPressed: () {
                    //     var prevMonth =
                    //         new DateTime(date.year, date.month - 1, date.day);
                    //
                    //     String fname = responseLine[0].requestedDate.substring(
                    //         0, responseLine[0].requestedDate.lastIndexOf(' '));
                    //
                    //     String fname = responseLine[0].requestedDate.substring(
                    //         0,
                    //         googleSignInAccount.displayName.lastIndexOf(' '));
                    //
                    //     String lname = googleSignInAccount.displayName
                    //         .substring(googleSignInAccount.displayName
                    //                 .lastIndexOf(' ') +
                    //             1);
                    //     String date =
                    //         DateFormat('dd-MMM-yyyy HH:mm').format(d1);
                    //
                    //     DateTime follow = DateTime.parse(
                    //         "${responseLine[0].requestedDate.substring(6, 10)}-${f.followDate.substring(3, 5)}-${f.followDate.substring(0, 2)}");
                    //   },
                    // ),
                    widgetSecondAppbar(),
                    topWidget(),
                    GetBuilder<GetShipViewModel>(
                      builder: (subController) {
                        if (subController.apiResponse.status ==
                            Status.COMPLETE) {
                          List<GetShipResponse> responseShip =
                              subController.apiResponse.data;

                          return secondWidget(responseShip);
                        }
                        if (subController.apiResponse.status == Status.ERROR) {
                          return Material(
                              color: Colors.white,
                              child: Center(child: serverErrorText()));
                        } else {
                          return circularProgress();
                        }
                      },
                    ),
                    listViewTopPart(),
                    listViewWidget(responseLine),
                    Container(
                      height: 100,
                      width: Get.width,
                      color: Color(0xffFFFFFF),
                      // color: Colors.deepOrange,
                      child: Row(
                        children: [
                          Container(
                            height: Get.height,
                            width: Get.width / 6.2,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: Get.width / 7,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black54)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(fontSize: Get.width / 90),
                                      border: InputBorder.none,
                                      labelText: 'Enter item number',
                                    ),
                                  ),
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
                                  'Bold aloha sunshine pineapple roasted turkey breast',
                                  style: TextCommon.postTitleStyle(
                                      fontWeight: false,
                                      colorChangeBlack: true,
                                      fontWidth: Get.width / 100),
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
                                  '10 pieces',
                                  style: TextCommon.postTitleStyle(
                                      fontWeight: false,
                                      colorChangeBlack: true,
                                      fontWidth: Get.width / 100),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height,
                            width: Get.width / 6.2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: Get.width / 7,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black54)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(fontSize: Get.width / 90),
                                      border: InputBorder.none,
                                      labelText: 'Enter Requested Qty',
                                    ),
                                  ),
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
                                  'Dec 2, 2017',
                                  style: TextCommon.postTitleStyle(
                                      fontWeight: false,
                                      colorChangeBlack: true,
                                      fontWidth: Get.width / 100),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height,
                            width: Get.width / 6.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.save,
                                          color: Colors.white,
                                          size: Get.width / 90,
                                        ),
                                        SizedBox(
                                          width: Get.width / 250,
                                        ),
                                        Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Get.width / 100,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xff90BF9B),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 32,
                                  width: Get.width / 11,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.white,
                                          size: Get.width / 90,
                                        ),
                                        SizedBox(
                                          width: Get.width / 250,
                                        ),
                                        Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: Get.width / 100,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xffE67D87).withOpacity(.7),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 32,
                                  width: Get.width / 11,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (Responsive.isDesktop(context)) bottomRowWidget(context),
                    if (Responsive.isMobile(context)) bottomMobileWidget(),
                  ],
                ),
              ),
            );
          } else {
            return circularProgress();
          }
        },
      ),
    );
  }

  Container secondWidget(List<GetShipResponse> responseShip) {
    return Container(
      height: 80,
      width: Get.width,
      color: Color(0xffFFFFFF),
      // color: Colors.deepOrange,
      child: Padding(
        padding: EdgeInsets.all(Get.width / 100),
        child: Row(
          children: [
            Container(
              height: Get.height,
              width: Get.width / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlashText(
                    'Order Date:',
                    color: kThemeColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                  FlashText(
                    '${responseShip[0].billToUserId ?? ''}',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            Container(
              height: Get.height,
              width: Get.width / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlashText(
                    'Ship to Number:',
                    color: kThemeColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                  FlashText(
                    '${responseShip[0].shipToNumber ?? ''}',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            Container(
              height: Get.height,
              width: Get.width / 6.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlashText(
                    'Ship to Name:',
                    color: kThemeColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                  FlashText(
                    '${responseShip[0].partySiteName}',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.width / 90,
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: Get.width / 70,
                    ),
                    SizedBox(
                      width: Get.width / 250,
                    ),
                    Text(
                      'Add Product',
                      style: TextStyle(
                          fontSize: Get.width / 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xffAB965D),
                  borderRadius: BorderRadius.circular(20)),
              height: 43,
              width: Get.width / 7,
            ),
            SizedBox(
              width: Get.width / 90,
            ),
            VerticalDivider(
              color: Colors.grey[300],
            ),
            SizedBox(
              width: Get.width / 90,
            ),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Get.to(OrderHistory());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: Get.width / 70,
                    ),
                    SizedBox(
                      width: Get.width / 250,
                    ),
                    Text(
                      'Place Order',
                      style: TextStyle(
                          fontSize: Get.width / 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xffAB965D),
                  borderRadius: BorderRadius.circular(20)),
              height: 43,
              width: Get.width / 7,
            ),
          ],
        ),
      ),
    );
  }

  Container listViewTopPart() {
    return Container(
      height: 80,
      width: Get.width,
      color: Color(0xffFFFFFF),
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
                          'Item Number',
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Item Description',
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Item unit of Measure',
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
                        child: Text(
                          'Requested Date',
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
              width: Get.width / 6.2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Get.width / 700),
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
    );
  }

  ListView listViewWidget(List<GetOrdersCartResponse> responseList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: responseList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
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
                      '${responseList[index].itemNumber ?? ''}',
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
                      '${responseList[index].itemDetails.itemDescription ?? ''}',
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
                      '${responseList[index].itemDetails.itemUom ?? ''}',
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
                      '${responseList[index].requestedQuantity ?? ''}',
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
                      '${Jiffy(responseList[index].itemDetails.itemStartDate.toString().substring(0, responseList[index].itemDetails.itemStartDate.toString().lastIndexOf(' '))).yMMMMd ?? ''}',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          borderRadius: BorderRadius.circular(20)),
                      height: 32,
                      width: Get.width / 11,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          borderRadius: BorderRadius.circular(20)),
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
                  'Cart',
                  // style: TextStyle(fontSize: Get.width / 22),
                  style: TextStyle(
                      fontSize: Get.width / 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  '(11)',
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
                ),
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
                  'Cart',
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
