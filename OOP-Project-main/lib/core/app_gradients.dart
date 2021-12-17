import 'dart:math';
import 'package:flutter/rendering.dart';

class AppGradient {
  static final blue = LinearGradient(
      begin: Alignment(0.9425625801086426, 8.558517783363584e-10),
      end: Alignment(-8.558517228252072e-10, 0.01472754031419754),
      colors: [
        Color.fromRGBO(168, 194, 248, 1),
        Color.fromRGBO(88, 117, 251, 1)
      ]);

  static final orange = LinearGradient(
      begin: Alignment(0.9425625801086426, 8.558517783363584e-10),
      end: Alignment(-8.558517228252072e-10, 0.01472754031419754),
      colors: [
        Color.fromRGBO(246, 204, 122, 1),
        Color.fromRGBO(237, 154, 138, 1)
      ]);

  static final purple = LinearGradient(
      begin: Alignment(0.9425625801086426, 8.558517783363584e-10),
      end: Alignment(-8.558517228252072e-10, 0.01472754031419754),
      colors: [
        Color.fromRGBO(184, 181, 255, 1),
        Color.fromRGBO(120, 104, 230, 1)
      ]);

  static final purpleSplashScreen = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color.fromRGBO(40, 13, 232, 0.29),
        Color.fromRGBO(184, 181, 255, 0)
      ],
      stops: [0.1641, 0.4908],
      transform: GradientRotation(0.00222222222 * pi));

  static final green = LinearGradient(
      begin: Alignment(1, -1.4458937158678964e-8),
      end: Alignment(1.4458935382322124e-8, 0.10826221853494644),
      colors: [
        Color.fromRGBO(111, 137, 126, 1),
        Color.fromRGBO(19, 44, 51, 0.75)
      ]);

  static final red = LinearGradient(
      begin: Alignment(1, -1.4458937158678964e-8),
      end: Alignment(1.4458935382322124e-8, 0.10826221853494644),
      colors: [
        Color.fromRGBO(237, 154, 138, 1),
        Color.fromRGBO(238, 96, 96, 1)
      ]);

  static final greenCreditCard = LinearGradient(
      begin: Alignment(-1.9930318728711427e-8, -0.9046153426170349),
      end: Alignment(0.9046153426170349, -8.534981610353043e-9),
      colors: [
        Color.fromRGBO(111, 137, 126, 0.4399999976158142),
        Color.fromRGBO(111, 137, 126, 1)
      ]);
}
