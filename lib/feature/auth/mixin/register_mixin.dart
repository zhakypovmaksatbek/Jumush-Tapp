// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/core/exceptions/auth_exceptions.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:provider/provider.dart';

mixin RegisterMixin {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final regexPassword = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])');
  final regexEmail = RegExp(r'^(?=.*?[a-z])(?=.*?[!@#\$&*~])');

  String? validateGeneral(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return LocaleKeys.exceptions_cannot_be_left_blank.tr();
    } else if (passNonNullValue.length < 4) {
      return LocaleKeys.register_min_character.tr();
    }
    return null;
  }

  String? validateEmail(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return LocaleKeys.exceptions_enter_email.tr();
    } else if (passNonNullValue.length < 4) {
      return LocaleKeys.register_min_character.tr();
    } else if (!regexEmail.hasMatch(passNonNullValue)) {
      return LocaleKeys.exceptions_enter_email.tr();
    }
    return null;
  }

  String? validatePassword(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return LocaleKeys.register_enter_password.tr();
    } else if (passNonNullValue.length < 6) {
      return LocaleKeys.register_min_character.tr();
    } else if (!regexPassword.hasMatch(passNonNullValue)) {
      return LocaleKeys.register_min_character.tr();
    }
    return null;
  }

  String? validateRpPassword(String? value) {
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return LocaleKeys.register_enter_password.tr();
    } else if (passNonNullValue.length < 6) {
      return LocaleKeys.register_min_character.tr();
    } else if (!regexPassword.hasMatch(passNonNullValue)) {
      return LocaleKeys.register_min_character.tr();
    } else if (password != rpPassword) {
      return LocaleKeys.does_not_match.tr();
    }
    return null;
  }

  String? email, password, rpPassword;

  Future<void> signInFormSubmit(BuildContext context) async {
    try {
      if (globalKey.currentState!.validate()) {
        final provider = context.read<AuthViewModel>();
        globalKey.currentState!.save();
        final currentUser = await provider.singInWithEmail(email!, password!);
        provider.activeCurrentUser = currentUser?.userID.toString();
      } else {
        return;
      }
    } on FirebaseAuthException catch (e) {
      _showDialog(context, e);
    }
  }

  Future<void> signUpFormSubmit(BuildContext context) async {
    try {
      final provider = context.read<AuthViewModel>();
      if (globalKey.currentState!.validate()) {
        globalKey.currentState!.save();
        final currentUser = await provider.registerUser(email!, password!);
        provider.activeCurrentUser = currentUser?.userID.toString();
      }
    } on FirebaseAuthException catch (e) {
      _showDialog(context, e);
    }
  }
}

Future<dynamic> _showDialog(BuildContext context, FirebaseAuthException e) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor: ColorConstants.white,

        // title: Text(LocaleKeys.exceptions_exceptions.tr()),
        content: DefaultText(title: AuthExceptions.showErrorMessage(e.code)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: DefaultText(
                title: LocaleKeys.ok.tr(),
                color: ColorConstants.blue,
              ))
        ],
      );
    },
  );
}
