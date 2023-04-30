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

  const CustomThemeExtension({
    this.errorColor,
    this.successColor,
  });

  static const lightMode = CustomThemeExtension(
    errorColor: Coloors.redLight,
    successColor: Coloors.greenLight,
  );

  static const darkMode = CustomThemeExtension(
    errorColor: Coloors.redDark,
    successColor: Coloors.greenDark,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? errorColor,
    Color? successColor,
  }) {
    return CustomThemeExtension(
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
        errorColor: Color.lerp(errorColor, other.errorColor, t),
        successColor: Color.lerp(successColor, other.successColor, t));
  }
}
