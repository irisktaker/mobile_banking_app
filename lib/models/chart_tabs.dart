import 'package:flutter/material.dart';

class ChartTabs {
  String calender;
  Color color;
  bool isSelected;

  ChartTabs({
    required this.calender,
    this.color = const Color(0xFF608EE9),
    required this.isSelected,
  });
}
