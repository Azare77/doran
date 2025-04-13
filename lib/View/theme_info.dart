import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData defaultThemeData(BuildContext context) {
    return ThemeData(
      primaryColor: const Color(0xffbd8715),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      dialogTheme: DialogTheme(backgroundColor: const Color(0xFF0F204E)),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF2F3C65),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: const Color(0xFF122559),
      dividerColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(Size(width(80), height(5))),
          foregroundColor: WidgetStateProperty.all(Colors.black),
          backgroundColor: WidgetStateProperty.all(const Color(0xffe4b032)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: const Color(0xff15202b)),
      cardTheme: CardTheme(color: const Color(0xFF2D54BB)),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
        fontFamily: 'Vazir',
      ),
    );
  }
  static ThemeData persianThemeData(BuildContext context) {
    return ThemeData(
      primaryColor: const Color(0xff106216),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      dialogTheme: DialogTheme(backgroundColor: const Color(0xFFC09C4A)),
      appBarTheme: const AppBarTheme(
        color: Color(0xFFF3B015),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: const Color(0xFFF5E8C7),
      dividerColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(Size(width(80), height(5))),
          foregroundColor: WidgetStateProperty.all(Colors.black),
          backgroundColor: WidgetStateProperty.all(const Color(0xffcbef83)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.black54,
        textColor: Colors.black,
      ),
      // cardTheme: CardTheme(color: const Color(0xFF2D54BB)),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.blue,
        fontFamily: 'Vazir',
      ),
    );
  }
}
