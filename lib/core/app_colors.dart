import 'package:flutter/material.dart';

class AppColors {
  static const beigeColor = Color(0xFF1C0F0D);
  static const pinkSub = Color(0xFFFD5D69);

  static const pink = Color(0xFFFFC6C9);

  static final lightColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: pinkSub,
    onPrimary: Colors.white,
    secondary: pink,
    onSecondary: Colors.white,
    error: pinkSub,
    onError: Colors.white,
    surface: beigeColor,
    onSurface: Colors.white,
  );
}
