import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimalProvider extends ChangeNotifier {
  //since only a single animal is given now, I didn't make any classes..but for multiple animals
  //we can have a class with differnt meal capacities and differnt sizes
  int meals = 0;
  double height = 150.h;
  double width = 150.w;

  int increaseSize() {
    if (meals < 2) {
      height += 90.h;
      width += 90.h;
      meals++;

      notifyListeners();
      return 1;
    } else {
      meals = 0;
      height = 150.h;
      width = 150.w;

      notifyListeners();
      return 0;
    }
  }
}
