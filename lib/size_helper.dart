import 'package:doran/main.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class SizeHelper {
  late double _width;
  late double _height;
  late double _scale;

  SizeHelper(BuildContext context) {
    _width = MediaQuery.sizeOf(context).width;
    _height = MediaQuery.sizeOf(context).height;
    _scale = _height / _width;
  }

  void update(BoxConstraints constrain) {
    _width = constrain.maxWidth;
    _height = constrain.maxHeight;
    num scale = (pow(_width.floor(), 2) + pow(_height.floor(), 2));
    _scale = pow(scale, 1 / 2).floorToDouble();
  }
}

double height(double percent) {
  return (MyApp.sizeHelper._height / 100) * percent;
}

double width(double percent) {
  return (MyApp.sizeHelper._width / 100) * percent;
}

double fontSize(double sp) {
  return (MyApp.sizeHelper._scale/100).floor() * sp;
}
