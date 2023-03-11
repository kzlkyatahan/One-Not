import 'package:flutter/material.dart';

class CurvedRectArcTween extends MaterialRectArcTween {
  CurvedRectArcTween({
    Rect? begin,
    Rect? end,
  }) : super(begin: begin, end: end);
  @override
  Rect lerp(double t) {
    Cubic easeInOut = Cubic(0.42, 0.0, 0.58, 1.0);
    double curvedT = easeInOut.transform(t);
    return super.lerp(curvedT);
  }
}