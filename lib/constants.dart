import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScaffoldColor = Color(0xFFFAB440);
const Color kPrimaryColor = Color(0xFF07143F);
const Color kSecondaryColor = Color(0xFF4E47C6);
const Color kTextColor = Color(0xFFFFFFFF);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double percentage) {
  if (percentage >= 0.50) {
    return kSecondaryColor;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}