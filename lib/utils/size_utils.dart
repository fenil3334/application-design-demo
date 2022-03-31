import 'package:flutter/cupertino.dart';

class SizeUtils {
  static late double _screenHeight;
  static late double _screenWidth;
  static late double horizontalSize;
  static late double verticalSize;

  void sizeUnit(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    verticalSize = _screenHeight / 100;
    horizontalSize = _screenWidth / 100;
  }
}
