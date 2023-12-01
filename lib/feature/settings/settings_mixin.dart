import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/settings/settings_page.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/languages.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';

mixin SettingsMixin on State<SettingsPage> {
  void selectedLanguage(String language) {
    Locale locale;
    switch (language) {
      case 'English':
        locale = const Locale('en');
      case 'Кыргызча':
        locale = const Locale('ky');
      case 'Русский':
        locale = const Locale('ru');
      default:
        locale = const Locale('en');
    }
    context.setLocale(locale);
  }

  final List<DropdownMenuItem<String>>? items = [
    DropdownMenuItem(
      value: Language.English.displayName,
      child: DefaultText(
        title: Language.English.name,
        color: ColorConstants.defaultGrey,
      ),
    ),
    DropdownMenuItem(
      value: Language.Kyrgyz.displayName,
      child: DefaultText(
        title: Language.Kyrgyz.displayName,
        color: ColorConstants.defaultGrey,
      ),
    ),
    DropdownMenuItem(
      value: Language.Russian.displayName,
      child: DefaultText(
        title: Language.Russian.displayName,
        color: ColorConstants.defaultGrey,
      ),
    ),
  ];
}
