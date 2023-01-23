import 'package:flutter/material.dart';

final Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
final double deviceHeight = size.height;
final double deviceWidth = size.width;

class AppPadding {
  static const double p0 = 0.0;
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p40 = 40.0;
  static const double p52 = 52.0;
  static const double p72 = 72.0;
  static const double p100 = 100.0;
}

class AppSize {
  static const double s0 = 0.0;
  static const double s1 = 1.0;
  static const double s1_5 = 1.5;
  static const double s1_3 = 1.3;
  static const double s2 = 2.0;
  static const double s3 = 3.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s56 = 56.0;
  static const double s64 = 64.0;
  static const double s72 = 72.0;
  static const double s82 = 82.0;
  static const double s100 = 100.0;
  static const double s125 = 125.0;
  static const double s175 = 175.0;
  static const double s250 = 250.0;
}

class Time {
  static const Duration t300 = Duration(milliseconds: 150);
  static const Duration t2000 = Duration(milliseconds: 2000);
  static const Duration longTime = Duration(hours: 1);
}
