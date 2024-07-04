import 'package:flutter/material.dart';

extension DoubleConvert on double {
  BorderRadiusGeometry get toCircular => BorderRadius.circular((this));
}
