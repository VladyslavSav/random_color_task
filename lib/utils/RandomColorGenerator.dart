import 'dart:math';

import 'package:flutter/material.dart';

mixin RandomColorGenerator {
  final Random _random = Random();

  Color get randomColor {
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }
}
