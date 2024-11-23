import 'package:flutter/material.dart';

class RadiusProvider with ChangeNotifier {
  double _topLeftRadius = 0;
  double _topRightRadius = 0;
  double _bottomLeftRadius = 0;
  double _bottomRightRadius = 0;

  double get topLeftRadius => _topLeftRadius;
  double get topRightRadius => _topRightRadius;
  double get bottomLeftRadius => _bottomLeftRadius;
  double get bottomRightRadius => _bottomRightRadius;

  void setTopLeftRadius(double newRadius) {
    _topLeftRadius = newRadius;
    notifyListeners();
  }

  void setTopRightRadius(double newRadius) {
    _topRightRadius = newRadius;
    notifyListeners();
  }

  void setBottomLeftRadius(double newRadius) {
    _bottomLeftRadius = newRadius;
    notifyListeners();
  }

  void setBottomRightRadius(double newRadius) {
    _bottomRightRadius = newRadius;
    notifyListeners();
  }
}