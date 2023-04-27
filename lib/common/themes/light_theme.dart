import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/coloors.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'themes.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  final textTheme = textThemeMethod(base);

  final appBarTheme = appBarThemeMethod(textTheme);
  var inputDecorationTheme = inputDecorationThemeMethod(textTheme);
  final tabBarTheme = tabBarThemeMethod();
  final elevatedButtonTheme = elevatedButtonThemeMethod(textTheme);
  final bottomSheetTheme = bottomSheetThemeMethod();
  final dialogTheme = dialogThemeMethod();
  final floatingActionButtonTheme = floatingActionButtonThemeMethod();
  final listTileTheme = listTileThemeMethod();
  final switchTheme = switchThemeMethod();

  return base.copyWith(
    scaffoldBackgroundColor: Coloors.backgroundLight,
    dialogBackgroundColor: Coloors.backgroundLight,
    indicatorColor: Colors.grey[700],
    disabledColor: Colors.grey[500],
    extensions: [CustomThemeExtension.lightMode],
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    tabBarTheme: tabBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    bottomSheetTheme: bottomSheetTheme,
    dialogTheme: dialogTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,
    listTileTheme: listTileTheme,
    switchTheme: switchTheme,
  );
}

InputDecorationTheme inputDecorationThemeMethod(TextTheme textTheme) {
  return InputDecorationTheme(
    // filled: true,
    // fillColor: Colors.white,
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
    backgroundColor: Coloors.padsyColor,
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
      backgroundColor: Coloors.padsyColor,
      foregroundColor: Coloors.backgroundLight,
      splashFactory: NoSplash.splashFactory,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.radiusInfinite),
      ),
    ),
  );
}

TabBarTheme tabBarThemeMethod() {
  return const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
  );
}

AppBarTheme appBarThemeMethod(TextTheme textTheme) {
  return AppBarTheme(
    backgroundColor: Coloors.backgroundLight,
    titleTextStyle: textTheme.titleMedium,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevation: 0.5,
    shadowColor: Colors.black45,
  );
}
