import 'package:flutter/widgets.dart';

class SizeUtils {
  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = _screenWidth / 100;
    blockSizeVertical = _screenHeight / 100;
  }

  static textSize11() {
    return SizeUtils.blockSizeHorizontal * 2.7;
  }

  static textSize12() {
    return SizeUtils.blockSizeHorizontal * 2.9;
  }

  static textSize13() {
    return SizeUtils.blockSizeHorizontal * 3.2;
  }

  static textSize14() {
    return SizeUtils.blockSizeHorizontal * 3.4;
  }

  static textSize15() {
    return SizeUtils.blockSizeHorizontal * 3.7;
  }

  static textSize16() {
    return SizeUtils.blockSizeHorizontal* 3.9;
  }
}