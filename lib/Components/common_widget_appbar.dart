import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/Constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import 'CustomWidgets.dart';

Widget widgetAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    flexibleSpace: Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/login-logo-two.png',
            height: 100,
            width: Get.width / 6,
            fit: BoxFit.cover,
          ),
          CustomTextField(
            hintText: 'Search for products',
            suffix: Icon(Icons.search, color: kThemeColor, size: 24),
          ),
          Row(
            children: [
              Icon(Icons.person_outline_outlined,
                  color: kThemeColor, size: Get.width / 45),
              SizedBox(width: 20),
              Icon(Icons.favorite_border_outlined,
                  color: kThemeColor, size: Get.width / 45),
              SizedBox(width: 20),
              Icon(Icons.shopping_cart_outlined,
                  color: kThemeColor, size: Get.width / 45),
            ],
          )
        ],
      ),
    ),
  );
}

Widget widgetSecondAppbar() {
  return Container(
    height: 60,
    width: Get.width,
    color: Color(0xff131313),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: Get.width / 100,
            ),
            Text(
              'Home',
              style: TextStyle(
                  // fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w600,
                  fontSize: Get.width / 80,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              width: Get.width / 100,
            ),
            Text(
              'Haberdashery',
              style: TextStyle(
                  // fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w600,
                  fontSize: Get.width / 80,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              width: Get.width / 100,
            ),
            Text(
              'Protein',
              style: TextStyle(
                  // fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w600,
                  fontSize: Get.width / 80,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              width: Get.width / 100,
            ),
            Text(
              'Order History',
              style: TextStyle(
                  // fontFamily: 'Poppins',
                  // fontWeight: FontWeight.w600,
                  fontSize: Get.width / 80,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Color(0xffAB965D),
          thickness: 5,
          height: 4,
        ),
      ],
    ),
  );
}
