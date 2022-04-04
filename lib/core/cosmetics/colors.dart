import 'package:flutter/material.dart';

class AppColors {
  static const transparent = Colors.transparent;
  static const dark = Colors.black;
  static const light = Colors.white;
  static const backgroundGrey = Color(0xffF7F7F7);
  static MaterialColor neutral = getNeutralColor();
}

MaterialColor getNeutralColor() {
  Map<int, Color> color = {
    100: const Color(0xffF2F2F3),
    200: const Color(0xffE5E4E7),
    300: const Color(0xffD3D2D7),
    400: const Color(0xffBEBCC4),
    500: const Color(0xff817E8C),
    600: const Color(0xff5D586C),
    700: const Color(0xff3E3851),
    800: const Color(0xff221A39),
  };
  return MaterialColor(0xffffffff, color);
}
