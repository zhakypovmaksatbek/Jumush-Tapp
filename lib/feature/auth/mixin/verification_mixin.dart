import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/auth/verification_page.dart';
import 'package:jumush_tapp/product/constants/color_constants.dart';

mixin VerificationMixin on State<VerificationPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController controllerP0 = TextEditingController();
  final TextEditingController controllerP1 = TextEditingController();
  final TextEditingController controllerP2 = TextEditingController();
  final TextEditingController controllerP3 = TextEditingController();

  @override
  void dispose() {
    controllerP0.dispose();
    controllerP1.dispose();
    controllerP2.dispose();
    controllerP3.dispose();
    super.dispose();
  }

  String errorMessage = "Not Success verification";
  Color? buttonColor;
  String? verificationCode;
  bool isError = false;
  void updateButtonColor() {
    verificationCode = controllerP0.text +
        controllerP1.text +
        controllerP2.text +
        controllerP3.text;

    setState(() {
      isError = false;
      buttonColor = verificationCode!.length == 4
          ? ColorConstants.blue
          : ColorConstants.grey;
    });
  }
}
