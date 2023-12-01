import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/core/locator/set_up_locator.dart';
import 'package:jumush_tapp/feature/home/home_page.dart';
import 'package:jumush_tapp/product/initialize/initialize_project.dart';
import 'package:jumush_tapp/product/navigation/navigator_custom.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/theme/project_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();
  await InitializeProject.initProject();
  runApp(
    InitializeProject.easyLocalization(const MyApp()),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectTheme>(
      builder: (context, themeProvider, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.lightMode
            ? ProjectTheme().lightTheme
            : ProjectTheme().darkTheme,
        darkTheme: ProjectTheme().darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        },
        home: const HomePage(),
      ),
    );
  }
}
