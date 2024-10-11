
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  static const Color primary = Color(0xff0098FB);
  static const Color dark = Color(0xff003B95);
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFC7C4C4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );


}