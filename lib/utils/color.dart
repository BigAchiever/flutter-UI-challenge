import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/utils/theme.dart';

List<LinearGradient> backgroundGradients = [
  const LinearGradient(
    colors: [
      Color.fromARGB(255, 211, 244, 175),
      GradientColors.color1top,
      GradientColors.color1bottom
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
  const LinearGradient(
    colors: [
      GradientColors.colortopright,
      GradientColors.color2top,
      GradientColors.color2bottom
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
  const LinearGradient(
    colors: [
      Color.fromARGB(255, 175, 244, 230),
      Color.fromARGB(255, 50, 139, 120),
      Color.fromARGB(255, 37, 83, 92)
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
];

List<Color> progressColors = [
  GradientColors.color1top,
  GradientColors.color2top,
  GradientColors.color3top,
];
