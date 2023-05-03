import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/coloors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? errorColor;
  final Color? successColor;
  final Color? redColor;

  const CustomThemeExtension({
    this.errorColor,
    this.successColor,
    this.redColor,
  });

  static const lightMode = CustomThemeExtension(
    errorColor: Coloors.redLight,
    successColor: Coloors.greenLight,
    redColor: Coloors.redLight,
  );

  static const darkMode = CustomThemeExtension(
    errorColor: Coloors.redDark,
    successColor: Coloors.greenDark,
    redColor: Coloors.redDark,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? errorColor,
    Color? successColor,
    Color? redColor,
  }) {
    return CustomThemeExtension(
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
      redColor: redColor ?? this.redColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
        errorColor: Color.lerp(errorColor, other.errorColor, t),
        successColor: Color.lerp(successColor, other.successColor, t),
        redColor: Color.lerp(redColor, other.redColor, t));
  }
}
