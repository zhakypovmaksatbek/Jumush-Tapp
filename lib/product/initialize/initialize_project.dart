import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/vacancy_provider.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/firebase_options.dart';
import 'package:jumush_tapp/product/theme/project_theme.dart';
import 'package:provider/provider.dart';

class InitializeProject {
  static Future<void> initProject() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  static EasyLocalization easyLocalization(Widget child) {
    return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
          Locale('ky'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale(
          'ky',
        ),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => VacancyProvider()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => ProjectTheme()),
          ],
          child: child,
        ));
  }
}
