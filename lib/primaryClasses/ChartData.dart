import 'package:flutter/material.dart';

class ChartData {
  final int x;
  final double y;
  final Color? color;
  final String? name;
  final String? label;

  ChartData(this.x, this.y, [this.color, this.name, this.label]);
}
