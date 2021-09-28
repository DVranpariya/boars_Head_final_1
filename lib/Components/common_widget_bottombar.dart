import 'package:flutter/material.dart';
import 'package:flutter_app/res/Constants.dart';
import 'package:flutter_app/utils/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'CustomWidgets.dart';

Widget bottomMobileWidget() {
  return Container(
    width: Get.width,
    color: Color(0xff211f1d),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              // height: 300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/login-logo.jpeg',
                        ),
                        height: 200,
                        width: Get.width / 1.1,
                      ),
                      SizedBox(height: 20),
                      FlashText(
                        '© 2021 Boar’s Head Brand\nAll rights reserved.',
                        color: kThemeColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.facebookF,
                              color: kThemeColor, size: Get.width / 40),
                          SizedBox(width: Get.width / 60),
                          FaIcon(FontAwesomeIcons.instagram,
                              color: kThemeColor, size: Get.width / 40),
                          SizedBox(width: Get.width / 60),
                          FaIcon(FontAwesomeIcons.youtube,
                              color: kThemeColor, size: Get.width / 40),
                          SizedBox(width: Get.width / 60),
                          FaIcon(FontAwesomeIcons.pinterestP,
                              color: kThemeColor, size: Get.width / 40),
                          SizedBox(width: Get.width / 60),
                          FaIcon(FontAwesomeIcons.linkedinIn,
                              color: kThemeColor, size: Get.width / 40),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 100),
                    child: VerticalDivider(
                        color: kThemeColor, thickness: 0.5, width: 1),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlashText('Information',
                        color: kThemeColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: Get.width / 30),
                    SizedBox(height: 20),
                    FlashText(
                      'About Us',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Delivery Information',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Privacy Policy',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Sales',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'About Us',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                  ],
                ),
                SizedBox(width: Get.width / 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlashText('Account',
                        color: kThemeColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: Get.width / 30),
                    SizedBox(height: 20),
                    FlashText(
                      'My Account',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'My Orders',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Returns',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Shipping',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                  ],
                ),
                SizedBox(width: Get.width / 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlashText('Store',
                        color: kThemeColor,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: Get.width / 30),
                    SizedBox(height: 20),
                    FlashText(
                      'Affiliate',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Best Sellers',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Discount',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                    SizedBox(height: 14),
                    FlashText(
                      'Latest Products',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.width / 40,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlashText(
                      'Sign up for our dish worthy newsletter',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: Get.width / 30,
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Join Today ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.width / 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffAB965D),
                          borderRadius: BorderRadius.circular(30)),
                      height: 43,
                      width: Get.width / 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlashText(
                      'Available at fine establishments nationwide',
                      color: kThemeColor,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: Get.width / 30,
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Find A Store Near You',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.width / 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffAB965D),
                          borderRadius: BorderRadius.circular(30)),
                      height: 43,
                      width: Get.width / 2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
  );
}

Container bottomRowWidget(BuildContext context) {
  return Container(
    width: Get.width,
    color: Color(0xff211f1d),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 40, vertical: 40),
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomFirst(),
                  SizedBox(
                    width: Get.width / 50,
                  ),
                  bottomSecond(),
                ],
              ),
          ],
        )),
  );
}

Column bottomSecond() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    // mainAxisSize: MainAxisSize.max,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlashText(
            'Sign up for our dish worthy newsletter',
            color: kThemeColor,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: Get.width / 70,
          ),
          SizedBox(height: 10),
          Container(
            child: MaterialButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  'Join Today ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.width / 80,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xffAB965D),
                borderRadius: BorderRadius.circular(30)),
            height: 43,
            width: Get.width / 5.5,
          ),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlashText(
            'Available at fine establishments nationwide',
            color: kThemeColor,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            fontSize: Get.width / 70,
          ),
          SizedBox(height: 10),
          Container(
            child: MaterialButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  'Find A Store Near You',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.width / 80,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xffAB965D),
                borderRadius: BorderRadius.circular(30)),
            height: 43,
            width: Get.width / 5.5,
          ),
        ],
      ),
    ],
  );
}

Container bottomFirst() {
  return Container(
    width: Get.width / 1.7,
    // height: 300,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Image.asset(
                'assets/images/login-logo.jpeg',
              ),
              height: 100,
              width: Get.width / 20,
            ),
            SizedBox(height: 20),
            FlashText(
              '© 2021 Boar’s Head Brand\nAll rights reserved.',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.facebookF,
                    color: kThemeColor, size: Get.width / 80),
                SizedBox(width: Get.width / 60),
                FaIcon(FontAwesomeIcons.instagram,
                    color: kThemeColor, size: Get.width / 80),
                SizedBox(width: Get.width / 60),
                FaIcon(FontAwesomeIcons.youtube,
                    color: kThemeColor, size: Get.width / 80),
                SizedBox(width: Get.width / 60),
                FaIcon(FontAwesomeIcons.pinterestP,
                    color: kThemeColor, size: Get.width / 80),
                SizedBox(width: Get.width / 60),
                FaIcon(FontAwesomeIcons.linkedinIn,
                    color: kThemeColor, size: Get.width / 80),
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 100),
          child: VerticalDivider(color: kThemeColor, thickness: 0.5, width: 1),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashText('Information',
                color: kThemeColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: Get.width / 70),
            SizedBox(height: 20),
            FlashText(
              'About Us',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Delivery Information',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Privacy Policy',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Sales',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'About Us',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
          ],
        ),
        SizedBox(width: Get.width / 70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlashText('Account',
                color: kThemeColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: Get.width / 70),
            SizedBox(height: 20),
            FlashText(
              'My Account',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'My Orders',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Returns',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Shipping',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
          ],
        ),
        SizedBox(width: Get.width / 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlashText('Store',
                color: kThemeColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: Get.width / 70),
            SizedBox(height: 20),
            FlashText(
              'Affiliate',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Best Sellers',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Discount',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
            SizedBox(height: 14),
            FlashText(
              'Latest Products',
              color: kThemeColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: Get.width / 90,
            ),
          ],
        ),
      ],
    ),
  );
}
