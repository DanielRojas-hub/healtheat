import 'package:common/utils/coloors.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? whiteColor;
  final Color? blackColor;
  final Color? successColor;
  final Color? rateColor;
  final Color? redColor;

  const CustomThemeExtension({
    this.whiteColor,
    this.blackColor,
    this.successColor,
    this.rateColor,
    this.redColor,
  });

  static const lightMode = CustomThemeExtension(
    whiteColor: Colors.white,
    blackColor: Colors.black,
    successColor: Coloors.greenLight,
    rateColor: Colors.amber,
    redColor: Coloors.redLight,
  );

  static const darkMode = CustomThemeExtension(
    whiteColor: Colors.white,
    blackColor: Colors.black,
    successColor: Coloors.greenDark,
    rateColor: Colors.amber,
    redColor: Coloors.redDark,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? whiteColor,
    Color? blackColor,
    Color? successColor,
    Color? rateColor,
    Color? redColor,
  }) {
    return CustomThemeExtension(
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      successColor: successColor ?? this.successColor,
      rateColor: rateColor ?? this.rateColor,
      redColor: redColor ?? this.redColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
        whiteColor: Color.lerp(whiteColor, other.whiteColor, t),
        blackColor: Color.lerp(blackColor, other.blackColor, t),
        successColor: Color.lerp(successColor, other.successColor, t),
        rateColor: Color.lerp(rateColor, other.rateColor, t),
        redColor: Color.lerp(redColor, other.redColor, t));
  }
}
