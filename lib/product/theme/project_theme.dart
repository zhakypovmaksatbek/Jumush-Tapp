import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/project_sizes.dart';

class ProjectTheme extends ChangeNotifier {
  bool lightMode = true;
  void changeTheme(bool value) {
    lightMode = value;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.light(
            primary: ColorConstants.blue,
            onPrimary: ColorConstants.grey,
            background: ColorConstants.white,
            secondary: ColorConstants.iconColor),
        scaffoldBackgroundColor: ColorConstants.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorConstants.white,
          iconTheme: IconThemeData(color: ColorConstants.iconColor),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: ColorConstants.iconColor,
            fontWeight: FontWeight.w800,
          ),
          headlineLarge: TextStyle(
            color: ColorConstants.iconColor,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: ColorConstants.iconColor,
          ),
          titleLarge: TextStyle(
            color: ColorConstants.iconColor,
            fontWeight: FontWeight.w800,
          ),
          displayLarge: TextStyle(
            color: ColorConstants.iconColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
          color: ColorConstants.iconColor,
        )),
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(ColorConstants.iconColor))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, backgroundColor: ColorConstants.blue),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ProjectSizes.radius),
                ),
              ),
              side: const MaterialStatePropertyAll(BorderSide(
                  width: 1.5,
                  color: ColorConstants.blue,
                  style: BorderStyle.solid))),
        ),
      );
// Dark Theme
  ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
            primary: ColorConstants.blue,
            onPrimary: ColorConstants.defaultGrey,
            background: ColorConstants.background,
            secondary: ColorConstants.white),
        scaffoldBackgroundColor: ColorConstants.background,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: ColorConstants.background),
        iconTheme: const IconThemeData(color: ColorConstants.defaultGrey),
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
                iconColor:
                    MaterialStatePropertyAll(ColorConstants.defaultGrey))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, backgroundColor: ColorConstants.blue),
        listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
          color: ColorConstants.whiteGrey,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ProjectSizes.radius), // İstenilen border radius değeri
                ),
              ),
              side: const MaterialStatePropertyAll(BorderSide(
                  width: 1.5,
                  color: ColorConstants.defaultGrey,
                  style: BorderStyle.solid))),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: ColorConstants.whiteGrey,
            fontWeight: FontWeight.w800,
          ),
          headlineLarge: TextStyle(
            color: ColorConstants.whiteGrey,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: ColorConstants.whiteGrey,
          ),
          titleLarge: TextStyle(
            color: ColorConstants.whiteGrey,
            fontWeight: FontWeight.w800,
          ),
          displayLarge: TextStyle(
            color: ColorConstants.whiteGrey,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
}
