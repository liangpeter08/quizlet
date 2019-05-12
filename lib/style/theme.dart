import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color mainPageStart = const Color(0xFFff4d4d);
  static const Color mainPageEnd = const Color(0xFFff9999);
  static const Color questionPageStart = const Color(0xFF002eb0);
  static const Color questionPageEnd = const Color(0xFF6cc2ed);

  static const primaryGradient = const LinearGradient(
    colors: const [mainPageStart, mainPageEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}