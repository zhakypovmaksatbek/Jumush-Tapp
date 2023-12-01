import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';

class GeneralFunction {
  static final List<String> cities = [
    "Bishkek",
    "Batken",
    "Jalal-Abad",
    "Naryn",
    "Osh",
    "Talas",
    "Ysyk-Kol",
  ];
  static final Map<String, IconData> categoryMap = {
    'Автобизнес, сервисное обслуживание': Icons.directions_car,
    'IT, компьютеры, связь': Icons.computer,
    'Домашний персонал и уборка': Icons.home,
    'Маркетинг, реклама, PR': Icons.price_check_rounded,
    'Медицина, фармацевтика': Icons.local_hospital,
    'Недвижимость': Icons.home_outlined, 'Образование, наука': Icons.school,
    'Отели, кафе, рестораны': Icons.restaurant,
    'Охрана, безопасность': Icons.security,
    'Продажи, работа с клиентами': Icons.shopping_cart,
    'Работа за границей': Icons.airplanemode_active,
    'Развлечения, спорт': Icons.sports_soccer,
    'Салоны красоты': Icons.spa,
    'Сетевой маркетинг': Icons.group,
    'Склад': Icons.archive, 'Строительные специальности': Icons.build,
    'Такси, логистика, доставка': Icons.local_shipping,
    'Швейное дело': Icons.accessibility_new,

    'Другие специальности': Icons.work,

    // İhtiyacınıza göre diğer kategoriler ve ikonları ekleyin
  };

  static String formatShareDate(DateTime whenShare) {
    final now = DateTime.now();
    final difference = now.difference(whenShare);

    if (difference.inDays == 0) {
      // Bugun jaryialangan bolso
      if (difference.inHours < 1) {
        // 1 saattan az bolso
        return "${difference.inMinutes} ${LocaleKeys.minutes.tr()}";
      } else {
        // 1 saattan kop bolso
        return "${difference.inHours} ${LocaleKeys.hours.tr()}";
      }
    } else if (difference.inDays == 1) {
      // Keche jaryialangan bolso
      return LocaleKeys.day.tr();
    } else {
      // 2 kun murda jaryialangan bolso
      return DateFormat('dd.MM.yyyy').format(whenShare);
    }
  }
}
