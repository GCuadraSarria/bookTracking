import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color(0xFF121212),
    primary: const Color(0xFFBB86FC),
    secondary: const Color(0xFF03DAC6),
    // surface is 5% white over background
    surface: Color.alphaBlend(
        const Color.fromRGBO(255, 255, 255, 0.05), const Color(0xFF121212)),
    error: const Color(0xffCF6679),
    onPrimary: const Color(0xFF000000),
    onSecondary: const Color(0xFF000000),
    onError: const Color(0xFF000000),
    onBackground: const Color(0xFFFFFFFF),
  ),
);
