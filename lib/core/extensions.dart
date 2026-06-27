import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  // Screen dimensions
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Responsive fractions — e.g. context.w(0.5) = 50% of screen width
  double w(double factor) => screenWidth * factor;
  double h(double factor) => screenHeight * factor;

  // Responsive padding shortcuts
  double get horizontalPadding => screenWidth * 0.05; // 5% of width
  double get verticalPadding => screenHeight * 0.02; // 2% of height

  // Breakpoints
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  // Text scale — respects user accessibility settings
  double get textScale => MediaQuery.textScalerOf(this).scale(1);
}

extension SpacingExtension on num {
  // Vertical space  — usage: 16.h  (a SizedBox of height 16)
  SizedBox get vSpace => SizedBox(height: toDouble());

  // Horizontal space — usage: 8.w  (a SizedBox of width 8)
  SizedBox get hSpace => SizedBox(width: toDouble());
}
