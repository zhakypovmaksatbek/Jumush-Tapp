import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/views/add_vacancies.dart';
import 'package:jumush_tapp/feature/add_vacancy/views/result_page.dart';
import 'package:jumush_tapp/feature/auth/verification_page.dart';
import 'package:jumush_tapp/feature/auth/view/landing_page.dart';
import 'package:jumush_tapp/feature/auth/view/sign_in.dart';
import 'package:jumush_tapp/feature/auth/view/sign_up.dart';
import 'package:jumush_tapp/feature/home/home_page.dart';
import 'package:jumush_tapp/feature/profile/profile.dart';
import 'package:jumush_tapp/feature/search_page/search_page.dart';
import 'package:jumush_tapp/feature/settings/settings_page.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';

mixin NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    const String paraf = '/';
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateNormal(const HomePage());
    }
    if (routeSettings.name == paraf) {
      return _navigateNormal(const HomePage());
    }
    final routes = routeSettings.name == paraf
        ? NavigateRoutes.home
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));
    switch (routes) {
      case NavigateRoutes.home:
        return _navigateNormal(const HomePage());
      case NavigateRoutes.signUp:
        return _navigateNormal(
          const SignUp(),
        );
      case NavigateRoutes.verification:
        return _navigateNormal(const VerificationPage());
      case NavigateRoutes.vacancy:
        return _navigateNormal(const AddVacancies());
      case NavigateRoutes.result:
        return _navigateNormal(const ResultPage());
      case NavigateRoutes.signIn:
        return _navigateNormal(const SignIn(), isFullscreenDialog: true);
      case NavigateRoutes.landing:
        return _navigateNormal(const LandingPage());
      case NavigateRoutes.profile:
        return _navigateNormal(const ProfilePage());
      case NavigateRoutes.search:
        return _navigateNormal(const SearchPage());
      case NavigateRoutes.settings:
        return _navigateNormal(const SettingsPage());
    }
  }

  Route<dynamic>? _navigateNormal(Widget child, {bool? isFullscreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullscreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
//  final arguments = routeSettings.arguments as Map<String, dynamic>?;

//         if (arguments != null) {
//           final index = arguments['index'] as int?;
//           final ticket = arguments['ticket'] as TicketModel?;

//           if (index != null && ticket != null) {
//             return _navigateNormal(
//                 TicketDetailsPage(index: index, ticket: ticket));
//           }
//         }