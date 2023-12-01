// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/auth/mixin/register_mixin.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/my_elevated_button.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/new_textfiled.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/title_text.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with RegisterMixin {
  final User? _user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    _user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: provider.state == ViewState.busy
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: ColorConstants.grey))
          : SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: globalKey,
                child: Padding(
                  padding: const ProjectPadding.all(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                          title: LocaleKeys.register_confirm_register.tr()),
                      NewtextField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (newValue) {
                          email = newValue;
                        },
                        onChanged: (p0) {
                          globalKey.currentState!.save();
                        },
                        validator: validateEmail,
                        nameTextField: LocaleKeys.register_email.tr(),
                      ),
                      NewtextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) {
                            password = newValue;
                          },
                          onChanged: (p0) {
                            globalKey.currentState!.save();
                          },
                          validator: validatePassword,
                          nameTextField: LocaleKeys.register_password.tr()),
                      NewtextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onSaved: (newValue) {
                            rpPassword = newValue;
                          },
                          onChanged: (p0) {
                            globalKey.currentState!.save();
                          },
                          validator: validateRpPassword,
                          nameTextField: LocaleKeys.register_rp_password.tr()),
                      const SizedBox(height: ProjectSizes.middleSize),
                      MyElevatedButton(
                        title: LocaleKeys.register_register.tr(),
                        onTap: () {
                          signUpFormSubmit(context);
                        },
                        color: ColorConstants.blue,
                        textColor: ColorConstants.white,
                      ),
                      const SizedBox(height: ProjectSizes.middleSize),
                      OutlinedButton(
                          onPressed: () {
                            NavigatorManager.instance
                                .pushTopageReplacementNamed(
                                    NavigateRoutes.signIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: ProjectSizes.middleSize),
                            child: Center(
                                child: DefaultText(
                                    color: ColorConstants.blue,
                                    title: LocaleKeys.register_login.tr())),
                          )),
                      const SizedBox(height: ProjectSizes.middleSize),
                      const DefaultText(
                        title:
                            'Регистрируясь, вы принимаете условия Правил и Соглашения об использовании приложении ZHUMUSH TAPP и даете Согласие на Обработку персональных данных',
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
