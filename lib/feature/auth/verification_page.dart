// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumush_tapp/feature/auth/mixin/verification_mixin.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';
import 'package:jumush_tapp/product/constants/project_paddings.dart';
import 'package:jumush_tapp/product/constants/project_sizes.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/product/widgets/buttons/my_elevated_button.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/default_text.dart';
import 'package:jumush_tapp/product/widgets/text_widgets/title_text.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with VerificationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const ProjectPadding.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(title: "Введите  проверочный код"),
            const SizedBox(height: ProjectSizes.middleSize),
            const DefaultText(
                title: "Мы отправили проверечный код на номер +7999******00"),
            const SizedBox(height: ProjectSizes.largeSize),
            Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VerificationTextField(
                      onSaved: (p0) {},
                      controller: controllerP0,
                      onChanged: (value) {
                        updateButtonColor();
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    VerificationTextField(
                      onChanged: (value) {
                        updateButtonColor();
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (p1) {},
                      controller: controllerP1,
                    ),
                    VerificationTextField(
                      onChanged: (value) {
                        updateButtonColor();
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (p2) {},
                      controller: controllerP2,
                    ),
                    VerificationTextField(
                      onChanged: (value) {
                        updateButtonColor();
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (p3) {},
                      controller: controllerP3,
                    ),
                  ],
                )),
            const SizedBox(height: ProjectSizes.defaultSize),
            isError
                ? DefaultText(
                    title: errorMessage,
                    color: Theme.of(context).colorScheme.error,
                  )
                : const SizedBox(),
            const SizedBox(height: ProjectSizes.largeSize),
            MyElevatedButton(
              title: "title",
              onTap: () {
                //_formKey.currentState?.save();
                if (controllerP0.text +
                        controllerP1.text +
                        controllerP2.text +
                        controllerP3.text ==
                    '1234') {
                  NavigatorManager.instance.pushToPage(NavigateRoutes.vacancy);
                } else {
                  controllerP0.clear();
                  controllerP1.clear();
                  controllerP2.clear();
                  controllerP3.clear();
                  isError = true;
                }
                setState(() {});
              },
              color: buttonColor,
              textColor: ColorConstants.white,
            )
          ],
        ),
      ),
    );
  }
}

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({
    Key? key,
    this.onSaved,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final void Function(String?)? onSaved;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ProjectSizes.xlSize,
      height: ProjectSizes.xlSize,
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        // textInputAction: TextInputAction.next,
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: ColorConstants.iconColor, fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          contentPadding: const ProjectPadding.symmetric(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ProjectSizes.radius),
            borderSide: const BorderSide(
                width: 1,
                color: ColorConstants
                    .blue), // Buradaki renk istediğiniz renk olabilir
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ProjectSizes.radius),
              borderSide: const BorderSide(color: ColorConstants.iconColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
