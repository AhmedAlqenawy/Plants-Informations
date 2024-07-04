import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color secondColor;
  final Color messageColor;
  final Color acceptedColor;
  final Color radioColor;
  final Color sellerColor;

  CustomThemeExtension({
    required this.secondColor,
    required this.messageColor,
    required this.acceptedColor,
    required this.radioColor,
    required this.sellerColor,
  });

  @override
  CustomThemeExtension copyWith({
    Color? secondColor,
    Color? messageColor,
    Color? acceptedColor,
    Color? radioColor,
    Color? sellerColor,
  }) {
    return CustomThemeExtension(
      secondColor: secondColor ?? this.secondColor,
      messageColor: messageColor ?? this.messageColor,
      acceptedColor: acceptedColor ?? this.acceptedColor,
      radioColor: radioColor ?? this.radioColor,
      sellerColor: sellerColor ?? this.sellerColor,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      secondColor: Color.lerp(secondColor, other.secondColor, t)!,
      messageColor: Color.lerp(secondColor, other.secondColor, t)!,
      radioColor: Color.lerp(radioColor, other.radioColor, t)!,
      acceptedColor: Color.lerp(acceptedColor, other.acceptedColor, t)!,
      sellerColor: Color.lerp(sellerColor, other.sellerColor, t)!,
    );
  }
}
