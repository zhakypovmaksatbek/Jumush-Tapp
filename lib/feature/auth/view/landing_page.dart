// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/add_vacancy/views/add_vacancies.dart';
import 'package:jumush_tapp/feature/auth/view/sign_in.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context);

    if (provider.user == null) {
      return const SignIn();
    } else {
      return const AddVacancies();
    }
  }
}
