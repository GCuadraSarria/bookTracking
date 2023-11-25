import 'package:flutter/material.dart';

ColorScheme myDarkTheme() {
  return const ColorScheme.dark(
    primary: Color(0xFFC20E43),
    secondary: Colors.orange,
    background: Color(0xFF121212),
    surface: Color(0xFF333333),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Color.fromARGB(150, 255, 255, 255),
    onError: Colors.white,
  );
}
