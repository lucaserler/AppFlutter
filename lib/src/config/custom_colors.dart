import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(255, 168, 62, .1),
  100: const Color.fromRGBO(255, 168, 62, .2),
  200: const Color.fromRGBO(255, 168, 62, .3),
  300: const Color.fromRGBO(255, 168, 62, .4),
  400: const Color.fromRGBO(255, 168, 62, .5),
  500: const Color.fromRGBO(255, 168, 62, .6),
  600: const Color.fromRGBO(255, 168, 62, .7),
  700: const Color.fromRGBO(255, 168, 62, .8),
  800: const Color.fromRGBO(255, 168, 62, .9),
  900: const Color.fromRGBO(255, 168, 62, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.pink.shade700;
  static Color customContrastColorNomeApp = const Color.fromRGBO(8, 142, 13, 1);

  static MaterialColor customSwatchtColor =
      MaterialColor(0xffFFA83E, _swatchOpacity);
}
