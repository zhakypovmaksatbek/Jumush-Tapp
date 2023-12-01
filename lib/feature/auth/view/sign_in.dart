// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/auth/mixin/register_mixin.dart';
import 'package:jumush_tapp/feature/auth/view_model/auth_view_model.dart';
import 'package:jumush_tapp/generated/locale_keys.g.dart';
import 'package:jumush_tapp/product/constants/image_constants.dart';
import 'package:jumush_tapp/product/constants/index.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/my_elevated_button.dart';
import 'package:jumush_tapp/product/widgets/text_filelds/new_textfiled.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: provider.state == ViewState.busy
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: ColorConstants.iconColor))
          : SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: globalKey,
                child: Padding(
                  padding: const ProjectPadding.all(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Column(
                        children: [
                          Image.asset(
                            ImagesEnum.logo2.path,
                            height: 150,
                            color: ColorConstants.blue,
                          ),
                          const SizedBox(
                            height: ProjectSizes.defaultSize,
                          ),
                        ],
                      )),
                      NewtextField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (newValue) {
                          email = newValue;
                        },
                        validator: validateEmail,
                        nameTextField: LocaleKeys.register_email.tr(),
                      ),
                      NewtextField(
                          validator: validatePassword,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          onSaved: (newValue) {
                            password = newValue;
                          },
                          nameTextField: LocaleKeys.register_password.tr()),
                      Row(
                        children: [
                          DefaultText(title: LocaleKeys.have_your_account.tr()),
                          TextButton(
                              onPressed: () {
                                NavigatorManager.instance
                                    .pushTopageReplacementNamed(
                                        NavigateRoutes.signUp);
                              },
                              child: DefaultText(
                                title: LocaleKeys.register_register.tr(),
                                color: ColorConstants.blue,
                              )),
                        ],
                      ),
                      const SizedBox(height: ProjectSizes.middleSize),
                      MyElevatedButton(
                        title: LocaleKeys.register_login.tr(),
                        onTap: () {
                          signInFormSubmit(context);
                        },
                        color: ColorConstants.blue,
                        textColor: ColorConstants.white,
                      ),
                      const SizedBox(height: ProjectSizes.middleSize),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
