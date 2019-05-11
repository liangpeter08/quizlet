import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color mainPageStart = const Color(0xFF0764f9);
  static const Color mainPageEnd = const Color(0xFF84e2ff);

  static const primaryGradient = const LinearGradient(
    colors: const [mainPageStart, mainPageEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}