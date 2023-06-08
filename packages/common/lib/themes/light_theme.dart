import 'package:common/extension/custom_theme_extension.dart';
import 'package:common/utils/coloors.dart';
import 'package:common/utils/constants.dart';
import 'package:common/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  final textTheme = textThemeMethod(base);

  final appBarTheme = appBarThemeMethod(textTheme);
  var inputDecorationTheme = inputDecorationThemeMethod(textTheme);
  // final tabBarTheme = tabBarThemeMethod();
  final elevatedButtonTheme = elevatedButtonThemeMethod(textTheme);
  final bottomSheetTheme = bottomSheetThemeMethod();
  final dialogTheme = dialogThemeMethod();
  final floatingActionButtonTheme = floatingActionButtonThemeMethod();
  final listTileTheme = listTileThemeMethod();
  final switchTheme = switchThemeMethod();

  return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      dialogBackgroundColor: Colors.white,
      primaryColor: const Color(0xFFFF4E0B),
      unselectedWidgetColor: Colors.black45,
      extensions: [CustomThemeExtension.lightMode],
      textTheme: textTheme,
      appBarTheme: appBarTheme,
      // tabBarTheme: tabBarTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      bottomSheetTheme: bottomSheetTheme,
      dialogTheme: dialogTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      listTileTheme: listTileTheme,
      switchTheme: switchTheme,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFFFF4E0B),
        onPrimary: Colors.white,
        primaryContainer: const Color(0xFFFF4E0B),
        onPrimaryContainer: Colors.white,
        secondary: Colors.blue,
        onSecondary: Colors.white,
        secondaryContainer: Colors.white,
        onSecondaryContainer: Colors.black,
        tertiary: Colors.black45,
        tertiaryContainer: Colors.grey.shade200,
        onTertiaryContainer: Colors.black54,
        error: const Color(0xffb00020),
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
      ));
}

InputDecorationTheme inputDecorationThemeMethod(TextTheme textTheme) {
  return InputDecorationTheme(
    isDense: true,
    labelStyle: textTheme.labelLarge,
    errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black38)),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black38)),
    focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black38)),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black12)),
  );
}

SwitchThemeData switchThemeMethod() {
  return const SwitchThemeData(
    thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
    trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
  );
}

ListTileThemeData listTileThemeMethod() {
  return const ListTileThemeData(
    iconColor: Coloors.greyDark,
    tileColor: Coloors.backgroundLight,
  );
}

FloatingActionButtonThemeData floatingActionButtonThemeMethod() {
  return const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF4E0B),
    foregroundColor: Colors.white,
  );
}

DialogTheme dialogThemeMethod() {
  return DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constants.radiusSmall),
    ),
  );
}

BottomSheetThemeData bottomSheetThemeMethod() {
  return const BottomSheetThemeData(
    backgroundColor: Coloors.backgroundLight,
    modalBackgroundColor: Coloors.backgroundLight,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(Constants.radiusLarge),
    )),
  );
}

ElevatedButtonThemeData elevatedButtonThemeMethod(TextTheme textTheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 40),
      backgroundColor: const Color(0xFFFF4E0B),
      foregroundColor: Coloors.backgroundLight,
      splashFactory: NoSplash.splashFactory,
      textStyle: textTheme.titleMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.radiusInfinite),
      ),
    ),
  );
}

/* TabBarTheme tabBarThemeMethod() {
  return const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
  );
} */

AppBarTheme appBarThemeMethod(TextTheme textTheme) {
  return AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: textTheme.titleMedium,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(color: Colors.black, size: 20),
    elevation: 2,
    shadowColor: Colors.black45,
  );
}
